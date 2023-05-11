import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_one_learn/presentations/screens/profile/bloc/profile_cubit.dart';
import 'package:one_one_learn/utils/extensions/app_extensions.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/presentations/screens/profile/widgets/profile_edit_mode_widget.dart';
import 'package:one_one_learn/presentations/screens/profile/widgets/profile_view_mode_widget.dart';
import 'package:one_one_learn/presentations/widgets/app_bar/simple_app_bar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      buildWhen: (previous, current) {
        return previous.isInitial != current.isInitial
            || previous.isEdit != current.isEdit;
      },
      builder: (context, state) {
        return Scaffold(
          appBar: SimpleTransparentAppBar(
            height: Dimens.getTopSafeAreaHeight(context),
            actions: [
              (!state.isInitial && !state.isEdit)
                  ? Padding(
                padding: EdgeInsets.only(
                  right: Dimens.getScreenWidth(context) * 0.04,
                ),
                child: GestureDetector(
                  onTap: () {
                    context.read<ProfileCubit>().onChangeMode(isEditMode: true);
                  },
                  child: Icon(
                    Icons.edit,
                    color: context.theme.colorScheme.onBackground,
                  ),
                ),
              )
                  : const SizedBox.shrink(),
            ],
          ),
          body: Container(
            padding: EdgeInsets.symmetric(
              horizontal: Dimens.getScreenWidth(context) * 0.05,
              vertical: Dimens.getScreenWidth(context) * 0.02,
            ),
            child: state.isInitial
                ? const Center(
              child: CircularProgressIndicator(),
            )
                : (!state.isEdit
                ? const ProfileViewModeWidget()
                : const ProfileEditModeWidget()
            ),
          ),
        );
      },
    );
  }
}
