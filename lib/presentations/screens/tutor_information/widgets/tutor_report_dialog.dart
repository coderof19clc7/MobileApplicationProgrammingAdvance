import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:one_one_learn/configs/constants/colors.dart';
import 'package:one_one_learn/configs/constants/debounces.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/generated/l10n.dart';
import 'package:one_one_learn/presentations/widgets/buttons/primary_fill_button.dart';
import 'package:one_one_learn/presentations/widgets/buttons/primary_outline_button.dart';
import 'package:one_one_learn/presentations/widgets/spaces/empty_proportional_space.dart';
import 'package:one_one_learn/presentations/widgets/text_fields/text_field_outline.dart';
import 'package:one_one_learn/utils/extensions/app_extensions.dart';
import 'package:one_one_learn/utils/helpers/debounce_helper.dart';
import 'package:one_one_learn/utils/helpers/ui_helper.dart';

class TutorReportDialog extends StatefulWidget {
  const TutorReportDialog({
    super.key,
    required this.tutorName,
    this.onReportButtonTap,
  });

  final String tutorName;
  final Future<void> Function(String content)? onReportButtonTap;

  @override
  State<TutorReportDialog> createState() => _TutorReportDialogState();
}

class _TutorReportDialogState extends State<TutorReportDialog> {
  late final TextEditingController _contentController;
  final checkboxValueList = [
    S.current.tutorAnnoyingIssue,
    S.current.tutorFakeProfileIssue,
    S.current.tutorPhotoInappropriateIssue,
  ];
  var checkboxReportContents = [];
  var isReporting = false;

  @override
  void initState() {
    super.initState();
    _contentController = TextEditingController();
  }

  @override
  void dispose() {
    _contentController.dispose();
    super.dispose();
  }

  String getFullReportContent() {
    return '${_contentController.text}\n${checkboxReportContents.join('\n')}'.trim();
  }

  void changeIsReporting() {
    setState(() {
      isReporting = !isReporting;
    });
  }

  void onCheckboxStatusChange(String content, {required bool value}) {
    setState(() {
      if (value) {
        checkboxReportContents.add(content);
      } else {
        checkboxReportContents.remove(content);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    const distanceBetweenField = 20.0, distanceBetweenItem = 5.0;
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
            top: Dimens.getProportionalHeight(context, 15),
            bottom: Dimens.getProportionalHeight(context, 10),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // header
                Text(
                  '${S.current.report} ${widget.tutorName}',
                  style: Dimens.getProportionalFont(
                    context, context.theme.textTheme.titleLarge,
                  ),
                ),
                const EmptyProportionalSpace(height: distanceBetweenField + 10),

                // requirement
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.error_rounded,
                      size: Dimens.getProportionalWidth(context, 19),
                    ),
                    const EmptyProportionalSpace(width: distanceBetweenItem),
                    Flexible(
                      child: Text(
                        S.current.reportTutorRequirement,
                        style: Dimens.getProportionalFont(
                          context, context.theme.textTheme.titleMedium,
                        ),
                      ),
                    ),
                  ],
                ),

                // checkboxes
                for(var i = 0; i < checkboxValueList.length; i++)
                  ListTileTheme(
                    horizontalTitleGap: 0,
                    child: CheckboxListTile(
                      value: checkboxReportContents.contains(checkboxValueList[i]),
                      onChanged: (value) {
                        onCheckboxStatusChange(checkboxValueList[i], value: value ?? false);
                      },
                      activeColor: context.theme.colorScheme.primary,
                      controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: EdgeInsets.zero,
                      dense: true,
                      title: Text(
                        checkboxValueList[i],
                        style: Dimens.getProportionalFont(
                          context, context.theme.textTheme.bodyMedium,
                        ),
                      ),
                    ),
                  ),
                const EmptyProportionalSpace(height: distanceBetweenField),

                // note field
                Text(
                  S.current.otherIssues,
                  style: Dimens.getProportionalFont(
                    context, context.theme.textTheme.titleMedium,
                  ),
                ),
                const EmptyProportionalSpace(height: distanceBetweenItem),
                TextFieldOutline(
                  textController: _contentController,
                  onChanged: (value) {
                    DebounceHelper.runWait(
                      DebounceConstants.reportOtherIssueOnChanged,
                      duration: const Duration(milliseconds: 500),
                      callback: () {
                        setState(() {});
                      }
                    );
                  },
                  maxLines: 5,
                  enable: !isReporting,
                ),
                const EmptyProportionalSpace(height: distanceBetweenField),

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
                        onTap: isReporting ? null : () => Navigator.pop(context),
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
                        onTap: (getFullReportContent().isEmpty || isReporting) ? null : () {
                          changeIsReporting();
                          widget.onReportButtonTap?.call(getFullReportContent()).then((value) {
                            changeIsReporting();
                            Navigator.of(context).pop();
                          });
                        },
                        paddingVertical: Dimens.getProportionalHeight(context, 10),
                        preferGradient: false,
                        hasShadow: false,
                        bgColor: getFullReportContent().isEmpty
                            ? AppColors.neutralBlue100 : null,
                        child: isReporting
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
}
