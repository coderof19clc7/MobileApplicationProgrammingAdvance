import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:one_one_learn/configs/app_configs/app_extensions.dart';
import 'package:one_one_learn/configs/constants/colors.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/utils/ui_helper.dart';

class NormalBottomSheetDialog extends StatelessWidget {
  const NormalBottomSheetDialog({
    super.key,
    this.title,
    this.smallTitle,
    this.leftButtonText,
    this.rightButtonText,
    this.body,
    this.hasButton = false,
    this.hasHeaderDivider = true,
    this.topPadding = 16.0,
    this.bottomPadding = 16.0,
    this.rightPadding = 16.0,
    this.leftPadding = 16.0,
    this.dividerVerticalSpace = 8.0,
    this.spaceBetweenLeftAndRightButton = 21.0,
    this.initialChildSize = 0.5,
    this.minChildSize = 0.25,
    this.maxChildSize = 0.9,
    this.snapSizes = const [0.5, 0.9],
    this.backgroundColor,
    this.titleTextAlignment = TextAlign.center,
    this.titleTextStyle,
    this.smallTitleTextStyle,
    this.titleAlignment = CrossAxisAlignment.center,
    this.data,
    this.onLeftButtonPress,
    this.onRightButtonPress,
    this.enableDrag = false,
    this.snap = false,
    this.isShowButtonCancelHeader = false,
    this.onButtonCancelHeaderPress,
    this.onHideBottomSheet,
    this.isScrolling = true,
    this.maxHeight,
  });

  final String? title;
  final String? smallTitle;
  final String? leftButtonText;
  final String? rightButtonText;
  final Widget? body;
  final bool hasButton;
  final bool hasHeaderDivider;
  final double topPadding, rightPadding, bottomPadding, leftPadding;
  final double dividerVerticalSpace, spaceBetweenLeftAndRightButton;
  final double initialChildSize, minChildSize, maxChildSize;
  final List<double> snapSizes;
  final Color? backgroundColor;
  final TextStyle? titleTextStyle;
  final TextStyle? smallTitleTextStyle;
  final TextAlign titleTextAlignment;
  final CrossAxisAlignment titleAlignment;
  final bool enableDrag;
  final bool snap;
  final Object? data;
  final Function(Object?)? onLeftButtonPress;
  final Function(Object?)? onRightButtonPress;
  final Function()? onButtonCancelHeaderPress;
  final Function()? onHideBottomSheet;
  final bool isScrolling;
  final bool isShowButtonCancelHeader;
  final double? maxHeight;

  static BuildContext? _context;
  static NormalBottomSheetDialog? _instance;

  static void hide() {
    if (_context == null) return;
    Navigator.of(_context!).pop();
  }

  static Future? show(BuildContext context,{
    bool isShowButtonCancelHeader = false,
    String? title,
    String? smallTitle,
    String? leftButtonText,
    String? rightButtonText,
    bool isDismissible = true,
    bool enableDrag = false,
    bool snap = false,
    Widget? body,
    TextStyle? titleTextStyle,
    TextStyle? smallTitleTextStyle,
    TextAlign titleTextAlignment = TextAlign.center,
    CrossAxisAlignment titleAlignment = CrossAxisAlignment.center,
    bool hasHeaderDivider = true,
    double topPadding = 16.0,
    double bottomPadding = 16.0,
    double rightPadding = 16.0,
    double leftPadding = 16.0,
    double dividerVerticalSpace = 8.0,
    double spaceBetweenLeftAndRightButton = 21.0,
    double initialChildSize = 0.5,
    double minChildSize = 0.25,
    double maxChildSize = 0.9,
    List<double> snapSizes = const [0.5, 0.9],
    double? maxHeight,
    Color? backgroundColor,
    bool hasButton = false,
    Object? data,
    Function(Object?)? onLeftButtonPress,
    Function(Object?)? onRightButtonPress,
    Function(Object?)? onCloseButtonPress,
    Function()? onButtonCancelHeaderPress,
    Function()? onHideBottomSheet,
    bool isScrolling = true,
  }) {
    if (_instance == null) {
      _instance = NormalBottomSheetDialog(
        onHideBottomSheet: onHideBottomSheet,
        isShowButtonCancelHeader: isShowButtonCancelHeader,
        title: title,
        smallTitle: smallTitle,
        leftButtonText: leftButtonText,
        rightButtonText: rightButtonText,
        body: body,
        hasButton: hasButton,
        hasHeaderDivider: hasHeaderDivider,
        titleTextStyle: titleTextStyle,
        smallTitleTextStyle: smallTitleTextStyle,
        titleAlignment: titleAlignment,
        titleTextAlignment: titleTextAlignment,
        topPadding: topPadding,
        bottomPadding: bottomPadding,
        rightPadding: rightPadding,
        leftPadding: leftPadding,
        dividerVerticalSpace: dividerVerticalSpace,
        initialChildSize: initialChildSize,
        minChildSize: minChildSize,
        maxChildSize: maxChildSize,
        snapSizes: snapSizes,
        backgroundColor: backgroundColor ?? AppColors.white,
        data: data,
        onLeftButtonPress: onLeftButtonPress,
        onRightButtonPress: onRightButtonPress,
        onButtonCancelHeaderPress: onButtonCancelHeaderPress,
        isScrolling: isScrolling,
        maxHeight: maxHeight,
      );
      return showModalBottomSheet(
        context: context,
        isDismissible: isDismissible,
        isScrollControlled: true,
        enableDrag: enableDrag,
        barrierColor: AppColors.black.withOpacity(0.5),
        builder: (BuildContext contextBuilder) {
          _context = contextBuilder;
          if (kDebugMode) {
            print('building dialog...');
          }
          return _instance ?? const SizedBox();
        },
      ).then((value) {
        _context = null;
        _instance = null;
      });
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    // _context = context;
    return WillPopScope(
      onWillPop: () async {
        onHideBottomSheet?.call();
        hide();
        return false;
      },
      child: DraggableScrollableSheet(
        expand: false,
        initialChildSize: initialChildSize,
        minChildSize: minChildSize,
        maxChildSize: maxChildSize,
        snap: true,
        snapSizes: snapSizes,
        builder: (dragContext, dragScrollController) {
          return GestureDetector(
            onTap: () => UIHelper.hideKeyboard(context),
            child: Container(
              width: Dimens.getScreenWidth(context),
              padding: EdgeInsets.only(
                top: Dimens.getProportionalScreenHeight(
                  context,
                  isShowButtonCancelHeader ? 16.5 : topPadding,
                ),
                bottom: MediaQuery.of(context).viewInsets.bottom
                    + Dimens.getProportionalScreenHeight(context, bottomPadding),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: titleAlignment,
                children: [
                  ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    controller: enableDrag ? dragScrollController : null,
                    children: [
                      if (isShowButtonCancelHeader) _buildButtonCancelHeader(context),
                      Padding(
                        padding: EdgeInsets.only(
                          left: Dimens.getProportionalScreenWidth(context, leftPadding),
                          right: Dimens.getProportionalScreenWidth(context, rightPadding),
                        ),
                        child: _buildHeadField(context),
                      ),
                    ]
                  ),

                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: Dimens.getProportionalScreenWidth(
                            context, leftPadding),
                        right: Dimens.getProportionalScreenWidth(
                            context, rightPadding),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          //body widget field (important field --> must have)
                          Flexible(child: body ?? Container()),
                        ],
                      ),
                    ),
                  ),

                  //button field (if hasButton is true)
                  if (hasButton) ...[
                    Padding(
                      padding: EdgeInsets.only(
                        left: Dimens.getProportionalScreenWidth(context, leftPadding),
                        right: Dimens.getProportionalScreenWidth(context, rightPadding),
                      ),
                      child: UIHelper.buildDialogButton(
                        context: context,
                        data: data,
                        spaceBetweenLeftAndRight: spaceBetweenLeftAndRightButton,
                        leftButtonText: leftButtonText,
                        rightButtonText: rightButtonText,
                        onLeftButtonPress:
                        onLeftButtonPress ?? (data) => hide(),
                        onRightButtonPress:
                        onRightButtonPress ?? (data) => hide(),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildButtonCancelHeader(BuildContext context) {
    return Visibility(
      visible: isShowButtonCancelHeader,
      child: Align(
        alignment: Alignment.centerRight,
        child: InkWell(
          onTap: () {
            onButtonCancelHeaderPress?.call();
            hide();
          },
          child: Container(
            padding: EdgeInsets.only(
              right: Dimens.getProportionalScreenWidth(context, 17),
            ),
            child: Icon(
              Icons.close_rounded,
              color: context.theme.colorScheme.onTertiaryContainer,
              size: Dimens.getProportionalScreenWidth(context, 15),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeadField(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: titleAlignment,
      children: [
        // title field (if it is not null)
        if (title != null) ...[
          Text(
            title!,
            textAlign: titleTextAlignment,
            style: titleTextStyle ?? Dimens.getProportionalFont(
              context, context.theme.textTheme.titleMedium,
            ),
          ),
        ],

        // small title field (if it is not null)
        if (smallTitle != null) ...[
          SizedBox(
            height: Dimens.getProportionalScreenHeight(context, 8),
          ),
          Text(
            smallTitle ?? '',
            textAlign: titleTextAlignment,
            style: smallTitleTextStyle ?? Dimens.getProportionalFont(
              context, context.theme.textTheme.bodySmall,
            ),
          ),
        ],

        //divider between header and body (if user want to show and title or small title not null)
        if (hasHeaderDivider && (title != null || smallTitle != null)) ...[
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: Dimens.getProportionalScreenWidth(
                context,
                dividerVerticalSpace,
              ),
            ),
            child: Divider(
              height: Dimens.getProportionalScreenHeight(context, 2),
              color: context.theme.colorScheme.onInverseSurface,
            ),
          ),
        ],
      ],
    );
  }
}
