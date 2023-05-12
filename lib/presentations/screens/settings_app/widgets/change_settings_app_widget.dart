import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_one_learn/configs/constants/colors.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/configs/constants/map_constants.dart';
import 'package:one_one_learn/configs/stylings/app_styles.dart';
import 'package:one_one_learn/core/blocs/app_settings_bloc/app_settings_cubit.dart';
import 'package:one_one_learn/generated/l10n.dart';
import 'package:one_one_learn/presentations/screens/settings_app/settings_app_page.dart';
import 'package:one_one_learn/utils/extensions/app_extensions.dart';

class ChangeSettingsAppWidget extends StatelessWidget {
  const ChangeSettingsAppWidget({
    super.key,
    required this.settingsType,
    required this.horizontalPadding,
  });

  final SettingsAppType settingsType;
  final double horizontalPadding;

  bool checkIsSelected(int index, List<Map<String, dynamic>> listData, AppSettingsState state) {
    if (settingsType == SettingsAppType.themeMode) {
      return listData[index]['themeMode'] == state.themeMode.index;
    } else if (settingsType == SettingsAppType.locale) {
      final languageCode = state.locale?.languageCode ?? '';
      final countryCode = state.locale?.countryCode ?? '';
      return listData[index]['languageCode'] == languageCode &&
          listData[index]['countryCode'] == countryCode;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppSettingsCubit, AppSettingsState>(
      buildWhen: (previous, current) {
        var needRebuild = false;

        if (settingsType == SettingsAppType.themeMode) {
          needRebuild = previous.themeMode != current.themeMode;
        } else if (settingsType == SettingsAppType.locale) {
          needRebuild = previous.locale != current.locale;
        }

        return needRebuild;
      },
      builder: (context, state) {
        // prepare data to render
        final listTitleToRender = settingsType == SettingsAppType.themeMode
            ? MapConstants.listThemeModeTitle
            : MapConstants.listLocaleTitle;
        final listTitleLength = listTitleToRender.length;

        return DecoratedBox(
          decoration: BoxDecoration(
            color: context.theme.brightness == Brightness.light
                ? AppColors.neutralBlue100
                : AppColors.neutralBlue700,
            borderRadius: BorderRadius.circular(
              AppStyles.defaultCardBorderRadiusValue - 5,
            ),
          ),
          child: Column(
            children: [
              for (var i = 0; i < listTitleLength; i++)...[
                buildItem(
                  context,
                  title: listTitleToRender[i]['title']?.toString() ?? '',
                  isSelected: checkIsSelected(i, listTitleToRender, state),
                  onTap: () {
                    if (settingsType == SettingsAppType.themeMode) {
                      context.read<AppSettingsCubit>().changeThemeMode(i);
                    } else if (settingsType == SettingsAppType.locale) {
                      context.read<AppSettingsCubit>().changeLocale(
                        listTitleToRender[i]['languageCode']?.toString() ?? 'en',
                        listTitleToRender[i]['countryCode']?.toString(),
                      );
                    }
                  },
                ),
                if (i < listTitleLength - 1)
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Dimens.getProportionalWidth(context, horizontalPadding),
                    ),
                    child: const Divider(height: 1, thickness: 1),
                  ),
              ],
            ],
          ),
        );
      },
    );
  }

  Widget buildItem(BuildContext context, {
    required String title,
    bool isSelected = false,
    void Function()? onTap,
  }) {
    return Material(
      type: MaterialType.transparency,
      color: Theme.of(context).colorScheme.background,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Dimens.getProportionalWidth(context, horizontalPadding),
            vertical: Dimens.getProportionalHeight(context, horizontalPadding + 7),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: Dimens.getProportionalFont(
                    context, context.theme.textTheme.displayMedium,
                  ),
                ),
              ),
              if (isSelected)
                Icon(
                  Icons.check,
                  color: Theme.of(context).colorScheme.primary,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
