import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:one_one_learn/configs/constants/date_formats.dart';
import 'package:one_one_learn/configs/constants/map_constants.dart';
import 'package:one_one_learn/configs/constants/svg_icons.dart';
import 'package:one_one_learn/presentations/screens/profile/bloc/profile_cubit.dart';
import 'package:one_one_learn/presentations/widgets/buttons/primary_fill_button.dart';
import 'package:one_one_learn/presentations/widgets/buttons/primary_outline_button.dart';
import 'package:one_one_learn/presentations/widgets/others/app_dropdown.dart';
import 'package:one_one_learn/presentations/widgets/text_fields/text_field_outline.dart';
import 'package:one_one_learn/utils/extensions/app_extensions.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/generated/l10n.dart';
import 'package:one_one_learn/presentations/screens/profile/widgets/avatar_widget.dart';
import 'package:one_one_learn/presentations/screens/profile/widgets/want_to_sturdy_subject_and_test.dart';
import 'package:one_one_learn/presentations/widgets/spaces/empty_proportional_space.dart';
import 'package:one_one_learn/utils/helpers/ui_helper.dart';

class ProfileEditModeWidget extends StatelessWidget {
  const ProfileEditModeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        const itemDistance = 20.0;
        return GestureDetector(
          onTap: () {
            UIHelper.hideKeyboard(context);
          },
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // avatar and email
                AvatarWidget(
                  isEditAvt: true,
                  currentUrl: state.userInfo?.avatar,
                  path: state.avatarPath,
                  onSelectedAva: (path) {
                    context.read<ProfileCubit>().emitNewState(
                      state.copyWith(avatarPath: path),
                    );
                  },
                ),
                const EmptyProportionalSpace(height: itemDistance - 5),
                Text(
                  state.userInfo?.email ?? '',
                  style: Dimens.getProportionalFont(
                    context, context.theme.textTheme.headlineLarge,
                  ).copyWith(
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const EmptyProportionalSpace(height: itemDistance),

                // username
                buildTitle(context, S.current.name),
                const EmptyProportionalSpace(height: itemDistance / 4),
                TextFieldOutline(
                  textController: context.read<ProfileCubit>().nameController,
                  onChanged: (value) {
                    context.read<ProfileCubit>().onAFieldChanged(
                      value, 'name', text: S.current.name,
                    );
                  },
                  errorText: state.errorsMap['name'],
                ),
                const EmptyProportionalSpace(height: itemDistance),

                // date of birth
                buildTitle(context, S.current.dateOfBirth),
                const EmptyProportionalSpace(height: itemDistance / 4),
                TextFieldOutline(
                  onTap: () async {
                    UIHelper.hideKeyboard(context);
                    final currentDoB = DateFormat(AppDateFormats.yyyy_MM_dd).parse(
                      context.read<ProfileCubit>().dateOfBirthController.text,
                    );
                    showDatePicker(
                      context: context,
                      initialDate: currentDoB,
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2100, 0, 0),
                    ).then((newDoB) {
                      if (newDoB != null) {
                        context.read<ProfileCubit>().dateOfBirthController.text =
                        DateFormat(AppDateFormats.yyyy_MM_dd).format(newDoB);
                      }
                    });
                  },
                  textController: context.read<ProfileCubit>().dateOfBirthController,
                  onChanged: (value) {
                    context.read<ProfileCubit>().onAFieldChanged(
                      value, 'dob', text: S.current.dateOfBirth,
                    );
                  },
                  errorText: state.errorsMap['dob'],
                  readOnly: true,
                  rightWidget: Icon(
                    Icons.calendar_today_outlined,
                    color: context.theme.colorScheme.onTertiaryContainer,
                    size: Dimens.getProportionalWidth(context, 17),
                  ),
                ),
                const EmptyProportionalSpace(height: itemDistance),

                // country
                buildTitle(context, S.current.country),
                const EmptyProportionalSpace(height: itemDistance / 4),
                AppDropDown<String>(
                  value: state.userInfo?.country,
                  data: MapConstants.countries.keys.toList(),
                  verticalPadding: Dimens.getProportionalHeight(context, 15),
                  iconStyleData: IconStyleData(
                    icon: Container(
                      margin: EdgeInsets.only(
                        right: Dimens.getProportionalWidth(context, 10),
                      ),
                      child: SvgPicture.string(SvgIcons.getIcon(
                        SvgIconEnum.downArrow,
                        fillColor: context.theme.colorScheme.onTertiaryContainer,
                      )),
                    ),
                  ),
                  dropdownStyleData: DropdownStyleData(
                    decoration: BoxDecoration(
                      color: context.theme.colorScheme.surfaceTint,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    maxHeight: Dimens.getProportionalHeight(context, 300),
                  ),
                  itemBuilder: (item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        '${UIHelper.getIconFromNationalityCode(item)}'
                            '  ${MapConstants.countries[item]}',
                        style: Dimens.getProportionalFont(
                          context, context.theme.textTheme.bodyMedium,
                        ).copyWith(
                          fontSize: Dimens.getProportionalHeight(context, 15),
                        ),
                      ),
                    );
                  },
                  onChanged: (value) {
                    context.read<ProfileCubit>().onAFieldChanged(
                      value ?? '', 'country', text: S.current.country,
                    );
                    if (value == null || value == state.userInfo?.country) return;
                    context.read<ProfileCubit>().emitNewState(
                      state.copyWith(
                        userInfo: state.userInfo?.copyWith(country: value),
                      ),
                    );
                  },
                  errorText: state.errorsMap['country'],
                  dropdownSearchData: DropdownSearchData(
                    searchController: context.read<ProfileCubit>().countrySearchController,
                    searchInnerWidgetHeight: 50,
                    searchInnerWidget: Padding(
                      padding: EdgeInsets.only(
                        left: Dimens.getProportionalWidth(context, 15),
                        right: Dimens.getProportionalWidth(context, 15),
                        top: Dimens.getProportionalHeight(context, 15),
                      ),
                      child: TextFieldOutline(
                        textController: context.read<ProfileCubit>().countrySearchController,
                        hintText: S.current.searchHintCountry,
                      ),
                    ),
                    searchMatchFn: (item, searchValue) {
                      final textNeedFind = searchValue.toLowerCase();
                      final itemText = (MapConstants.countries[item.value] ?? '').toLowerCase();
                      return itemText.contains(textNeedFind);
                    },
                  ),
                  onMenuStateChange: (isOpened) {
                    if (isOpened) {
                      context.read<ProfileCubit>().countrySearchController.text = '';
                    }
                  },
                ),
                const EmptyProportionalSpace(height: itemDistance),

                // level
                buildTitle(context, S.current.skillLevel),
                const EmptyProportionalSpace(height: itemDistance / 4),
                AppDropDown<String>(
                  value: state.userInfo?.level,
                  data: MapConstants.userLevels.keys.toList(),
                  verticalPadding: Dimens.getProportionalHeight(context, 15),
                  iconStyleData: IconStyleData(
                    icon: Container(
                      margin: EdgeInsets.only(
                        right: Dimens.getProportionalWidth(context, 10),
                      ),
                      child: SvgPicture.string(SvgIcons.getIcon(
                        SvgIconEnum.downArrow,
                        fillColor: context.theme.colorScheme.onTertiaryContainer,
                      )),
                    ),
                  ),
                  itemBuilder: (item) {
                    final text = MapConstants.userLevels[item] ?? '';
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        text,
                        style: Dimens.getProportionalFont(
                          context, context.theme.textTheme.bodyMedium,
                        ).copyWith(
                          fontSize: Dimens.getProportionalHeight(context, 15),
                        ),
                      ),
                    );
                  },
                  onChanged: (value) {
                    context.read<ProfileCubit>().onAFieldChanged(
                      value ?? '', 'level', text: S.current.skillLevel,
                    );
                    if (value == null || value == state.userInfo?.level) return;
                    context.read<ProfileCubit>().emitNewState(
                      state.copyWith(
                        userInfo: state.userInfo?.copyWith(level: value),
                      )
                    );
                  },
                  errorText: state.errorsMap['level'],
                ),
                const EmptyProportionalSpace(height: itemDistance),

                // want to learn
                buildTitle(context, S.current.learningInterests),
                const EmptyProportionalSpace(height: itemDistance / 6),
                if (state.errorsMap['wantToLearn'] != null)
                  SizedBox(
                    width: Dimens.getScreenWidth(context),
                    child: Text(state.errorsMap['wantToLearn'] ?? '',
                      style: Dimens.getProportionalFont(
                        context, context.theme.textTheme.bodyMedium,
                      ).copyWith(
                        color: context.theme.colorScheme.error,
                        fontSize: Dimens.getProportionalHeight(context, 15),
                      ),
                    ),
                  ),
                const EmptyProportionalSpace(height: itemDistance / 4),
                WantToSturdySubjectAndTest(
                  isEdit: true,
                  listSelectedLearnTopics: state.selectedLearnTopics,
                  listSelectedTestPreparations: state.selectedTestPreparations,
                  onSelected: (isLearnTopics, isSelected, key) {
                    context.read<ProfileCubit>().onSelectedWantToSturdyChanged(
                      isLearnTopic: isLearnTopics,
                      isSelected: isSelected,
                      key: key,
                    );
                  },
                ),
                const EmptyProportionalSpace(height: itemDistance),

                // preferred schedule note
                buildTitle(context, S.current.preferredSchedule, isRequired: false),
                const EmptyProportionalSpace(height: itemDistance / 4),
                TextFieldOutline(
                  textController: context.read<ProfileCubit>().sturdyScheduleController,
                  maxLines: 5,
                  hintText: S.current.preferredScheduleHint,
                ),
                const EmptyProportionalSpace(height: itemDistance),

                // cancel and save buttons
                Row(
                  children: [
                    Expanded(
                      child: PrimaryOutlineButton(
                        onTap: () {
                          context.read<ProfileCubit>().onChangeMode(isEditMode: false);
                        },
                        paddingVertical: Dimens.getProportionalHeight(context, 12),
                        preferGradient: false,
                        child: Text(
                          S.current.cancel,
                          style: Dimens.getProportionalFont(
                            context, context.theme.textTheme.bodyMedium,
                          ).copyWith(color: context.theme.colorScheme.primary),
                        ),
                      ),
                    ),
                    const EmptyProportionalSpace(width: 6),
                    Expanded(
                      child: PrimaryFillButton(
                        onTap: () {
                          context.read<ProfileCubit>().onUploadUserInfoChanges();
                        },
                        paddingVertical: Dimens.getProportionalHeight(context, 12),
                        preferGradient: false,
                        child: Text(
                          S.current.saveChanges,
                          style: Dimens.getProportionalFont(
                            context, context.theme.textTheme.bodyMedium,
                          ).copyWith(
                            color: context.theme.colorScheme.onPrimary,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const EmptyProportionalSpace(height: itemDistance),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildTitle(BuildContext context, String title, {bool isRequired = true}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        if (isRequired)
          Icon(
            Icons.ac_unit_rounded,
            color: context.theme.colorScheme.onErrorContainer,
            size: Dimens.getProportionalWidth(context, 12),
          ),
        const EmptyProportionalSpace(width: 3),
        Flexible(
          child: Text(
            title,
            softWrap: true,
            style: Dimens.getProportionalFont(
              context, context.theme.textTheme.headlineLarge,
            ),
          ),
        ),
      ],
    );
  }
}
