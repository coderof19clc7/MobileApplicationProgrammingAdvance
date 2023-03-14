import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:one_one_learn/configs/app_configs/app_extensions.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/presentations/widgets/others/linked_scroll_controller.dart';
import 'package:vector_math/vector_math_64.dart' show Quad, Vector3;

class MultipleScrollDirectionBoardWithInteractiveViewerBuilder extends StatefulWidget {
  const MultipleScrollDirectionBoardWithInteractiveViewerBuilder({
    super.key,
    required this.onPress,
    this.headerData = const [],
    this.bodyData = const [],
    this.cellWidth = 100,
    this.cellHeight = 46,
    this.headerHeight = 68,
    this.firstColumnWidth = 100,
  });

  final List<String?> headerData;
  final List<List<String?>> bodyData;
  final double cellWidth;
  final double cellHeight;
  final double headerHeight;
  final double firstColumnWidth;
  final Function(String dateSelected) onPress;

  @override
  createState() => _MultipleScrollDirectionBoardWithInteractiveViewerBuilderState();
}

class _MultipleScrollDirectionBoardWithInteractiveViewerBuilderState extends State<MultipleScrollDirectionBoardWithInteractiveViewerBuilder> {
  late final ScrollController _headController;
  late final ScrollController _bodyHeaderController;
  late final TransformationController _transformationController;
  var _prevHorizontalOffset = 0.0, _prevVerticalOffset = 0.0;
  var isBodyDataScrolled = false;

  @override
  void initState() {
    super.initState();
    // init controllers
    _headController = ScrollController();
    _bodyHeaderController = ScrollController();
    _transformationController = TransformationController();
  }

  @override
  void dispose() {
    _headController.dispose();
    _bodyHeaderController.dispose();
    _transformationController.dispose();
    super.dispose();
  }

  // stop the animation of interactiveviewer when onInteractionEnd triggered


  bool onHeaderScroll() {
    if (isBodyDataScrolled) return false;
    final delta = _headController.offset - _prevHorizontalOffset;
    if (delta == 0) return false;
    _transformationController.value = (Matrix4.translationValues(
      -delta, 0, 0,
    ) * _transformationController.value) as Matrix4;
    _prevHorizontalOffset = _headController.offset;

    return true;
  }

  bool onBodyHeaderScroll() {
    if (isBodyDataScrolled) return false;
    final delta = _bodyHeaderController.offset - _prevVerticalOffset;
    if (delta == 0) return false;
    _transformationController.value = (Matrix4.translationValues(
      0, -delta, 0,
    ) * _transformationController.value) as Matrix4;
    _prevVerticalOffset = _bodyHeaderController.offset;

    return true;
  }

  bool onTransformationUpdate(bool isEndInteraction) {
    if (isEndInteraction == true) {
      print('onTransformationUpdate: ${_transformationController.value}');
      setState(() {
        isBodyDataScrolled = false;
      });
      return false;
    }
    if (isBodyDataScrolled == false) {
      setState(() {
        isBodyDataScrolled = true;
      });
    }
    final matrix4 = _transformationController.value;
    final dx = matrix4.getTranslation().x;
    final dy = matrix4.getTranslation().y;

    final deltaVertical = dy - _prevVerticalOffset;
    final deltaHorizontal = dx - _prevHorizontalOffset;

    _bodyHeaderController.jumpTo(-dy);
    _headController.jumpTo(-dx);

    _prevVerticalOffset = dy;
    _prevHorizontalOffset = dx;

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableHead(
          height: widget.headerHeight,
          width: widget.firstColumnWidth,
          headerData: widget.headerData,
          scrollController: _headController,
          onScroll: onHeaderScroll,
        ),
        Expanded(
          child: TableBody(
            onBodyHeadScroll: onBodyHeaderScroll,
            onBodyDataInteract: onTransformationUpdate,
            bodyHeaderScrollController: _bodyHeaderController,
            transformationController: _transformationController,
            bodyData: widget.bodyData,
            cellHeight: widget.cellHeight,
            cellWidth: widget.cellWidth,
            firstColumnWidth: widget.firstColumnWidth,
            numberOfColumn: widget.headerData.length,
            onPress: (String dateSelected) {
              widget.onPress.call(dateSelected);
            },
          ),
        ),
      ],
    );
  }
}

class TableBody extends StatefulWidget {
  final ScrollController bodyHeaderScrollController;
  final TransformationController transformationController;
  final List<List<String?>> bodyData;
  final double cellHeight;
  final double cellWidth;
  final double firstColumnWidth;
  final int numberOfColumn;
  final Function(String dateSelected) onPress;
  final bool Function() onBodyHeadScroll;
  final bool Function(bool isEndInteract) onBodyDataInteract;

  const TableBody({
    super.key,
    required this.bodyHeaderScrollController,
    required this.transformationController,
    this.bodyData = const [],
    required this.cellHeight,
    required this.cellWidth,
    required this.firstColumnWidth,
    required this.numberOfColumn,
    required this.onPress,
    required this.onBodyHeadScroll,
    required this.onBodyDataInteract,
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
    final numberOfDataColumns = (widget.numberOfColumn - 1) > 0
        ? (widget.numberOfColumn - 1) : 0;
    final numberOfDataRows = widget.bodyData[0].length;

    return Row(
      children: [
        // first column
        Container(
          width: widget.firstColumnWidth,
          decoration: BoxDecoration(
            border: Border(
              right: BorderSide(color: context.theme.colorScheme.outline),
            ),
          ),
          child: NotificationListener<ScrollNotification>(
            onNotification: (scrollNotification) {
              if (scrollNotification is ScrollUpdateNotification) {
                return widget.onBodyHeadScroll.call();
              }
              return false;
            },
            child: ListView.builder(
              controller: widget.bodyHeaderScrollController,
              physics: const AlwaysScrollableScrollPhysics(
                parent: ClampingScrollPhysics(),
              ),
              itemCount: numberOfDataRows,
              itemBuilder: (firstColumnContext, index) {
                return TableBodyCell(
                  isShowDate: true,
                  onPress: (dateSelected) {
                    widget.onPress.call(dateSelected);
                  },
                  color: context.theme.colorScheme.background,
                  content: widget.bodyData[0][index] ?? 'null',
                  textAlign: TextAlign.left,
                  dateSelected: widget.bodyData[0][index].toString(),
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
                // scaleEnabled: false,
                onInteractionUpdate: (details) {
                  print('onInteractionUpdate');
                  print('pointNumber: ${details.pointerCount}');
                  widget.onBodyDataInteract.call(false);
                },
                onInteractionEnd: (details) {
                  print('onInteractionEnd: $details');
                  widget.onBodyDataInteract.call(true);
                },
                builder: (dataFieldContext, dataFieldViewPort) {
                  return TableBodyDataBuilder(
                    numRows: numberOfDataRows,
                    numColumns: numberOfDataColumns,
                    cellWidth: widget.cellWidth,
                    cellHeight: widget.cellHeight,
                    viewport: axisAlignedBoundingBox(dataFieldViewPort),
                    builder: (BuildContext context, int row, int column) {
                      return TableBodyCell(
                        color: context.theme.highlightColor,
                        content: widget.bodyData[column + 1][row] ?? 'null',
                        textAlign: TextAlign.center,
                        isShowDate: false,
                        dateSelected: widget.bodyData[0][row] ?? 'null',
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

typedef CellBuilder = Widget Function(
    BuildContext context, int row, int column);

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
  final bool isShowDate;
  final String content;
  final Color? color;
  final double width;
  final double height;
  final TextAlign textAlign;
  final String dateSelected;
  final Function(String dateSelected)? onPress;

  const TableBodyCell({
    super.key,
    required this.content,
    this.color,
    required this.isShowDate,
    this.width = 100,
    this.height = 46,
    this.onPress,
    required this.dateSelected,
    this.textAlign = TextAlign.right,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPress?.call(dateSelected);
      },
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          border: Border(
            bottom: BorderSide(
              color: context.theme.colorScheme.scrim,
            ),
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          content,
          textAlign: textAlign,
        ),
      ),
    );
  }
}

class TableHeaderCell extends StatelessWidget {
  final String content;
  final Color? color;
  final double? width;
  final double? height;
  final TextAlign textAlign;

  const TableHeaderCell({
    super.key,
    this.color,
    required this.content,
    this.width,
    this.height,
    this.textAlign = TextAlign.right,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 100,
      height: double.infinity,
      decoration: BoxDecoration(
        color: color,
        border: Border(
          top: BorderSide(color: context.theme.colorScheme.outline),
          right: BorderSide(color: context.theme.colorScheme.outline),
          bottom: BorderSide(color: context.theme.colorScheme.outline),
        ),
      ),
      alignment: Alignment.center,
      child: Text(
        content,
        textAlign: textAlign,
        style: Dimens.getProportionalFont(context, context.theme.textTheme.bodyMedium).copyWith(
          fontSize: Dimens.getProportionalScreenWidth(context, 14),
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class TableHead extends StatelessWidget {
  final ScrollController scrollController;
  final bool Function() onScroll;

  const TableHead({
    super.key,
    required this.scrollController,
    required this.onScroll,
    this.headerData = const [],
    this.width,
    this.height,
  });

  final List<String?> headerData;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 68,
      child: Row(
        children: [
          headerData.isNotEmpty
              ? TableHeaderCell(
            color: context.theme.colorScheme.outlineVariant.withOpacity(0.6),
            content: headerData[0] ?? '',
            width: width,
            textAlign: TextAlign.left,
          )
              : Container(),
          Expanded(
            child: NotificationListener<ScrollNotification>(
              onNotification: (notification) {
                if (notification is ScrollUpdateNotification) {
                  return onScroll();
                }
                return false;
              },
              child: ListView.builder(
                controller: scrollController,
                physics: const ClampingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: headerData.length - 1,
                itemBuilder: (headerContext, index) {
                  return TableHeaderCell(
                    textAlign: TextAlign.center,
                    content: headerData[index + 1] ?? '',
                    width: 100,
                    color: context.theme.colorScheme.background,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
