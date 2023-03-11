import 'package:flutter/material.dart';
import 'package:one_one_learn/configs/constants/colors.dart';
import 'package:one_one_learn/presentations/widgets/others/linked_scroll_controller.dart';

class MultipleScrollDirectionBoard extends StatefulWidget {
  const MultipleScrollDirectionBoard({super.key,
    required this.onPress,
    this.headerData = const [],
    this.bodyData = const [],
    this.cellWidth = 100,
    this.cellHeight = 46,
    this.headerHeight = 68,
    this.firstColumnWidth = 50,
  });

  final List<String?> headerData;
  final List<List<String?>> bodyData;
  final double cellWidth;
  final double cellHeight;
  final double headerHeight;
  final double firstColumnWidth;
  final Function(String dateSelected) onPress;

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
          height: widget.headerHeight,
          width: widget.cellWidth,
          headerData: widget.headerData,
          scrollController: _headController,
        ),

        Expanded(
          child: TableBody(
            scrollController: _bodyController,
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
  final ScrollController scrollController;
  final List<List<String?>> bodyData;
  final double cellHeight;
  final double cellWidth;
  final double firstColumnWidth;
  final int numberOfColumn;
  final Function(String dateSelected) onPress;

  const TableBody({super.key,
    required this.scrollController,
    this.bodyData = const [],
    required this.cellHeight,
    required this.cellWidth,
    required this.firstColumnWidth,
    required this.numberOfColumn,
    required this.onPress,
  });

  @override
  createState() => _TableBodyState();
}

class _TableBodyState extends State<TableBody> {
  LinkedScrollControllerGroup? _controllers;
  ScrollController? _firstColumnController;
  ScrollController? _restColumnController;
  // List<ScrollController?>? _restColumnControllers;

  @override
  void initState() {
    super.initState();
    _controllers = LinkedScrollControllerGroup();
    _firstColumnController = _controllers?.addAndGet();
    _restColumnController = _controllers?.addAndGet();
    // _restColumnControllers = [];
    // for (var i = 0; i < widget.numberOfColumn - 1; i++) {
    //   _restColumnControllers?.add(_controllers?.addAndGet());
    // }
  }

  @override
  void dispose() {
    _firstColumnController?.dispose();
    _restColumnController?.dispose();
    // for (var i = 0; i < widget.numberOfColumn - 1; i++) {
    //   _restColumnControllers?[i]?.dispose();
    // }
    // _restColumnControllers?.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final numberOfDataColumns = (widget.numberOfColumn - 1) > 0
        ? (widget.numberOfColumn - 1) : 0;
    return Row(
      children: [
        SizedBox(
          width: widget.firstColumnWidth,
          child: ListView.builder(
            controller: _firstColumnController,
            physics: const AlwaysScrollableScrollPhysics(
              parent: ClampingScrollPhysics(),
            ),
            itemCount: widget.bodyData[0].length,
            itemBuilder: (firstColumnContext, index) {
              return TableBodyCell(
                isShowDate: true,
                onPress: (dateSelected) {
                  widget.onPress.call(dateSelected);
                },
                color: index.isEven ? Colors.white : HexColor.fromHex('EEF4FF'),
                content: widget.bodyData[0][index] ?? 'null',
                textAlign: TextAlign.left,
                dateSelected: widget.bodyData[0][index].toString(),
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
            // child: SingleChildScrollView(
            //   controller: widget.scrollController,
            //   scrollDirection: Axis.horizontal,
            //   physics: const ClampingScrollPhysics(),
            //   child: SizedBox(
            //     width: numberOfDataColumns * widget.cellWidth,
            //     child: ListView.builder(
            //       controller: _restColumnController,
            //       physics: const AlwaysScrollableScrollPhysics(
            //         parent: ClampingScrollPhysics(),
            //       ),
            //       itemCount: widget.bodyData[0].length,
            //       itemBuilder: (resColumnContext, index) {
            //         return Row(
            //             children: List.generate(numberOfDataColumns, (indexCol) {
            //               return SizedBox(
            //                 width: widget.cellWidth,
            //                 child: TableBodyCell(
            //                   color: index.isEven ? Colors.white : HexColor.fromHex('EEF4FF'),
            //                   content: widget.bodyData[indexCol + 1][index] ?? 'null',
            //                   textAlign: TextAlign.center,
            //                   isShowDate: false,
            //                   dateSelected: widget.bodyData[0][index] ?? 'null',
            //                 ),
            //               );
            //             })
            //         );
            //       },
            //     ),
            //   ),
            // ),
            // child: ListView.builder(
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
            //             color: singleIndex.isEven ? Colors.white : HexColor.fromHex('EEF4FF'),
            //             content: widget.bodyData[index + 1][singleIndex] ?? 'null',
            //             textAlign: TextAlign.center,
            //             isShowDate: false,
            //             dateSelected: widget.bodyData[0][singleIndex] ?? 'null',
            //           );
            //         },
            //       ),
            //     );
            //   },
            // ),
            child: SingleChildScrollView(
              controller: widget.scrollController,
              scrollDirection: Axis.horizontal,
              physics: const ClampingScrollPhysics(),
              child: SizedBox(
                width: numberOfDataColumns * widget.cellWidth,
                child: ListView(
                  controller: _restColumnController,
                  physics: const AlwaysScrollableScrollPhysics(
                    parent: ClampingScrollPhysics(),
                  ),
                  children: [
                    for (var i = 0; i < widget.bodyData[0].length; i++) ...[
                      Row(
                        children: [
                          for (var j = 0; j < numberOfDataColumns; j++) ...[
                            SizedBox(
                              width: widget.cellWidth,
                              child: TableBodyCell(
                                color: i.isEven ? Colors.white : HexColor.fromHex('EEF4FF'),
                                content: widget.bodyData[j + 1][i] ?? 'null',
                                textAlign: TextAlign.center,
                                isShowDate: false,
                                dateSelected: widget.bodyData[0][i] ?? 'null',
                              ),
                            ),
                          ],
                        ],
                      ),
                    ]
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
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
            top: BorderSide(color: AppColors.primaryBlue200),
            bottom: BorderSide(color: AppColors.primaryBlue400, width: 1.5)),
      ),
      alignment: Alignment.center,
      child: Text(
        content,
        textAlign: textAlign,
      ),
    );
  }
}

class TableHead extends StatelessWidget {
  final ScrollController scrollController;

  const TableHead({
    super.key,
    required this.scrollController,
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
            color: Colors.white,
            content: headerData[0] ?? '',
            width: 50,
            textAlign: TextAlign.left,
          )
              : Container(),

          Expanded(
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
