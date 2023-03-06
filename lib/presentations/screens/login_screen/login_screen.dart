import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:one_one_learn/configs/constants/colors.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/configs/constants/svg_icons.dart';
import 'package:one_one_learn/generated/assets.gen.dart';
import 'package:one_one_learn/generated/l10n.dart';
import 'package:one_one_learn/presentations/widgets/buttons/primary_fill_button.dart';
import 'package:one_one_learn/presentations/widgets/buttons/primary_outline_button.dart';
import 'package:one_one_learn/presentations/widgets/text_fields/text_field_fill.dart';
import 'package:one_one_learn/utils/ui_helper.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        UIHelper.hideKeyboard(context);
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: Dimens.getProportionalScreenWidth(context, 60),
            ),
            width: Dimens.getScreenWidth(context),
            height: Dimens.getScreenHeight(context),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                // sign in title field
                SizedBox(
                  width: Dimens.getScreenWidth(context),
                  child: Text(
                    S.current.loginTitle,
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

                // forgot password field
                InkWell(
                  onTap: () {},
                  child: Text('${S.current.forgotPassword}?', style: TextStyle(
                    color: AppColors.primaryBlue400,
                    fontSize: Dimens.getProportionalScreenWidth(context, 15),
                    fontWeight: FontWeight.w500,
                  ),),
                ),
                SizedBox(height: Dimens.getScreenHeight(context) * 0.0474),

                // more options to sign in field
                Text(
                  S.current.orContinueWith,
                  style: TextStyle(
                    color: AppColors.neutralBlue500,
                    fontSize: 15, fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: Dimens.getScreenHeight(context) * 0.025),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PrimaryOutlineButton(
                      onTap: () {},
                      width: Dimens.getProportionalScreenWidth(context, 87),
                      bgColor: AppColors.grey,
                      paddingVertical: Dimens.getProportionalScreenHeight(context, 17),
                      preferGradient: false,
                      splashColor: AppColors.grey.withOpacity(0.5),
                      child: Assets.icons.googleColorfull.svg(
                        width: Dimens.getProportionalScreenWidth(context, 24),
                        height: Dimens.getProportionalScreenWidth(context, 24),
                      ),
                    ),
                    SizedBox(width: Dimens.getScreenWidth(context) * 0.0795),
                    PrimaryOutlineButton(
                      onTap: () {},
                      width: Dimens.getProportionalScreenWidth(context, 87),
                      bgColor: AppColors.grey,
                      paddingVertical: Dimens.getProportionalScreenHeight(context, 17),
                      preferGradient: false,
                      splashColor: AppColors.grey.withOpacity(0.5),
                      child: Assets.icons.facebookColorfull.svg(
                        width: Dimens.getProportionalScreenWidth(context, 24),
                        height: Dimens.getProportionalScreenWidth(context, 24),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: Dimens.getScreenHeight(context) * 0.045),

                // Ask sign up field
                RichText(
                  text: TextSpan(
                    text: S.current.dontHaveAccount,
                    style: TextStyle(
                      color: AppColors.neutralBlue400,
                      fontSize: Dimens.getProportionalScreenWidth(context, 17),
                      fontWeight: FontWeight.w500,
                    ),
                    children: [
                      TextSpan(
                        text: ' ${S.current.signUp}',
                        recognizer: TapGestureRecognizer()..onTap = () {},
                        style: TextStyle(
                          color: AppColors.primaryBlue400,
                          fontSize: Dimens.getProportionalScreenWidth(context, 17),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
