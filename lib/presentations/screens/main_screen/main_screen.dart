import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_one_learn/presentations/screens/main_screen/bloc/main_cubit.dart';
import 'package:one_one_learn/presentations/screens/main_screen/children_screens/courses/courses_page.dart';
import 'package:one_one_learn/presentations/screens/main_screen/children_screens/settings/settings_page.dart';
import 'package:one_one_learn/presentations/screens/main_screen/children_screens/tutors/bloc/tutors_cubit.dart';
import 'package:one_one_learn/presentations/screens/main_screen/children_screens/upcoming_classes/upcoming_classes_page.dart';
import 'package:one_one_learn/presentations/screens/main_screen/tabs/main_courses_tab.dart';
import 'package:one_one_learn/presentations/screens/main_screen/tabs/tutors_tab.dart';
import 'package:one_one_learn/presentations/screens/main_screen/widgets/bottom_nav_bar.dart';
import 'package:one_one_learn/presentations/widgets/base_widgets/base_screen.dart';

const listScreens = <Widget>[
  TutorsTab(),
  Center(child: Text('This is Chat screen')),
  UpcomingClassesPage(),
  MainCoursesTab(key: PageStorageKey('CoursesPage')),
  SettingsPage(),
];

class MainScreen extends BaseScreen<MainCubit, MainState> {
  const MainScreen({super.key});

  @override
  MainCubit provideBloc(BuildContext context) {
    return MainCubit();
  }

  @override
  Widget buildWidget(BuildContext context) {
    return BlocListener<MainCubit, MainState>(
      listenWhen: (previous, current) => previous.currentIndex != current.currentIndex,
      listener: (context, state) {
        context.read<MainCubit>().pageController.jumpToPage(state.currentIndex);
      },
      child: BlocBuilder<MainCubit, MainState>(
        buildWhen: (previous, current) => previous.currentIndex != current.currentIndex,
        builder: (context, state) {
          return MultiBlocListener(
            listeners: [
              BlocListener<TutorsCubit, TutorsState>(
                listenWhen: (previous, current) => previous.isLoading != current.isLoading,
                listener: (context, state) {
                  context.read<MainCubit>().changeLoadingState(isLoading: state.isLoading);
                },
              ),
            ],
            child: Scaffold(
              body: PageView.builder(
                controller: context.read<MainCubit>().pageController,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: listScreens.length,
                itemBuilder: (context, index) {
                  return listScreens[index];
                },
              ),
              bottomNavigationBar: BottomNavBar(
                currentIndex: state.currentIndex,
                onTap: context.read<MainCubit>().onChangeIndex,
              ),
            ),
          );
        },
      ),
    );
  }
}
