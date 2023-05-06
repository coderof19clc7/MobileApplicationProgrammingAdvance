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

class EditStudentRequestDialog extends StatefulWidget {
  const EditStudentRequestDialog({
    super.key,
    required this.currentRequest,
    this.onEditButtonTap,
  });

  final String currentRequest;
  final Future<void> Function(String newRequest)? onEditButtonTap;

  @override
  State<EditStudentRequestDialog> createState() => _EditStudentRequestDialogState();
}

class _EditStudentRequestDialogState extends State<EditStudentRequestDialog> {
  final distanceBetweenField = 10.0;
  late final TextEditingController _noteController;
  var isEditing = false;

  @override
  void initState() {
    super.initState();
    _noteController = TextEditingController();
    _noteController.text = widget.currentRequest;
  }

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  void changeIsEditing() {
    setState(() {
      isEditing = !isEditing;
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
            top: Dimens.getProportionalHeight(context, 15),
            bottom: Dimens.getProportionalHeight(context, 10),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // header
                Text(S.current.requestForClass, style: Dimens.getProportionalFont(
                  context, context.theme.textTheme.titleLarge,
                )),

                EmptyProportionalSpace(height: distanceBetweenField),
                Container(
                  width: Dimens.getScreenWidth(context),
                  height: 1,
                  color: context.theme.colorScheme.inverseSurface.withOpacity(0.5),
                ),
                EmptyProportionalSpace(height: distanceBetweenField),

                Text(
                  '${S.current.notes} (${S.current.cannotEmpty('')})',
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
                  maxLines: 10,
                  maxLength: 200,
                  enable: !isEditing,
                ),
                EmptyProportionalSpace(height: distanceBetweenField),

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
                        onTap: isEditing ? null : () => Navigator.pop(context),
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
                        onTap: (isEditing || _noteController.text.trim().isEmpty)
                            ? null
                            : () {
                          changeIsEditing();
                          widget.onEditButtonTap?.call(_noteController.text).then((value) {
                            changeIsEditing();
                            Navigator.of(context).pop();
                          });
                        },
                        paddingVertical: Dimens.getProportionalHeight(
                          context, isEditing ? 10 : 12,
                        ),
                        preferGradient: false,
                        hasShadow: false,
                        bgColor: _noteController.text.trim().isEmpty
                            ? AppColors.neutralBlue100 : null,
                        child: isEditing
                            ? CupertinoActivityIndicator(
                          color: context.theme.colorScheme.onPrimary,
                        )
                            : Text(
                          S.current.edit,
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
