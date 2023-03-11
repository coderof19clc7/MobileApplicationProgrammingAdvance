import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:one_one_learn/configs/app_configs/app_extensions.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/configs/constants/route_names.dart';
import 'package:one_one_learn/generated/assets.gen.dart';
import 'package:one_one_learn/generated/l10n.dart';
import 'package:one_one_learn/presentations/widgets/buttons/primary_fill_button.dart';
import 'package:one_one_learn/presentations/widgets/buttons/primary_outline_button.dart';
import 'package:one_one_learn/presentations/widgets/text_fields/text_field_fill.dart';
import 'package:one_one_learn/utils/ui_helper.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late GestureRecognizer _tapGestureRecognizer;

  @override
  void initState() {
    super.initState();
    _tapGestureRecognizer = TapGestureRecognizer()
      ..onTap = () {
        Navigator.of(context).pushNamed(RouteNames.signUp);
      };
  }

  @override
  void dispose() {
    _tapGestureRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        UIHelper.hideKeyboard(context);
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
              left: Dimens.getProportionalScreenWidth(context, 60),
              right: Dimens.getProportionalScreenWidth(context, 60),
              top: Dimens.getTopSafeAreaHeight(context) * 3,
              bottom: Dimens.getBottomSafeAreaHeight(context) + 7,
            ),
            width: Dimens.getScreenWidth(context),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // sign in title field
                SizedBox(
                  width: Dimens.getScreenWidth(context),
                  child: Text(
                    S.current.loginTitle,
                    style: Dimens.getProportionalFont(context, context.theme.textTheme.displayLarge).copyWith(
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
                    color: context.theme.colorScheme.onInverseSurface,
                    size: Dimens.getProportionalScreenWidth(context, 24),
                  ),
                ),
                SizedBox(height: Dimens.getScreenHeight(context) * 0.0474),
                TextFieldFill(
                  hintText: S.current.password,
                  leftWidget: Icon(
                    Icons.lock_rounded,
                    color: context.theme.colorScheme.onInverseSurface,
                    size: Dimens.getProportionalScreenWidth(context, 24),
                  ),
                  canTextBeObscured: true,
                ),
                SizedBox(height: Dimens.getScreenHeight(context) * 0.0474),
                PrimaryFillButton(
                  onTap: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(RouteNames.main, (route) => false);
                  },
                  width: Dimens.getScreenWidth(context),
                  paddingVertical: Dimens.getProportionalScreenHeight(context, 14),
                  borderRadiusValue: Dimens.getScreenWidth(context),
                  child: Text(
                    S.current.login,
                    style: Dimens.getProportionalFont(context, context.theme.textTheme.displaySmall).copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: Dimens.getProportionalScreenWidth(context, 16),
                    ),
                  ),
                ),
                SizedBox(height: Dimens.getScreenHeight(context) * 0.0296),

                // forgot password field
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(RouteNames.forgotPassword);
                  },
                  child: Text(
                    '${S.current.forgotPassword}?',
                    style: Dimens.getProportionalFont(context, context.theme.textTheme.bodyMedium).copyWith(
                      color: context.theme.colorScheme.onSurfaceVariant,
                      fontSize: Dimens.getProportionalScreenWidth(context, 15),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: Dimens.getScreenHeight(context) * 0.0474),

                // more options to sign in field
                Text(
                  S.current.orContinueWith.toLowerCase(),
                  style: Dimens.getProportionalFont(context, context.theme.textTheme.bodySmall).copyWith(
                    fontSize: Dimens.getProportionalScreenWidth(context, 15),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: Dimens.getScreenHeight(context) * 0.025),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PrimaryOutlineButton(
                      onTap: () {},
                      width: Dimens.getProportionalScreenWidth(context, 87),
                      paddingVertical: Dimens.getProportionalScreenHeight(context, 17),
                      preferGradient: false,
                      borderColor: context.theme.colorScheme.outline,
                      bodyColor: context.theme.colorScheme.surface,
                      child: Assets.icons.googleColorfull.svg(
                        width: Dimens.getProportionalScreenWidth(context, 24),
                        height: Dimens.getProportionalScreenWidth(context, 24),
                      ),
                    ),
                    SizedBox(width: Dimens.getScreenWidth(context) * 0.0795),
                    PrimaryOutlineButton(
                      onTap: () {},
                      width: Dimens.getProportionalScreenWidth(context, 87),
                      paddingVertical: Dimens.getProportionalScreenHeight(context, 17),
                      preferGradient: false,
                      borderColor: context.theme.colorScheme.outline,
                      bodyColor: context.theme.colorScheme.surface,
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
                    style: Dimens.getProportionalFont(context, context.theme.textTheme.bodyMedium).copyWith(
                      color: context.theme.colorScheme.onInverseSurface,
                      fontSize: Dimens.getProportionalScreenWidth(context, 15),
                      fontWeight: FontWeight.w400,
                    ),
                    children: [
                      TextSpan(
                        text: ' ${S.current.signUp}',
                        recognizer: _tapGestureRecognizer,
                        style: Dimens.getProportionalFont(context, context.theme.textTheme.bodyMedium).copyWith(
                          color: context.theme.colorScheme.primary,
                          fontSize: Dimens.getProportionalScreenWidth(context, 15),
                          fontWeight: FontWeight.w600,
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
