import 'package:flutter/material.dart';
import 'package:one_one_learn/configs/app_configs/app_extensions.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/generated/l10n.dart';
import 'package:one_one_learn/presentations/widgets/app_bar/simple_app_bar.dart';
import 'package:one_one_learn/presentations/widgets/buttons/primary_fill_button.dart';
import 'package:one_one_learn/presentations/widgets/text_fields/text_field_fill.dart';
import 'package:one_one_learn/utils/ui_helper.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        UIHelper.hideKeyboard(context);
      },
      child: Scaffold(
        appBar: const SimpleTransparentAppBar(),
        resizeToAvoidBottomInset: false,
        body: Container(
          padding: EdgeInsets.only(
            left: Dimens.getProportionalScreenWidth(context, 60),
            right: Dimens.getProportionalScreenWidth(context, 60),
            top: Dimens.getScreenHeight(context) * 0.15,
          ),
          width: Dimens.getScreenWidth(context),
          height: Dimens.getScreenHeight(context),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // sign in title field
              SizedBox(
                width: Dimens.getScreenWidth(context),
                child: Text(
                  S.current.forgotPassword,
                  style: Dimens.getProportionalFont(context, context.theme.textTheme.displayLarge).copyWith(
                    fontSize: Dimens.getProportionalScreenWidth(context, 32),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(height: Dimens.getScreenHeight(context) * 0.0355),

              // reset password requirement field
              Text(
                S.current.resetPasswordRequirement,
                style: Dimens.getProportionalFont(context, context.theme.textTheme.bodySmall).copyWith(
                  fontSize: Dimens.getProportionalScreenWidth(context, 17),
                ),
              ),
              SizedBox(height: Dimens.getScreenHeight(context) * 0.0355),

              // account's email input field
              TextFieldFill(
                hintText: S.current.email,
                leftWidget: Icon(
                  Icons.email_rounded,
                  color: context.theme.colorScheme.onInverseSurface,
                  size: Dimens.getProportionalScreenWidth(context, 24),
                ),
              ),
              SizedBox(height: Dimens.getScreenHeight(context) * 0.0355),
              PrimaryFillButton(
                onTap: () {},
                width: Dimens.getScreenWidth(context),
                paddingVertical: Dimens.getProportionalScreenHeight(context, 14),
                borderRadiusValue: Dimens.getScreenWidth(context),
                child: Text(
                  S.current.resetPassword,
                  style: Dimens.getProportionalFont(context, context.theme.textTheme.bodyMedium).copyWith(
                    color: context.theme.colorScheme.onPrimary,
                    fontSize: Dimens.getProportionalScreenWidth(context, 16),
                  ),
                ),
              ),
              SizedBox(height: Dimens.getScreenHeight(context) * 0.0296),
            ],
          ),
        ),
      ),
    );
  }
}
