import 'package:flutter/material.dart';
import 'package:one_one_learn/configs/app_configs/app_extensions.dart';
import 'package:one_one_learn/presentations/widgets/others/linked_scroll_controller.dart';

class MultipleScrollDirectionBoard extends StatefulWidget {
  const MultipleScrollDirectionBoard({
    super.key,
    this.rowCount = 0,
    this.columnCount = 0,
    this.cellWidth = 100,
    this.cellHeight = 46,
    this.headerHeight = 68,
    this.firstColumnWidth = 100,
    this.useDefaultDivider = true,
    this.lazyRenderDataRow = true,
    this.lazyRenderDataColumn = true,
    this.firstCellBuilder,
    this.headerCellBuilder,
    this.bodyHeaderCellBuilder,
    this.bodyDataCellBuilder,
    this.onBodyDataCellTap,
  });

  final int rowCount, columnCount;
  final double cellWidth, cellHeight, headerHeight, firstColumnWidth;
  final bool useDefaultDivider, lazyRenderDataRow, lazyRenderDataColumn;
  final Widget Function(BuildContext context)? firstCellBuilder;
  final Widget Function(BuildContext context, int column)? headerCellBuilder;
  final Widget Function(BuildContext context, int row)? bodyHeaderCellBuilder;
  final Widget Function(BuildContext context, int, int column)? bodyDataCellBuilder;
  final Function(int row, int column)? onBodyDataCellTap;

  @override
  createState() => _MultipleScrollDirectionBoardState();
}

class _MultipleScrollDirectionBoardState extends State<MultipleScrollDirectionBoard> {
  final _controllers = LinkedScrollControllerGroup();
  late final ScrollController _headController;
  late final ScrollController _bodyController;

  @override
  void initState() {
    super.initState();
    _headController = _controllers.addAndGet();
    _bodyController = _controllers.addAndGet();
  }

  @override
  void dispose() {
    _headController.dispose();
    _bodyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableHead(
          scrollController: _headController,
          firstColumnWidth: widget.firstColumnWidth,
          otherWidth: widget.cellWidth,
          height: widget.headerHeight,
          headerDataLength: widget.columnCount,
          firstCellBuilder: widget.firstCellBuilder,
          otherCellsBuilder: widget.headerCellBuilder,
        ),
        Expanded(
          child: TableBody(
            // use when want data body is ListView.builder vertical wrap ListView.builder horizontal
            // scrollController: _headController,
            // horizontalScrollControllerLinker: _controllers,
            scrollController: _bodyController,
            lazyRenderDataRow: widget.lazyRenderDataRow,
            lazyRenderDataColumn: widget.lazyRenderDataColumn,
            cellHeight: widget.cellHeight,
            cellWidth: widget.cellWidth,
            firstColumnWidth: widget.firstColumnWidth,
            numberOfRows: widget.rowCount,
            numberOfColumns: widget.columnCount,
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
  // use when want data body is ListView.builder vertical wrap ListView.builder horizontal
  // final LinkedScrollControllerGroup horizontalScrollControllerLinker;
  final ScrollController scrollController;
  final double cellHeight, cellWidth, firstColumnWidth;
  final int numberOfRows, numberOfColumns;
  final bool hasDivider, lazyRenderDataRow, lazyRenderDataColumn;
  final Widget Function(BuildContext context, int index)? firstColumnCellBuilder;
  final Widget Function(BuildContext context, int row, int coulumn)? otherColumnCellBuilder;
  final Function(int row, int coulmn)? onBodyDataCellTap;

  const TableBody({
    super.key,
    // required this.horizontalScrollControllerLinker,
    required this.scrollController,
    this.hasDivider = true,
    this.lazyRenderDataRow = true,
    this.lazyRenderDataColumn = true,
    this.firstColumnCellBuilder,
    this.otherColumnCellBuilder,
    required this.cellHeight,
    required this.cellWidth,
    required this.firstColumnWidth,
    required this.numberOfRows,
    required this.numberOfColumns,
    required this.onBodyDataCellTap,
  });

  @override
  createState() => _TableBodyState();
}

class _TableBodyState extends State<TableBody> {
  LinkedScrollControllerGroup? _controllers;
  ScrollController? _firstColumnController;
  ScrollController? _restColumnController;
  List<ScrollController?>? _restColumnControllers;

  @override
  void initState() {
    super.initState();
    _controllers = LinkedScrollControllerGroup();
    _firstColumnController = _controllers?.addAndGet();
    if (widget.lazyRenderDataRow) {
      _restColumnControllers = [];
      // use when want data body is a horizontal list wrap vertical lists
      for (var i = 0; i < widget.numberOfColumns; i++) {
        _restColumnControllers?.add(_controllers?.addAndGet());
      }
    } else {
      _restColumnController = _controllers?.addAndGet();
    }

    // use when want data body is ListView.builder vertical wrap ListView.builder horizontal
    // _restColumnController = _controllers?.addAndGet();
    // _restColumnControllers = [];
    // for (var i = 0; i < widget.bodyData[0].length; i++) {
    //   _restColumnControllers?.add(widget.horizontalScrollControllerLinker.addAndGet());
    // }
  }

  @override
  void dispose() {
    _firstColumnController?.dispose();
    _restColumnController?.dispose();
    // use when want data body is a horizontal list wrap vertical lists
    if (_restColumnControllers != null) {
      for (var i = 0; i < widget.numberOfColumns; i++) {
        _restColumnControllers?[i]?.dispose();
      }
    }

    // use when want data body is ListView.builder vertical wrap ListView.builder horizontal
    // for (var i = 0; i < widget.bodyData[0].length; i++) {
    //   _restColumnControllers?[i]?.dispose();
    // }
    _restColumnControllers?.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: widget.firstColumnWidth,
          decoration: BoxDecoration(
            border: Border(
              right: BorderSide(
                color: context.theme.colorScheme.outline,
              ),
            ),
          ),
          child: ListView.builder(
            controller: _firstColumnController,
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
          // child: ListView(
          //     controller: _firstColumnController,
          //     physics: const AlwaysScrollableScrollPhysics(
          //       parent: ClampingScrollPhysics(),
          //     ),
          //   children: [
          //     for (var i = 0; i < widget.bodyData[0].length; i++) ...[
          //       SizedBox(
          //         width: widget.cellWidth,
          //         child: TableBodyCell(
          //           color: i.isEven ? Colors.white : HexColor.fromHex('EEF4FF'),
          //           content: widget.bodyData[0][i] ?? 'null',
          //           textAlign: TextAlign.center,
          //           isShowDate: false,
          //           dateSelected: widget.bodyData[0][i] ?? 'null',
          //         ),
          //       ),
          //     ],
          //   ],
          // ),
        ),
        Expanded(
          child: GestureDetector(
            onPanUpdate: (details) {
              // horizontal scroll
              final newDx = widget.scrollController.offset - details.delta.dx;
              if (newDx > 0 && newDx < widget.scrollController.position.maxScrollExtent) {
                widget.scrollController.jumpTo(newDx);
              }

              // vertical scroll
              final newDy = _firstColumnController!.offset - details.delta.dy;
              if (newDy > 0 && newDy < _firstColumnController!.position.maxScrollExtent) {
                _firstColumnController?.jumpTo(newDy);
              }
            },
            // use when want data body is a horizontal list wrap vertical lists
            child: buildBodyRestColumns(context, widget.numberOfRows, widget.numberOfColumns),

            // use when want data body is ListView.builder vertical wrap ListView.builder horizontal
            // child: SizedBox(
            //   width: widget.cellHeight * numberOfDataColumns,
            //   child: ListView.builder(
            //     controller: _restColumnController,
            //     physics: const AlwaysScrollableScrollPhysics(
            //       parent: ClampingScrollPhysics(),
            //     ),
            //     itemCount: widget.bodyData[0].length,
            //     itemBuilder: (rowContext, rowIndex) {
            //       return SizedBox(
            //         height: widget.cellHeight,
            //         child: ListView.builder(
            //           controller: _restColumnControllers?[rowIndex],
            //           physics: const AlwaysScrollableScrollPhysics(
            //             parent: ClampingScrollPhysics(),
            //           ),
            //           scrollDirection: Axis.horizontal,
            //           itemCount: numberOfDataColumns,
            //           itemBuilder: (restColumnContext, colIndex) {
            //             return SizedBox(
            //               width: widget.cellWidth,
            //               child: TableBodyCell(
            //                 isShowDate: false,
            //                 onPress: (dateSelected) {
            //                   widget.onPress.call(dateSelected);
            //                 },
            //                 color: rowIndex.isEven ? Colors.white : HexColor.fromHex('EEF4FF'),
            //                 content: widget.bodyData[colIndex + 1][rowIndex] ?? 'null',
            //                 textAlign: TextAlign.center,
            //                 dateSelected: widget.bodyData[0][rowIndex].toString(),
            //               ),
            //             );
            //           },
            //         ),
            //       );
            //     },
            //   ),
            // ),
          ),
        ),
      ],
    );
  }

  Widget buildBodyRestColumns(BuildContext context, int rowCount, int columnCount) {
    if (widget.lazyRenderDataRow && widget.lazyRenderDataColumn) {
      // full ListView.builder
      // return ListView.builder(
      //   controller: widget.scrollController,
      //   scrollDirection: Axis.horizontal,
      //   physics: const ClampingScrollPhysics(),
      //   itemCount: numberOfDataColumns,
      //   itemBuilder: (restColumnContext, index) {
      //     return SizedBox(
      //       width: widget.cellWidth,
      //       child: ListView.builder(
      //         controller: _restColumnControllers?[index],
      //         physics: const AlwaysScrollableScrollPhysics(
      //           parent: ClampingScrollPhysics(),
      //         ),
      //         itemCount: widget.bodyData[index + 1].length,
      //         itemBuilder: (singleColumnContext, singleIndex) {
      //           return TableBodyCell(
      //             color: context.theme.highlightColor,
      //             content: widget.bodyData[index + 1][singleIndex] ?? 'null',
      //             textAlign: TextAlign.center,
      //             isShowDate: false,
      //             dateSelected: widget.bodyData[0][singleIndex] ?? 'null',
      //           );
      //         },
      //       ),
      //     );
      //   },
      // );
      return CustomScrollView(
        controller: widget.scrollController,
        scrollDirection: Axis.horizontal,
        physics: const ClampingScrollPhysics(),
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, column) {
                return SizedBox(
                  width: widget.cellWidth,
                  child: CustomScrollView(
                    controller: _restColumnControllers?[column],
                    physics: const AlwaysScrollableScrollPhysics(
                      parent: ClampingScrollPhysics(),
                    ),
                    slivers: [
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, row) {
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
                          childCount: rowCount,
                        ),
                      ),
                    ],
                  ),
                );
              },
              childCount: columnCount,
            ),
          ),
        ],
      );
    } else if (!widget.lazyRenderDataRow && widget.lazyRenderDataColumn) {
      // SingleChildScrollView horizontal with ListView.builder vertical
      return SingleChildScrollView(
        controller: widget.scrollController,
        scrollDirection: Axis.horizontal,
        physics: const ClampingScrollPhysics(),
        child: SizedBox(
          width: columnCount * widget.cellWidth,
          child: ListView.builder(
            controller: _restColumnController,
            physics: const AlwaysScrollableScrollPhysics(
              parent: ClampingScrollPhysics(),
            ),
            itemCount: rowCount,
            itemBuilder: (resColumnContext, row) {
              return Row(
                children: List.generate(
                  columnCount,
                  (column) {
                    return SizedBox(
                      width: widget.cellWidth,
                      child: TableBodyCell(
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
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      );
    } else if (widget.lazyRenderDataRow && !widget.lazyRenderDataColumn) {
      // SingleChildScrollView vertical with ListView.builder horizontal
      return ListView.builder(
        controller: widget.scrollController,
        scrollDirection: Axis.horizontal,
        physics: const ClampingScrollPhysics(),
        itemCount: columnCount,
        itemBuilder: (restColumnContext, column) {
          return SizedBox(
            width: widget.cellWidth,
            child: ListView(
              controller: _restColumnControllers?[column],
              physics: const AlwaysScrollableScrollPhysics(
                parent: ClampingScrollPhysics(),
              ),
              children: [
                for (var row = 0; row < rowCount; row++) ...[
                  SizedBox(
                    height: widget.cellHeight,
                    child: TableBodyCell(
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
                    ),
                  ),
                ],
              ],
            ),
          );
        },
      );
    }
    // SingleChildScrollView horizontal
    // with ListView vertical (full un-lazy rendered)
    return SingleChildScrollView(
      controller: widget.scrollController,
      scrollDirection: Axis.horizontal,
      physics: const ClampingScrollPhysics(),
      child: SizedBox(
        width: columnCount * widget.cellWidth,
        child: ListView(
          controller: _restColumnController,
          physics: const AlwaysScrollableScrollPhysics(
            parent: ClampingScrollPhysics(),
          ),
          children: [
            for (var row = 0; row < rowCount; row++) ...[
              Row(
                children: [
                  for (var column = 0; column < columnCount; column++) ...[
                    SizedBox(
                      width: widget.cellWidth,
                      child: TableBodyCell(
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
                      ),
                    ),
                  ],
                ],
              ),
            ]
          ],
        ),
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
      onTap: () {
        onTap?.call();
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
        child: child,
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
    required this.firstColumnWidth,
    required this.otherWidth,
    required this.height,
    this.headerDataLength = 0,
    this.firstCellBuilder,
    this.otherCellsBuilder,
  });

  final ScrollController scrollController;
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
          TableHeaderCell(
            width: firstColumnWidth,
            height: height,
            color: context.theme.colorScheme.outlineVariant.withOpacity(0.6),
            child: firstCellBuilder != null
                ? firstCellBuilder!(context) : const SizedBox(),
          ),

          // other cells of board's header
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              physics: const ClampingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: headerDataLength,
              itemBuilder: (headerContext, index) {
                return TableHeaderCell(
                  width: otherWidth,
                  height: height,
                  color: context.theme.colorScheme.background,
                  child: otherCellsBuilder != null
                      ? otherCellsBuilder!(headerContext, index)
                      : const SizedBox(),
                );
              },
            ),
            // child: ListView(
            //     controller: scrollController,
            //     physics: const ClampingScrollPhysics(),
            //     scrollDirection: Axis.horizontal,
            //     children: header.isNotEmpty == true
            //         ? header
            //         .sublist(1, header.length)
            //         .map((element) => MultiplicationTableHeaderCell(
            //       textAlign: TextAlign.center,
            //       content: element ?? '',
            //       width: 100,
            //     ))
            //         .toList()
            //         : []),
          ),
        ],
      ),
    );
  }
}
