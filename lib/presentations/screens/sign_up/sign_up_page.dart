import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_one_learn/presentations/screens/sign_up/bloc/sign_up_cubit.dart';
import 'package:one_one_learn/presentations/widgets/spaces/empty_proportional_percent_space.dart';
import 'package:one_one_learn/utils/extensions/app_extensions.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/generated/l10n.dart';
import 'package:one_one_learn/presentations/widgets/app_bar/simple_app_bar.dart';
import 'package:one_one_learn/presentations/widgets/buttons/primary_fill_button.dart';
import 'package:one_one_learn/presentations/widgets/text_fields/text_field_fill.dart';
import 'package:one_one_learn/utils/ui_helper.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    const textFieldsSpaceBetweenPercent = 0.0474;
    return GestureDetector(
      onTap: () {
        UIHelper.hideKeyboard(context);
      },
      child: Scaffold(
        appBar: const SimpleTransparentAppBar(),
        body: BlocBuilder<SignUpCubit, SignUpState>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                  left: Dimens.getProportionalScreenWidth(context, 60),
                  right: Dimens.getProportionalScreenWidth(context, 60),
                  top: Dimens.getScreenHeight(context) * 0.07,
                ),
                width: Dimens.getScreenWidth(context),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // sign in title field
                    SizedBox(
                      width: Dimens.getScreenWidth(context),
                      child: Text(
                        S.current.signUpTitle,
                        style: Dimens.getProportionalFont(context, context.theme.textTheme.displayLarge).copyWith(
                          fontSize: Dimens.getProportionalScreenWidth(context, 32),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const EmptyProportionalPercentSpace(
                      percentHeight: textFieldsSpaceBetweenPercent,
                    ),

                    // account's information input field
                    TextFieldFill(
                      textController: context.read<SignUpCubit>().emailController,
                      errorText: state.emailError,
                      hintText: S.current.email,
                      leftWidget: Icon(
                        Icons.email_rounded,
                        color: context.theme.colorScheme.onInverseSurface,
                        size: Dimens.getProportionalScreenWidth(context, 24),
                      ),
                    ),
                    const EmptyProportionalPercentSpace(
                      percentHeight: textFieldsSpaceBetweenPercent,
                    ),
                    TextFieldFill(
                      textController: context.read<SignUpCubit>().passwordController,
                      errorText: state.passwordError,
                      hintText: S.current.password,
                      leftWidget: Icon(
                        Icons.lock_rounded,
                        color: context.theme.colorScheme.onInverseSurface,
                        size: Dimens.getProportionalScreenWidth(context, 24),
                      ),
                      canTextBeObscured: true,
                    ),
                    const EmptyProportionalPercentSpace(
                      percentHeight: textFieldsSpaceBetweenPercent,
                    ),
                    TextFieldFill(
                      textController: context.read<SignUpCubit>().confirmPasswordController,
                      errorText: state.confirmPasswordError,
                      hintText: S.current.confirmPassword,
                      leftWidget: Icon(
                        Icons.lock_reset_rounded,
                        color: context.theme.colorScheme.onInverseSurface,
                        size: Dimens.getProportionalScreenWidth(context, 24),
                      ),
                      canTextBeObscured: true,
                    ),
                    const EmptyProportionalPercentSpace(
                      percentHeight: textFieldsSpaceBetweenPercent,
                    ),
                    PrimaryFillButton(
                      onTap: () {
                        UIHelper.hideKeyboard(context);
                        context.read<SignUpCubit>().onSignUp();
                      },
                      width: Dimens.getScreenWidth(context),
                      paddingVertical: Dimens.getProportionalScreenHeight(context, 14),
                      borderRadiusValue: Dimens.getScreenWidth(context),
                      child: Text(
                        S.current.signUp,
                        style: Dimens.getProportionalFont(context, context.theme.textTheme.displaySmall).copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: Dimens.getProportionalScreenWidth(context, 16),
                        ),
                      ),
                    ),
                    const EmptyProportionalPercentSpace(
                      percentHeight: 0.0296,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
