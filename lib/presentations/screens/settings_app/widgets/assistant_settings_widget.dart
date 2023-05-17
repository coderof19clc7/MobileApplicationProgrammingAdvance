import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_one_learn/configs/app_configs/injector.dart';
import 'package:one_one_learn/configs/constants/colors.dart';
import 'package:one_one_learn/configs/constants/debounces.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/configs/constants/local.dart';
import 'package:one_one_learn/configs/constants/map_constants.dart';
import 'package:one_one_learn/configs/stylings/app_styles.dart';
import 'package:one_one_learn/core/blocs/app_settings_bloc/app_settings_cubit.dart';
import 'package:one_one_learn/core/managers/local_manager.dart';
import 'package:one_one_learn/generated/l10n.dart';
import 'package:one_one_learn/presentations/screens/settings_app/settings_app_page.dart';
import 'package:one_one_learn/presentations/widgets/buttons/primary_fill_button.dart';
import 'package:one_one_learn/presentations/widgets/spaces/empty_proportional_space.dart';
import 'package:one_one_learn/presentations/widgets/text_fields/text_field_outline.dart';
import 'package:one_one_learn/utils/extensions/app_extensions.dart';
import 'package:one_one_learn/utils/helpers/debounce_helper.dart';
import 'package:one_one_learn/utils/helpers/ui_helper.dart';

class AssistantSettingsWidget extends StatefulWidget {
  const AssistantSettingsWidget({
    super.key,
    required this.settingsType,
    required this.horizontalPadding,
  });

  final SettingsAppType settingsType;
  final double horizontalPadding;

  @override
  State<AssistantSettingsWidget> createState() => _AssistantSettingsWidgetState();
}

class _AssistantSettingsWidgetState extends State<AssistantSettingsWidget> {
  final localManager = injector<LocalManager>();
  final _langController = ValueNotifier<bool>(false);
  final _autoplayController = ValueNotifier<bool>(false);
  final _privateApiKeyController = TextEditingController();
  bool isPrivateApiKey = false;
  String currentApiKey = '';

  @override
  void initState() {
    super.initState();
    initializeData();
  }

  @override
  void dispose() {
    _langController.dispose();
    _autoplayController
      ..removeListener(onChangeAutoPlayMessageStatus)
      ..dispose();
    _privateApiKeyController.dispose();
    super.dispose();
  }

  void initializeData() {
    // get current auto play new message status
    _autoplayController..value = localManager.getBool(
      LocalConstants.autoPlayNewMessage,
    ) ?? true
      ..addListener(onChangeAutoPlayMessageStatus);

    // get current api key
    isPrivateApiKey = localManager.getBool(LocalConstants.isPrivateApiKey) ?? false;
    currentApiKey = localManager.getString(
      LocalConstants.gptApiKey,
    ) ?? LocalConstants.defaultApiKey;
    if (currentApiKey.trim().isEmpty) {
      currentApiKey = LocalConstants.defaultApiKey;
    }
    if (!isPrivateApiKey) {
      _privateApiKeyController.text = LocalConstants.defaultApiKey;
    } else {
      _privateApiKeyController.text = currentApiKey;
    }
  }

  bool checkEnableActivePrivateApiKey() {
    if (_privateApiKeyController.text.trim().isEmpty) {
      return false;
    }

    if (isPrivateApiKey && _privateApiKeyController.text == currentApiKey) {
      return false;
    }

    if (!isPrivateApiKey && _privateApiKeyController.text == LocalConstants.defaultApiKey) {
      return false;
    }

    return true;
  }

  Future<void> onChangeAutoPlayMessageStatus() async {
    await localManager.setBool(
      LocalConstants.autoPlayNewMessage, _autoplayController.value,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        UIHelper.hideKeyboard(context);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Dimens.getProportionalWidth(context, widget.horizontalPadding),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // auto play message status field
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: buildTitle(context, S.current.autoPlayNewMessage),
                  ),
                  AdvancedSwitch(
                    controller: _autoplayController,
                    activeColor: context.theme.colorScheme.primary,
                    inactiveColor: context.theme.colorScheme.scrim,
                    activeChild: Text(S.current.on),
                    inactiveChild: Text(S.current.off),
                    borderRadius: BorderRadius.circular(15),
                    width: Dimens.getProportionalWidth(context, 74),
                    height: Dimens.getProportionalHeight(context, 40),
                  ),
                ],
              ),
              const EmptyProportionalSpace(height: 20),

              // private api key input field
              buildTitle(context, S.current.cannotEmpty(S.current.privateApiKey)),
              const EmptyProportionalSpace(height: 7),
              TextFieldOutline(
                textController: _privateApiKeyController,
                onChanged: (value) {
                  DebounceHelper.runWait(
                    DebounceConstants.privateApiKeyTextField,
                    duration: const Duration(milliseconds: 300),
                    callback: () {
                      setState(() {});
                    },
                  );
                },
              ),
              const EmptyProportionalSpace(height: 15),
              PrimaryFillButton(
                onTap: checkEnableActivePrivateApiKey()
                    ? () {
                  DebounceHelper.runDisable(
                    DebounceConstants.activePrivateApiKeyBtn,
                    callback: () async {
                      UIHelper.hideKeyboard(context);
                      isPrivateApiKey = true;
                      currentApiKey = _privateApiKeyController.text.trim();
                      await Future.wait([
                        localManager.setBool(
                          LocalConstants.isPrivateApiKey, isPrivateApiKey,
                        ),
                        localManager.setString(
                          LocalConstants.gptApiKey,
                          currentApiKey.isEmpty
                              ? LocalConstants.defaultApiKey
                              : currentApiKey,
                        ),
                      ]);
                      setState(() {});
                    }
                  );
                }
                    : null,
                paddingVertical: Dimens.getProportionalHeight(context, 15),
                width: Dimens.getScreenWidth(context),
                hasShadow: false,
                bgColor: checkEnableActivePrivateApiKey()
                    ? context.theme.colorScheme.primary
                    : context.theme.colorScheme.scrim,
                preferGradient: false,
                child: Text(
                  S.current.activeKey,
                  style: Dimens.getProportionalFont(
                    context, context.theme.textTheme.bodyMedium,
                  ).copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontWeight: FontWeight.w500,
                    fontSize: Dimens.getProportionalWidth(context, 17),
                  ),
                ),
              ),
              const EmptyProportionalSpace(height: 10),
              Text(
                S.current.privateApiKeyNote,
                style: Dimens.getProportionalFont(
                  context, context.theme.textTheme.bodyMedium,
                ).copyWith(
                  color: Theme.of(context).colorScheme.onInverseSurface,
                  fontWeight: FontWeight.w500,
                  fontSize: Dimens.getProportionalWidth(context, 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTitle(BuildContext context, String title) {
    return Text(
      title,
      style: Dimens.getProportionalFont(
        context, context.theme.textTheme.titleLarge,
      ),
    );
  }
}
