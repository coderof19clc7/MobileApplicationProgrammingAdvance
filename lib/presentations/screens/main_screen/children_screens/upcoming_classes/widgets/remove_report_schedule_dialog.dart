import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:one_one_learn/configs/constants/colors.dart';
import 'package:one_one_learn/configs/constants/debounces.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/generated/l10n.dart';
import 'package:one_one_learn/presentations/widgets/others/app_dropdown.dart';
import 'package:one_one_learn/presentations/widgets/buttons/primary_fill_button.dart';
import 'package:one_one_learn/presentations/widgets/buttons/primary_outline_button.dart';
import 'package:one_one_learn/presentations/widgets/others/simple_network_image.dart';
import 'package:one_one_learn/presentations/widgets/spaces/empty_proportional_space.dart';
import 'package:one_one_learn/presentations/widgets/text_fields/text_field_outline.dart';
import 'package:one_one_learn/utils/extensions/app_extensions.dart';
import 'package:one_one_learn/utils/helpers/debounce_helper.dart';
import 'package:one_one_learn/utils/helpers/ui_helper.dart';

class RemoveReportScheduleDialog extends StatefulWidget {
  const RemoveReportScheduleDialog({
    super.key,
    this.dropdownTitle = '',
    required this.tutorAva,
    required this.tutorName,
    required this.dateTimeString,
    required this.dropDownData,
    this.onEditButtonTap,
  });

  final String dropdownTitle, tutorAva, tutorName, dateTimeString;
  final Map<int, String> dropDownData;
  final Future<void> Function(int reasonId, String note)? onEditButtonTap;

  @override
  State<RemoveReportScheduleDialog> createState() => _RemoveReportScheduleDialogState();
}

class _RemoveReportScheduleDialogState extends State<RemoveReportScheduleDialog> {
  final distanceBetweenField = 15.0;
  late final TextEditingController _noteController;
  late final List<int> listKeys;
  late final List<MapEntry<int, String>> listMapEntries;
  int? mainReasonId;
  var isExecutingCallback = false;

  @override
  void initState() {
    super.initState();
    _noteController = TextEditingController();
    listKeys = widget.dropDownData.keys.toList();
    listMapEntries = widget.dropDownData.entries.toList();
  }

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  void changeIsEditing() {
    setState(() {
      isExecutingCallback = !isExecutingCallback;
    });
  }

  void changeMainReasonId(int? newId) {
    if (newId == mainReasonId) return;
    setState(() {
      mainReasonId = newId;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        UIHelper.hideKeyboard(context);
      },
      child: Dialog(
        child: Padding(
          padding: EdgeInsets.only(
            left: Dimens.getProportionalWidth(context, 12),
            right: Dimens.getProportionalWidth(context, 12),
            top: Dimens.getProportionalHeight(context, distanceBetweenField * 2),
            bottom: Dimens.getProportionalHeight(context, 10),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // header
                buildHeader(context),

                EmptyProportionalSpace(height: distanceBetweenField + 5),
                Container(
                  width: Dimens.getScreenWidth(context),
                  height: 1,
                  color: context.theme.colorScheme.inverseSurface.withOpacity(0.5),
                ),
                EmptyProportionalSpace(height: distanceBetweenField + 5),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.ac_unit_rounded,
                      color: context.theme.colorScheme.onErrorContainer,
                      size: Dimens.getProportionalWidth(context, 12),
                    ),
                    const EmptyProportionalSpace(width: 3),
                    Flexible(
                      child: Text(
                        widget.dropdownTitle,
                        softWrap: true,
                        style: Dimens.getProportionalFont(
                          context, context.theme.textTheme.titleLarge,
                        ),
                      ),
                    ),
                  ],
                ),
                EmptyProportionalSpace(height: distanceBetweenField / 2),
                AppDropDown(
                  onChanged: isExecutingCallback ? null : changeMainReasonId,
                  value: mainReasonId,
                  data: widget.dropDownData.keys.toList(),
                  itemBuilder: (item) {
                    var index = listKeys.indexOf(item);
                    if (index < 0) {
                      index = 0;
                    }
                    final text = listMapEntries[index].value;
                    return DropdownMenuItem<int>(
                      value: item,
                      child: Text(
                        text, style: Dimens.getProportionalFont(
                        context, context.theme.textTheme.bodyMedium,
                      ).copyWith(
                        color: context.theme.colorScheme.onTertiaryContainer,
                      ),
                      ),
                    );
                  },
                ),
                EmptyProportionalSpace(height: distanceBetweenField),

                Text(
                  S.current.notes,
                  style: Dimens.getProportionalFont(
                    context, context.theme.textTheme.titleMedium,
                  ),
                ),
                EmptyProportionalSpace(height: distanceBetweenField / 2),
                TextFieldOutline(
                  textController: _noteController,
                  onChanged: (value) {
                    DebounceHelper.runWait(
                        DebounceConstants.upcomingRequestOnChanged,
                        duration: const Duration(milliseconds: 500),
                        callback: () {
                          setState(() {});
                        }
                    );
                  },
                  maxLines: 5,
                  enable: !isExecutingCallback,
                ),
                EmptyProportionalSpace(height: distanceBetweenField + 5),

                // 2 buttons field
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Expanded(
                      flex: 3,
                      child: SizedBox(),
                    ),
                    Expanded(
                      flex: 2,
                      child: PrimaryOutlineButton(
                        onTap: isExecutingCallback ? null : () => Navigator.pop(context),
                        paddingVertical: Dimens.getProportionalHeight(context, 10),
                        child: Text(S.current.cancel, style: Dimens.getProportionalFont(
                          context, context.theme.textTheme.bodyMedium,
                        ).copyWith(color: context.theme.colorScheme.primary)),
                      ),
                    ),
                    const EmptyProportionalSpace(width: 7),
                    Expanded(
                      flex: 2,
                      child: PrimaryFillButton(
                        onTap: (isExecutingCallback || mainReasonId == null)
                            ? null
                            : () {
                          changeIsEditing();
                          widget.onEditButtonTap?.call(
                            mainReasonId ?? 0, _noteController.text.trim(),
                          ).then((value) {
                            changeIsEditing();
                            Navigator.of(context).pop();
                          });
                        },
                        paddingVertical: Dimens.getProportionalHeight(
                          context, isExecutingCallback ? 10 : 12,
                        ),
                        preferGradient: false,
                        hasShadow: false,
                        bgColor: mainReasonId == null
                            ? AppColors.neutralBlue100 : null,
                        child: isExecutingCallback
                            ? CupertinoActivityIndicator(
                          color: context.theme.colorScheme.onPrimary,
                        )
                            : Text(
                          S.current.report,
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildHeader(BuildContext context) {
    final avaSize = Dimens.getScreenWidth(context) * 0.17;
    return SizedBox(
      width: Dimens.getScreenWidth(context),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(avaSize / 2),
            child: SimpleNetworkImage(
              url: widget.tutorAva,
              width: avaSize,
              height: avaSize,
            ),
          ),
          const EmptyProportionalSpace(height: 3),
          Text(
            widget.tutorName,
            style: Dimens.getProportionalFont(
              context, context.theme.textTheme.titleLarge,
            ),
          ),
          EmptyProportionalSpace(height: distanceBetweenField),
          Text(
            S.current.lessonTime,
            style: Dimens.getProportionalFont(
              context, context.theme.textTheme.bodyMedium,
            ),
          ),
          Text(
            widget.dateTimeString,
            style: Dimens.getProportionalFont(
              context, context.theme.textTheme.titleLarge,
            ),
          ),
        ],
      ),
    );
  }
}
