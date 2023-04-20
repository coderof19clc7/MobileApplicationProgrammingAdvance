import 'package:flutter/material.dart';
import 'package:one_one_learn/presentations/screens/main_screen/children_screens/tutors/tutors_screen.dart';

class TutorsTab extends StatefulWidget {
  const TutorsTab({super.key});

  @override
  State<TutorsTab> createState() => _TutorsTabState();
}

class _TutorsTabState extends State<TutorsTab> with AutomaticKeepAliveClientMixin<TutorsTab> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const TutorScreen();
  }

  @override
  bool get wantKeepAlive => true;
}
