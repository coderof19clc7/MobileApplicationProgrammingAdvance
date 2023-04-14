import 'package:flutter/material.dart';
import 'package:one_one_learn/utils/extensions/app_extensions.dart';
import 'package:one_one_learn/configs/constants/colors.dart';
import 'package:vector_math/vector_math_64.dart' show Quad, Vector3;

// version using 2 ListView.builder
// (horizontal for header and vertical for body's header)
// and an interactiveViewer for body's data
class MultipleScrollDirectionBoard2 extends StatefulWidget {
  const MultipleScrollDirectionBoard2({
    super.key,
    this.rowCount = 0,
    this.columnCount = 0,
    this.cellWidth = 100,
    this.cellHeight = 46,
    this.headerHeight = 68,
    this.firstColumnWidth = 100,
    this.useDefaultDivider = true,
    this.firstCellBuilder,
    this.headerCellBuilder,
    this.bodyHeaderCellBuilder,
    this.bodyDataCellBuilder,
    this.onBodyDataCellTap,
  });

  final int rowCount, columnCount;
  final double cellWidth, cellHeight, headerHeight, firstColumnWidth;
  final bool useDefaultDivider;
  final Widget Function(BuildContext context)? firstCellBuilder;
  final Widget Function(BuildContext context, int column)? headerCellBuilder;
  final Widget Function(BuildContext context, int row)? bodyHeaderCellBuilder;
  final Widget Function(BuildContext context, int, int column)? bodyDataCellBuilder;
  final Function(int row, int column)? onBodyDataCellTap;

  @override
  createState() => _MultipleScrollDirectionBoard2State();
}

class _MultipleScrollDirectionBoard2State
    extends State<MultipleScrollDirectionBoard2> {
  late final ScrollController _headController;
  late final ScrollController _bodyHeaderController;
  late final TransformationController _transformationController;
  var isHandlingScrollEvent = false;

  @override
  void initState() {
    super.initState();
    // init controllers
    _headController = ScrollController();
    _bodyHeaderController = ScrollController();
    _transformationController = TransformationController();
    _transformationController.addListener(onTransformationValueUpdated);
  }

  @override
  void dispose() {
    // dispose controllers
    _headController.dispose();
    _bodyHeaderController.dispose();
    _transformationController
      ..removeListener(onTransformationValueUpdated)
      ..dispose();
    super.dispose();
  }

  // update transformationController's value
  void onScrollPositionUpdated(double scrollDelta) {
    if (isHandlingScrollEvent) return;
    // prevent any other update callbacks from executing
    isHandlingScrollEvent = true;

    _transformationController.value = Matrix4.translationValues(
      -_headController.offset,
      -_bodyHeaderController.offset,
      0,
    );

    // allow other update callbacks execute
    isHandlingScrollEvent = false;
  }

  // update position of scrollControllers
  void onTransformationValueUpdated() {
    if (isHandlingScrollEvent) return;
    // prevent any other update callbacks from executing
    isHandlingScrollEvent = true;

    final matrix4 = _transformationController.value;
    final dx = matrix4.getTranslation().x;
    final dy = matrix4.getTranslation().y;

    _bodyHeaderController.jumpTo(-dy);
    _headController.jumpTo(-dx);

    // allow other update callbacks execute
    isHandlingScrollEvent = false;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // header
        TableHead(
          scrollController: _headController,
          onScroll: onScrollPositionUpdated,
          firstColumnWidth: widget.firstColumnWidth,
          otherWidth: widget.cellWidth,
          height: widget.headerHeight,
          hasDivider: widget.useDefaultDivider,
          headerDataLength: widget.columnCount,
          firstCellBuilder: widget.firstCellBuilder,
          otherCellsBuilder: widget.headerCellBuilder,
        ),

        // body
        Expanded(
          child: TableBody(
            bodyHeaderScrollController: _bodyHeaderController,
            transformationController: _transformationController,
            onBodyHeadScroll: onScrollPositionUpdated,
            onBodyDataInteract: onTransformationValueUpdated,
            cellHeight: widget.cellHeight,
            cellWidth: widget.cellWidth,
            firstColumnWidth: widget.firstColumnWidth,
            numberOfRows: widget.rowCount,
            numberOfColumns: widget.columnCount,
            hasDivider: widget.useDefaultDivider,
            firstColumnCellBuilder: widget.bodyHeaderCellBuilder,
            otherColumnCellBuilder: widget.bodyDataCellBuilder,
            onBodyDataCellTap: widget.onBodyDataCellTap,
          ),
        ),
      ],
    );
  }
}

class TableBody extends StatefulWidget {
  final ScrollController bodyHeaderScrollController;
  final TransformationController transformationController;
  final Function(double) onBodyHeadScroll;
  final Function() onBodyDataInteract;
  final double cellHeight, cellWidth, firstColumnWidth;
  final int numberOfRows, numberOfColumns;
  final bool hasDivider;
  final Widget Function(BuildContext context, int index)? firstColumnCellBuilder;
  final Widget Function(BuildContext context, int row, int coulumn)? otherColumnCellBuilder;
  final Function(int row, int coulmn)? onBodyDataCellTap;

  const TableBody({
    super.key,
    required this.bodyHeaderScrollController,
    required this.transformationController,
    required this.onBodyHeadScroll,
    required this.onBodyDataInteract,
    required this.cellHeight,
    required this.cellWidth,
    required this.firstColumnWidth,
    this.numberOfRows = 0,
    this.numberOfColumns = 0,
    this.hasDivider = true,
    this.firstColumnCellBuilder,
    this.otherColumnCellBuilder,
    this.onBodyDataCellTap,
  });

  @override
  createState() => _TableBodyState();
}

class _TableBodyState extends State<TableBody> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  // Returns the axis aligned bounding box for the given Quad, which might not
  // be axis aligned.
  Rect axisAlignedBoundingBox(Quad quad) {
    var xMin = quad.point0.x;
    var xMax = quad.point0.x;
    var yMin = quad.point0.y;
    var yMax = quad.point0.y;
    for (final point in <Vector3>[
      quad.point1,
      quad.point2,
      quad.point3,
    ]) {
      if (point.x < xMin) {
        xMin = point.x;
      } else if (point.x > xMax) {
        xMax = point.x;
      }

      if (point.y < yMin) {
        yMin = point.y;
      } else if (point.y > yMax) {
        yMax = point.y;
      }
    }

    return Rect.fromLTRB(xMin, yMin, xMax, yMax);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // first column
        Container(
          decoration: BoxDecoration(boxShadow: [Effects.faintShadowXS]),
          width: widget.firstColumnWidth,
          child: NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              if (notification is ScrollUpdateNotification) {
                widget.onBodyHeadScroll.call(notification.scrollDelta ?? 0);
              }
              return true;
            },
            child: ListView.builder(
              controller: widget.bodyHeaderScrollController,
              physics: const AlwaysScrollableScrollPhysics(
                parent: ClampingScrollPhysics(),
              ),
              itemCount: widget.numberOfRows,
              itemBuilder: (firstColumnContext, index) {
                return TableBodyCell(
                  width: widget.firstColumnWidth,
                  height: widget.cellHeight,
                  color: context.theme.colorScheme.background,
                  child: widget.firstColumnCellBuilder?.call(
                    firstColumnContext, index,
                  ),
                );
              },
            ),
          ),
        ),

        // data column (rest of column)
        Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return InteractiveViewer.builder(
                transformationController: widget.transformationController,
                scaleEnabled: false,
                builder: (dataFieldContext, dataFieldViewPort) {
                  return TableBodyDataBuilder(
                    numRows: widget.numberOfRows,
                    numColumns: widget.numberOfColumns,
                    cellWidth: widget.cellWidth,
                    cellHeight: widget.cellHeight,
                    viewport: axisAlignedBoundingBox(dataFieldViewPort),
                    builder: (BuildContext context, int row, int column) {
                      return TableBodyCell(
                        hasDivider: widget.hasDivider,
                        width: widget.cellWidth,
                        height: widget.cellHeight,
                        color: context.theme.colorScheme.surfaceVariant,
                        onTap: widget.onBodyDataCellTap == null
                            ? null
                            : () => widget.onBodyDataCellTap?.call(row, column),
                        child: widget.otherColumnCellBuilder?.call(
                          context, row, column,
                        ),
                      );
                    },
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

typedef CellBuilder = Widget Function(BuildContext context, int row, int column);

class TableBodyDataBuilder extends StatelessWidget {
  const TableBodyDataBuilder({
    super.key,
    required this.numRows,
    required this.numColumns,
    required this.cellWidth,
    required this.cellHeight,
    required this.viewport,
    required this.builder,
  });

  final int numRows, numColumns;
  final double cellWidth;
  final double cellHeight;
  final Rect viewport;
  final CellBuilder builder;

  @override
  Widget build(BuildContext context) {
    final firstRow = (viewport.top / cellHeight).floor().clamp(0, numRows);
    final lastRow = (viewport.bottom / cellHeight).ceil().clamp(0, numRows);
    final firstCol = (viewport.left / cellWidth).floor().clamp(0, numColumns);
    final lastCol = (viewport.right / cellWidth).ceil().clamp(0, numColumns);

    return SizedBox(
      width: numColumns * cellWidth,
      height: numRows * cellHeight,
      child: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          for (int row = firstRow; row < lastRow; row++)
            for (int col = firstCol; col < lastCol; col++)
              Positioned(
                left: col * cellWidth,
                top: row * cellHeight,
                child: builder(context, row, col),
              ),
        ],
      ),
    );
  }
}

class TableBodyCell extends StatelessWidget {
  final double width;
  final double height;
  final Color? color;
  final bool hasDivider;
  final Widget? child;
  final Function()? onTap;

  const TableBodyCell({
    super.key,
    required this.width,
    required this.height,
    this.color,
    this.hasDivider = true,
    this.child,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap == null ? null : () {
        onTap?.call();
      },
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          border: hasDivider ? Border(
            bottom: BorderSide(color: context.theme.colorScheme.scrim),
            right: BorderSide(color: context.theme.colorScheme.scrim),
          ) : null,
        ),
        alignment: Alignment.center,
        child: child,
        // Text(
        //   content,
        //   textAlign: textAlign,
        // ),
      ),
    );
  }
}

class TableHeaderCell extends StatelessWidget {
  final bool hasDivider;
  final Color? color;
  final double? width;
  final double? height;
  final Widget? child;

  const TableHeaderCell({
    super.key,
    this.hasDivider = true,
    this.color,
    this.width,
    this.height,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 100,
      height: height,
      decoration: BoxDecoration(
        color: color,
        border: hasDivider ? Border(
          top: BorderSide(color: context.theme.colorScheme.outline),
          right: BorderSide(color: context.theme.colorScheme.outline),
          bottom: BorderSide(color: context.theme.colorScheme.outline),
        ) : null,
      ),
      alignment: Alignment.center,
      child: child,
    );
  }
}

class TableHead extends StatelessWidget {
  const TableHead({
    super.key,
    required this.scrollController,
    required this.onScroll,
    required this.firstColumnWidth,
    required this.otherWidth,
    required this.height,
    this.hasDivider = true,
    this.headerDataLength = 0,
    this.firstCellBuilder,
    this.otherCellsBuilder,
  });

  final ScrollController scrollController;
  final Function(double) onScroll;
  final bool hasDivider;
  final int headerDataLength;
  final double firstColumnWidth, otherWidth, height;
  final Widget Function(BuildContext context)? firstCellBuilder;
  final Widget Function(BuildContext context, int index)? otherCellsBuilder;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Row(
        children: [
          // first cell of the board
          DecoratedBox(
            decoration: BoxDecoration(boxShadow: [Effects.faintShadowXS]),
            child: TableHeaderCell(
              width: firstColumnWidth,
              height: height,
              hasDivider: hasDivider,
              color: context.theme.colorScheme.outlineVariant.withOpacity(0.6),
              child: firstCellBuilder != null
                  ? firstCellBuilder!(context) : const SizedBox(),
            ),
          ),

          // other cells of board's header
          Expanded(
            child: NotificationListener<ScrollNotification>(
              onNotification: (notification) {
                if (notification is ScrollUpdateNotification) {
                  onScroll(notification.scrollDelta ?? 0);
                }
                return true;
              },
              child: DecoratedBox(
                decoration: BoxDecoration(boxShadow: [Effects.faintShadowXS]),
                child: ListView.builder(
                  controller: scrollController,
                  physics: const ClampingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: headerDataLength,
                  itemBuilder: (headerContext, index) {
                    return TableHeaderCell(
                      width: otherWidth,
                      height: height,
                      hasDivider: hasDivider,
                      color: context.theme.colorScheme.background,
                      child: otherCellsBuilder != null
                          ? otherCellsBuilder!(headerContext, index)
                          : const SizedBox(),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
