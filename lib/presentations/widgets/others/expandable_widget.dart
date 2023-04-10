import 'package:flutter/material.dart';
import 'package:one_one_learn/configs/app_configs/app_extensions.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';

enum ControlIconAnimation {
  quarterLeft,
  halfLeft,
  halfPlusQuarterLeft,
  fullLeft,
  quarterRight,
  halfRight,
  halfPlusQuarterRight,
  fullRight,
}

class ExpandableWidget extends StatefulWidget {
  const ExpandableWidget({
    super.key,
    this.decoration,
    this.animationController,
    this.duration = 200,
    this.children = const [],
    this.mainAxisSize = MainAxisSize.max,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.initialExpandedState = false,
    this.tabHeaderToExpandOrCollapse = false,
    this.disable = false,
    this.autoChangeWidgetOnTap = true,
    this.header,
    this.leadingIcon,
    this.trailingIcon,
    this.controlIconIndex = 2,
    this.controlIconAnimation,
    this.headerPadding = EdgeInsets.zero,
    this.childrenPadding = EdgeInsets.zero,
    this.defaultControlIconSize = 24,
    this.headerBodyDistance = 8,
    this.headerBodyDistanceAffectOutsideWidget = true,
    this.willAutoDisposeController = true,
    this.onExpansionChanged,
  });

  final BoxDecoration? decoration;
  final AnimationController? animationController;
  final int duration;
  final List<Widget> children;
  final MainAxisSize mainAxisSize;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final bool initialExpandedState;
  final bool tabHeaderToExpandOrCollapse;
  final bool disable;
  final bool autoChangeWidgetOnTap;
  final Widget? header;
  final Widget? leadingIcon;
  final Widget? trailingIcon;
  final int controlIconIndex;
  final double defaultControlIconSize;
  final ControlIconAnimation? controlIconAnimation;
  final double headerBodyDistance;
  final bool headerBodyDistanceAffectOutsideWidget;
  final bool willAutoDisposeController;
  final EdgeInsetsGeometry headerPadding;
  final EdgeInsetsGeometry childrenPadding;

  final void Function(bool isExpanded)? onExpansionChanged;

  @override
  State<ExpandableWidget> createState() => _ExpandableWidgetState();
}

class _ExpandableWidgetState extends State<ExpandableWidget> with SingleTickerProviderStateMixin {
  // static final Animatable<double> _easeOutTween = CurveTween(curve: Curves.easeOut);
  final Animatable<double> _easeInTween = CurveTween(curve: Curves.easeIn);

  late AnimationController _animationController;
  late Animation<double> _iconTurns;
  late Animation<double> _heightFactor;

  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _animationController = widget.animationController ??
        AnimationController(
          duration: Duration(milliseconds: widget.duration),
          vsync: this,
        );
    _animationController.addStatusListener(_onCollapseListener);

    _iconTurns = _animationController.drive(getControlIconRotatingDirection().chain(_easeInTween));
    _heightFactor = _animationController.drive(_easeInTween);

    _isExpanded = widget.initialExpandedState;
    if (_isExpanded) _animationController.value = 1;
  }

  Tween<double> getControlIconRotatingDirection() {
    switch (widget.controlIconAnimation) {
      case ControlIconAnimation.quarterLeft:
        return Tween<double>(begin: 0, end: -0.25);
      case ControlIconAnimation.halfLeft:
        return Tween<double>(begin: 0, end: -0.5);
      case ControlIconAnimation.halfPlusQuarterLeft:
        return Tween<double>(begin: 0, end: -0.75);
      case ControlIconAnimation.fullLeft:
        return Tween<double>(begin: 0, end: -1);
      case ControlIconAnimation.quarterRight:
        return Tween<double>(begin: 0, end: 0.25);
      case ControlIconAnimation.halfRight:
        return Tween<double>(begin: 0, end: 0.5);
      case ControlIconAnimation.halfPlusQuarterRight:
        return Tween<double>(begin: 0, end: 0.75);
      case ControlIconAnimation.fullRight:
        return Tween<double>(begin: 0, end: 1);
      default:
        return widget.controlIconIndex == 1 ? Tween<double>(begin: 0, end: 0.5) : Tween<double>(begin: 0, end: 0.25);
    }
  }

  Widget _buildRotationIcon(Widget icon) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: (!widget.tabHeaderToExpandOrCollapse && !widget.disable) ? _onControlIconTabbed : null,
        child: RotationTransition(
          turns: _iconTurns,
          child: icon,
        ),
      ),
    );
  }

  Widget _buildLeadingIcon(double defaultControlIconSize) {
    var isVisibility = true;
    if (widget.controlIconIndex == 0) isVisibility = false;
    final icon = widget.leadingIcon;
    return Visibility(
        maintainSize: true,
        maintainAnimation: true,
        maintainState: true,
        visible: isVisibility,
        child: _buildRotationIcon(widget.controlIconIndex == 1
            ? (icon ??
            Icon(
              Icons.keyboard_arrow_down_rounded,
              size: defaultControlIconSize,
            ))
            : (icon ?? const SizedBox(width: 0))));
  }

  Widget _buildTrailingIcon(double defaultControlIconSize) {
    var isVisibility = true;
    if (widget.controlIconIndex == 0) isVisibility = false;
    final icon = widget.trailingIcon;
    return Visibility(
        maintainSize: true,
        maintainAnimation: true,
        maintainState: true,
        visible: isVisibility,
        child: _buildRotationIcon(
          widget.controlIconIndex == 2
              ? (icon ??
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: defaultControlIconSize,
              ))
              : (icon ?? const SizedBox(width: 0)),
        ));
  }

  void _expandOrCollapseBody() {
    _isExpanded = !_isExpanded;
    if (_isExpanded) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  void _onCollapseListener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      setState(() {
        if (!_isExpanded) _isExpanded = !_isExpanded;
      });
    }
    if (status == AnimationStatus.dismissed) {
      if (!mounted) return;
      setState(() {
        if (_isExpanded) _isExpanded = !_isExpanded;
      });
    }
  }

  void _onControlIconTabbed({bool executeCallBack = true}) {
    if (executeCallBack) widget.onExpansionChanged?.call(!_isExpanded);
    if (widget.autoChangeWidgetOnTap) _expandOrCollapseBody();
  }

  Widget _buildHeader(double defaultControlIconSize) {
    return InkWell(
      onTap: (widget.tabHeaderToExpandOrCollapse && !widget.disable) ? _onControlIconTabbed : null,
      child: Padding(
        padding: widget.headerPadding,
        child: Row(
          children: [
            _buildLeadingIcon(defaultControlIconSize),
            Expanded(
              child: widget.header ?? const SizedBox(),
            ),
            _buildTrailingIcon(defaultControlIconSize),
          ],
        ),
      ),
    );
  }

  Widget _buildBody() {
    return SizeTransition(
      sizeFactor: _heightFactor,
      child: Padding(
        padding: widget.childrenPadding,
        child: Column(
          mainAxisSize: widget.mainAxisSize,
          mainAxisAlignment: widget.mainAxisAlignment,
          crossAxisAlignment: widget.crossAxisAlignment,
          children: <Widget>[
            if (!widget.headerBodyDistanceAffectOutsideWidget)
              SizedBox(
                height: Dimens.getProportionalScreenHeight(
                  context,
                  widget.headerBodyDistance,
                ),
              ),
            ...widget.children,
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final defaultControlIconSize = Dimens.getProportionalScreenWidth(
      context,
      widget.defaultControlIconSize,
    );

    if (!widget.autoChangeWidgetOnTap && (_isExpanded != widget.initialExpandedState)) {
      _isExpanded = widget.initialExpandedState;
      _animationController.value = _isExpanded ? 1 : 0;
    }

    return DecoratedBox(
      decoration: widget.decoration ??
          BoxDecoration(
            color: context.theme.colorScheme.surface,
          ),
      child: Column(
        children: [
          _buildHeader(defaultControlIconSize),
          if (widget.headerBodyDistanceAffectOutsideWidget)
            SizedBox(
              height: Dimens.getProportionalScreenHeight(
                context,
                widget.headerBodyDistance,
              ),
            ),
          _buildBody(),
        ],
      ),
    );
  }

  @override
  void dispose() {
    if (widget.willAutoDisposeController) {
      _animationController
        ..removeStatusListener(_onCollapseListener)
        ..dispose();
    }
    super.dispose();
  }
}
