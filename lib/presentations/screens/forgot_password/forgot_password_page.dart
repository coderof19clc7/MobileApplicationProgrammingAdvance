import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_one_learn/presentations/screens/forgot_password/bloc/forgot_password_cubit.dart';
import 'package:one_one_learn/presentations/widgets/dialogs/popup_dialogs/simplest_notify_dialog.dart';
import 'package:one_one_learn/utils/extensions/app_extensions.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/generated/l10n.dart';
import 'package:one_one_learn/presentations/widgets/app_bar/simple_app_bar.dart';
import 'package:one_one_learn/presentations/widgets/buttons/primary_fill_button.dart';
import 'package:one_one_learn/presentations/widgets/text_fields/text_field_fill.dart';
import 'package:one_one_learn/utils/helpers/ui_helper.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
      listener: (contextCubit, state) {
        if (state.needShowCheckMailDialog) {
          showDialog(
            context: contextCubit,
            barrierDismissible: false,
            builder: (contextDialog) {
              return SimplestNotifyDialog(
                content: S.current.resetPasswordRequestSendSucceededContent,
              );
            },
          );
          context.read<ForgotPasswordCubit>().onChangeShowActivateDialog(
            value: false,
          );
        }
      },
      builder: (contextCubit, state) {
        return GestureDetector(
          onTap: () {
            UIHelper.hideKeyboard(context);
          },
          child: Scaffold(
            appBar: const SimpleTransparentAppBar(),
            body: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                  left: Dimens.getProportionalWidth(context, 60),
                  right: Dimens.getProportionalWidth(context, 60),
                  top: Dimens.getScreenHeight(context) * 0.1,
                ),
                width: Dimens.getScreenWidth(context),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // sign in title field
                    SizedBox(
                      width: Dimens.getScreenWidth(context),
                      child: Text(
                        S.current.forgotPassword,
                        style: Dimens.getProportionalFont(context, context.theme.textTheme.displayLarge).copyWith(
                          fontSize: Dimens.getProportionalWidth(context, 32),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(height: Dimens.getScreenHeight(context) * 0.0355),

                    // reset password requirement field
                    Text(
                      S.current.resetPasswordRequirement,
                      style: Dimens.getProportionalFont(context, context.theme.textTheme.bodySmall).copyWith(
                        fontSize: Dimens.getProportionalWidth(context, 17),
                      ),
                    ),
                    SizedBox(height: Dimens.getScreenHeight(context) * 0.0355),

                    // account's email input field
                    TextFieldFill(
                      textController: contextCubit.read<ForgotPasswordCubit>().emailController,
                      hintText: S.current.email,
                      errorText: state.emailError,
                      leftWidget: Icon(
                        Icons.email_rounded,
                        color: context.theme.colorScheme.onInverseSurface,
                        size: Dimens.getProportionalWidth(context, 24),
                      ),
                    ),
                    SizedBox(height: Dimens.getScreenHeight(context) * 0.0355),
                    PrimaryFillButton(
                      onTap: () {
                        contextCubit.read<ForgotPasswordCubit>().onSendForgotPasswordRequest();
                      },
                      width: Dimens.getScreenWidth(context),
                      paddingVertical: Dimens.getProportionalHeight(context, 14),
                      borderRadiusValue: Dimens.getScreenWidth(context),
                      child: Text(
                        S.current.resetPassword,
                        style: Dimens.getProportionalFont(context, context.theme.textTheme.bodyMedium).copyWith(
                          color: context.theme.colorScheme.onPrimary,
                          fontSize: Dimens.getProportionalWidth(context, 16),
                        ),
                      ),
                    ),
                    SizedBox(height: Dimens.getScreenHeight(context) * 0.0296),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
