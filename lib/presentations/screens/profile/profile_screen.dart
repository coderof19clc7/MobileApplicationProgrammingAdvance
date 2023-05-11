import 'package:flutter/material.dart';
import 'package:one_one_learn/presentations/screens/main_screen/bloc/main_cubit.dart';
import 'package:one_one_learn/presentations/screens/profile/bloc/profile_cubit.dart';
import 'package:one_one_learn/presentations/screens/profile/profile_page.dart';
import 'package:one_one_learn/presentations/widgets/base_widgets/base_screen.dart';

class ProfileScreen extends BaseScreen<ProfileCubit, ProfileState> {
  const ProfileScreen({super.key});

  @override
  ProfileCubit provideBloc(BuildContext context) {
    return ProfileCubit(
      refreshUserInfo: () async {
        await MainCubit.getInstance().getUserInformation(showLoading: false);
      },
    );
  }

  @override
  Widget buildWidget(BuildContext context) {
    return const ProfilePage();
  }
}
