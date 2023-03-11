import 'package:flutter/material.dart';
import 'package:one_one_learn/presentations/screens/course_detail/course_detail_page.dart';

class CourseDetailScreen extends StatelessWidget {
  const CourseDetailScreen({super.key, required this.args});

  final CourseDetailArguments args;

  @override
  Widget build(BuildContext context) {
    return CourseDetailPage(
      topicUrl: args.topicUrl,
      topicName: args.topicName,
      topicIndex: args.topicIndex,
    );
  }
}

class CourseDetailArguments {
  CourseDetailArguments({
    required this.topicUrl,
    required this.topicName,
    required this.topicIndex,
  });

  final String topicUrl;
  final String topicName;
  final String topicIndex;
}
