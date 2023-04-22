import 'package:flutter/material.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/utils/extensions/app_extensions.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class CourseDetailPage extends StatelessWidget {
  const CourseDetailPage({
    super.key,
    required this.topicUrl,
    required this.topicName,
    required this.topicIndex,
  });

  final String topicUrl, topicName, topicIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          margin: EdgeInsets.only(
            left: Dimens.getProportionalWidth(context, 15),
          ),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_outlined,
              color: context.theme.colorScheme.onBackground,
              size: Dimens.getProportionalWidth(context, 28),
            ),
          ),
        ),
        title: Text(
          topicName,
          overflow: TextOverflow.ellipsis,
          softWrap: false,
          maxLines: 2,
          style: Dimens.getProportionalFont(
            context, context.theme.textTheme.displayLarge,
          ).copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: context.theme.colorScheme.background,
      ),
      body: Center(
        child: SfPdfViewer.network(
          topicUrl,
          canShowScrollHead: false,
          canShowScrollStatus: false,
        ),
      ),
    );
  }
}
