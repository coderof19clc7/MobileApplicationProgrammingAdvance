import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_one_learn/configs/constants/colors.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/configs/constants/route_names.dart';
import 'package:one_one_learn/configs/stylings/app_styles.dart';
import 'package:one_one_learn/generated/assets.gen.dart';
import 'package:one_one_learn/presentations/screens/assistant/bloc/assistant_cubit.dart';
import 'package:one_one_learn/presentations/screens/main_screen/bloc/main_cubit.dart';
import 'package:one_one_learn/presentations/screens/main_screen/children_screens/tutors/bloc/tutors_cubit.dart';
import 'package:one_one_learn/presentations/screens/main_screen/children_screens/upcoming_classes/bloc/upcoming_cubit.dart';
import 'package:one_one_learn/presentations/screens/main_screen/tabs/main_courses_tab.dart';
import 'package:one_one_learn/presentations/screens/main_screen/tabs/settings_tab.dart';
import 'package:one_one_learn/presentations/screens/main_screen/tabs/tutors_tab.dart';
import 'package:one_one_learn/presentations/screens/main_screen/tabs/upcoming_tab.dart';
import 'package:one_one_learn/presentations/screens/main_screen/widgets/bottom_nav_bar.dart';
import 'package:one_one_learn/presentations/widgets/base_widgets/base_screen.dart';

const listScreens = <Widget>[
  TutorsTab(),
  UpcomingTab(),
  Center(child: Text('This is Chat screen')),
  MainCoursesTab(key: PageStorageKey('CoursesPage')),
  SettingsTab(),
];

class MainScreen extends BaseScreen<MainCubit, MainState> {
  const MainScreen({super.key});

  @override
  MainCubit provideBloc(BuildContext context) {
    return MainCubit.getInstance();
  }

  @override
  Widget buildWidget(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TutorsCubit>(
          create: (context) => TutorsCubit.getInstance(),
          lazy: false,
        ),
        BlocProvider<UpcomingCubit>(
          create: (context) => UpcomingCubit.getInstance(),
          lazy: false,
        ),
        BlocProvider<AssistantCubit>(
          create: (context) => AssistantCubit.getInstance(),
          lazy: false,
        ),
      ],
      child: BlocConsumer<MainCubit, MainState>(
        listenWhen: (previous, current) => previous.currentIndex != current.currentIndex,
        listener: (context, state) {
          context.read<MainCubit>().pageController?.jumpToPage(state.currentIndex);
        },
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
              BlocListener<TutorsCubit, TutorsState>(
                listenWhen: (previous, current) {
                  return previous.needNavigateToLogin != current.needNavigateToLogin;
                },
                listener: (context, state) {
                  context.read<MainCubit>().navigateToNextBusinessLogic();
                },
              ),
              BlocListener<TutorsCubit, TutorsState>(
                listenWhen: (previous, current) {
                  return previous.basicStatusFToastState != current.basicStatusFToastState;
                },
                listener: (context, state) {
                  context.read<MainCubit>().showStatusToast(
                    state.basicStatusFToastState?.message,
                    state.basicStatusFToastState?.statusToastType,
                  );
                },
              ),
              BlocListener<UpcomingCubit, UpcomingState>(
                listenWhen: (previous, current) => previous.isLoading != current.isLoading,
                listener: (context, state) {
                  context.read<MainCubit>().changeLoadingState(isLoading: state.isLoading);
                },
              ),
              BlocListener<UpcomingCubit, UpcomingState>(
                listenWhen: (previous, current) {
                  return previous.needNavigateToLogin != current.needNavigateToLogin;
                },
                listener: (context, state) {
                  context.read<MainCubit>().navigateToNextBusinessLogic();
                },
              ),
              BlocListener<UpcomingCubit, UpcomingState>(
                listenWhen: (previous, current) {
                  return previous.basicStatusFToastState != current.basicStatusFToastState;
                },
                listener: (context, state) {
                  context.read<MainCubit>().showStatusToast(
                    state.basicStatusFToastState?.message,
                    state.basicStatusFToastState?.statusToastType,
                  );
                },
              ),
              BlocListener<AssistantCubit, AssistantState>(
                listenWhen: (previous, current) => previous.isLoading != current.isLoading,
                listener: (context, state) {
                  context.read<MainCubit>().changeLoadingState(isLoading: state.isLoading);
                },
              ),
              BlocListener<AssistantCubit, AssistantState>(
                listenWhen: (previous, current) {
                  return previous.needNavigateToLogin != current.needNavigateToLogin;
                },
                listener: (context, state) {
                  context.read<MainCubit>().navigateToNextBusinessLogic();
                },
              ),
              BlocListener<AssistantCubit, AssistantState>(
                listenWhen: (previous, current) {
                  return previous.basicStatusFToastState != current.basicStatusFToastState;
                },
                listener: (context, state) {
                  context.read<MainCubit>().showStatusToast(
                    state.basicStatusFToastState?.message,
                    state.basicStatusFToastState?.statusToastType,
                  );
                },
              ),
            ],
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              floatingActionButton: SizedBox(
                width: Dimens.getScreenWidth(context) * AppStyles.floatingActionButtonSizePercentage,
                height: Dimens.getScreenWidth(context) * AppStyles.floatingActionButtonSizePercentage,
                child: FittedBox(
                  child: FloatingActionButton(
                    onPressed: () {},
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: AppColors.primaryGradient,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(RouteNames.assistant);
                        },
                        child: Icon(
                          Icons.chat_bubble_outline,
                          color: Colors.white,
                          size: Dimens.getScreenWidth(context) * AppStyles.floatingActionButtonSizePercentage / 2,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
