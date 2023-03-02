import 'package:flutter/material.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/generated/l10n.dart';
import 'package:one_one_learn/presentations/widgets/app_bar/simple_app_bar.dart';
import 'package:one_one_learn/presentations/widgets/buttons/primary_fill_button.dart';
import 'package:one_one_learn/presentations/widgets/text_fields/text_field_fill.dart';
import 'package:one_one_learn/utils/ui_helper.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        UIHelper.hideKeyboard(context);
      },
      child: Scaffold(
        appBar: const SimpleTransparentAppBar(),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
              left: Dimens.getProportionalScreenWidth(context, 60),
              right: Dimens.getProportionalScreenWidth(context, 60),
              top: Dimens.getScreenHeight(context) * 0.15,
            ),
            width: Dimens.getScreenWidth(context),
            height: Dimens.getScreenHeight(context),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children:[
                // sign in title field
                SizedBox(
                  width: Dimens.getScreenWidth(context),
                  child: Text(
                    S.current.signUpTitle,
                    style: TextStyle(
                      fontSize: Dimens.getProportionalScreenWidth(context, 32),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: Dimens.getScreenHeight(context) * 0.0474),

                // account's information input field
                TextFieldFill(
                  hintText: S.current.email,
                  leftWidget: Icon(
                    Icons.email_rounded,
                    size: Dimens.getProportionalScreenWidth(context, 24),
                  ),
                ),
                SizedBox(height: Dimens.getScreenHeight(context) * 0.0474),
                TextFieldFill(
                  hintText: S.current.password,
                  leftWidget: Icon(
                    Icons.lock_rounded,
                    size: Dimens.getProportionalScreenWidth(context, 24),
                  ),
                  canTextBeObscured: true,
                ),
                SizedBox(height: Dimens.getScreenHeight(context) * 0.0474),
                TextFieldFill(
                  hintText: S.current.confirmPassword,
                  leftWidget: Icon(
                    Icons.lock_rounded,
                    size: Dimens.getProportionalScreenWidth(context, 24),
                  ),
                  canTextBeObscured: true,
                ),
                SizedBox(height: Dimens.getScreenHeight(context) * 0.0474),
                PrimaryFillButton(
                  onTap: () {},
                  width: Dimens.getScreenWidth(context),
                  paddingVertical: Dimens.getProportionalScreenHeight(context, 14),
                  borderRadiusValue: Dimens.getScreenWidth(context),
                  child: Text(S.current.login, style: TextStyle(
                    color: Colors.white,
                    fontSize: Dimens.getProportionalScreenWidth(context, 16),
                  ),),
                ),
                SizedBox(height: Dimens.getScreenHeight(context) * 0.0296),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
