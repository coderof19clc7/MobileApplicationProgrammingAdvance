import 'package:flutter/material.dart';
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
