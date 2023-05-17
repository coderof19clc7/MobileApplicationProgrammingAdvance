import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_one_learn/configs/constants/debounces.dart';
import 'package:one_one_learn/presentations/screens/login/bloc/login_cubit.dart';
import 'package:one_one_learn/presentations/widgets/dialogs/popup_dialogs/simplest_notify_dialog.dart';
import 'package:one_one_learn/utils/extensions/app_extensions.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/configs/constants/route_names.dart';
import 'package:one_one_learn/generated/assets.gen.dart';
import 'package:one_one_learn/generated/l10n.dart';
import 'package:one_one_learn/presentations/widgets/buttons/primary_fill_button.dart';
import 'package:one_one_learn/presentations/widgets/buttons/primary_outline_button.dart';
import 'package:one_one_learn/presentations/widgets/text_fields/text_field_fill.dart';
import 'package:one_one_learn/utils/helpers/debounce_helper.dart';
import 'package:one_one_learn/utils/helpers/ui_helper.dart';

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
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (contextCubit, state) {
        if (state.needShowActivateDialog) {
          showDialog(
            context: contextCubit,
            barrierDismissible: false,
            builder: (contextDialog) {
              return SimplestNotifyDialog(
                title: S.current.needActivateHeader,
                content: S.current.needActivateContent,
              );
            },
          );
          contextCubit.read<LoginCubit>().onChangeShowActivateDialog(value: false);
        }
      },
      builder: (contextCubit, state) {
        return GestureDetector(
          onTap: () {
            UIHelper.hideKeyboard(context);
          },
          child: Scaffold(
            body: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                  left: Dimens.getProportionalWidth(context, 60),
                  right: Dimens.getProportionalWidth(context, 60),
                  top: Dimens.getTopSafeAreaHeight(context) * 4.5,
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
                        style: Dimens.getProportionalFont(
                          context, context.theme.textTheme.displayLarge,
                        ).copyWith(
                          fontSize: Dimens.getProportionalWidth(context, 32),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(height: Dimens.getScreenHeight(context) * 0.0474),

                    // account's information input field
                    TextFieldFill(
                      textController: contextCubit.read<LoginCubit>().emailController,
                      errorText: state.emailError,
                      hintText: S.current.email,
                      leftWidget: Icon(
                        Icons.email_rounded,
                        color: context.theme.colorScheme.onInverseSurface,
                        size: Dimens.getProportionalWidth(context, 24),
                      ),
                    ),
                    SizedBox(height: Dimens.getScreenHeight(context) * 0.0474),
                    TextFieldFill(
                      textController: contextCubit.read<LoginCubit>().passwordController,
                      errorText: state.passwordError,
                      hintText: S.current.password,
                      leftWidget: Icon(
                        Icons.lock_rounded,
                        color: context.theme.colorScheme.onInverseSurface,
                        size: Dimens.getProportionalWidth(context, 24),
                      ),
                      canTextBeObscured: true,
                    ),
                    SizedBox(height: Dimens.getScreenHeight(context) * 0.0474),
                    PrimaryFillButton(
                      onTap: () {
                        DebounceHelper.runDisable(
                          DebounceConstants.loginButton,
                          callback: () {
                            UIHelper.hideKeyboard(context);
                            contextCubit.read<LoginCubit>().onLogin();
                          },
                        );
                      },
                      width: Dimens.getScreenWidth(context),
                      paddingVertical: Dimens.getProportionalHeight(context, 14),
                      borderRadiusValue: Dimens.getScreenWidth(context),
                      child: Text(
                        S.current.login,
                        style: Dimens.getProportionalFont(
                          context, context.theme.textTheme.displaySmall,
                        ).copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: Dimens.getProportionalWidth(context, 16),
                        ),
                      ),
                    ),
                    SizedBox(height: Dimens.getScreenHeight(context) * 0.0296),

                    // forgot password field
                    InkWell(
                      onTap: () {
                        UIHelper.hideKeyboard(context);
                        Navigator.of(context).pushNamed(RouteNames.forgotPassword);
                      },
                      child: Text(
                        '${S.current.forgotPassword}?',
                        style: Dimens.getProportionalFont(
                          context, context.theme.textTheme.bodyMedium,
                        ).copyWith(
                          color: context.theme.colorScheme.onSurfaceVariant,
                          fontSize: Dimens.getProportionalWidth(context, 15),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(height: Dimens.getScreenHeight(context) * 0.0474),

                    // more options to sign in field
                    Text(
                      S.current.orContinueWith.toLowerCase(),
                      style: Dimens.getProportionalFont(
                        context, context.theme.textTheme.bodySmall,
                      ).copyWith(
                        fontSize: Dimens.getProportionalWidth(context, 15),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: Dimens.getScreenHeight(context) * 0.025),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        PrimaryOutlineButton(
                          onTap: () {
                            DebounceHelper.runDisable(
                              DebounceConstants.googleLoginButton,
                              callback: () {
                                UIHelper.hideKeyboard(context);
                                contextCubit.read<LoginCubit>().onGoogleSignInButtonTapped();
                              },
                            );
                          },
                          width: Dimens.getProportionalWidth(context, 87),
                          paddingVertical: Dimens.getProportionalHeight(context, 17),
                          preferGradient: false,
                          borderColor: context.theme.colorScheme.outline,
                          bodyColor: context.theme.colorScheme.surface,
                          child: Assets.icons.googleColorfull.svg(
                            width: Dimens.getProportionalWidth(context, 24),
                            height: Dimens.getProportionalWidth(context, 24),
                          ),
                        ),
                        SizedBox(width: Dimens.getScreenWidth(context) * 0.0795),
                        PrimaryOutlineButton(
                          onTap: () {
                            UIHelper.hideKeyboard(context);
                          },
                          width: Dimens.getProportionalWidth(context, 87),
                          paddingVertical: Dimens.getProportionalHeight(context, 17),
                          preferGradient: false,
                          borderColor: context.theme.colorScheme.outline,
                          bodyColor: context.theme.colorScheme.surface,
                          child: Assets.icons.facebookColorfull.svg(
                            width: Dimens.getProportionalWidth(context, 24),
                            height: Dimens.getProportionalWidth(context, 24),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: Dimens.getScreenHeight(context) * 0.045),

                    // Ask sign up field
                    RichText(
                      text: TextSpan(
                        text: S.current.dontHaveAccount,
                        style: Dimens.getProportionalFont(
                          context, context.theme.textTheme.bodyMedium,
                        ).copyWith(
                          color: context.theme.colorScheme.onInverseSurface,
                          fontSize: Dimens.getProportionalWidth(context, 15),
                          fontWeight: FontWeight.w400,
                        ),
                        children: [
                          TextSpan(
                            text: ' ${S.current.signUp}',
                            recognizer: _tapGestureRecognizer,
                            style: Dimens.getProportionalFont(
                              context, context.theme.textTheme.bodyMedium,
                            ).copyWith(
                              color: context.theme.colorScheme.primary,
                              fontSize: Dimens.getProportionalWidth(context, 15),
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
      },
    );
  }
}
