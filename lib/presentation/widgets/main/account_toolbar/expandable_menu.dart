library expandable_menu;

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:toolo_gostar/atras_direction.dart';

import 'expandable_icon.dart';

/// This class is main class of [ExpandableMenu] widget.
class ExpandableMenu extends StatefulWidget {
  /// This property declare height of widget.
  final double height;
  final double maxSpaceWidth;

  /// This property will contains items in list of menu.
  final List<Widget> items;

  /// This property declare background color of widget
  /// and default value is [Color(0xFF4B5042)].
  final Color? backgroundColor;

  /// This property declare item background color
  /// and if it's be null default value is [Colors.white.withOpacity(.4)]
  final Color? itemContainerColor;

  const ExpandableMenu({
    Key? key,
    this.height = 40,
    required this.maxSpaceWidth,
    required this.items,
    this.backgroundColor,
    this.itemContainerColor,
  }) : super(key: key);

  @override
  State<ExpandableMenu> createState() => _ExpandableMenuState();
}

class _ExpandableMenuState extends State<ExpandableMenu>
    with TickerProviderStateMixin {
  /// This private property declare for measure expanded state of widget.
  final _spacerKey = GlobalKey();

  /// This private property declare list items size.
  /// Every item size computed with [itemSize] method
  late double _listItemSize;

  /// This private property declare items in widgets.
  List<Widget> _listWidget = List.empty(growable: true);

  /// This private property declare expand status of widget.
  /// If [_isExpanded] equals true it's meaning widget is expanded and
  /// if [_isExpanded] equals false it's meaning widget is not expanded.
  bool _isExpanded = false;

  /// This private property declare main container animation
  late Animation<double> _containerAnimation;

  /// This private property declare main container animation controller
  late AnimationController _containerAnimationController;

  /// This private property declare main container animation progress value.
  double _containerProgress = 0.0;

  /// This private property declare list timer for build every 60 millisecond [buildContainer].
  Timer? _listTimer;

  @override
  void initState() {
    _containerAnimationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    final Animation<double> containerCurve = CurvedAnimation(
      parent: _containerAnimationController,
      curve: Curves.fastLinearToSlowEaseIn,
    );
    _containerAnimation = Tween(begin: 0.0, end: 1.0).animate(containerCurve)
      ..addListener(() {
        setState(() {
          _containerProgress = _containerAnimation.value;
          if (!_isExpanded && _containerProgress == 0.0) {
            _listWidget = List.empty(growable: true);
          }
        });
      });

    super.initState();

    Future.delayed(const Duration(milliseconds: 100), () {
      _listItemSize = widget.height;
    });
  }

  @override
  void dispose() {
    _containerAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double maxWidth = widget.maxSpaceWidth;
    double maxListWidth = widget.maxSpaceWidth * 0.9;
    double iconWith = widget.height;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Spacer(
          key: _spacerKey,
        ),
        Container(
          clipBehavior: Clip.antiAlias,
          constraints: BoxConstraints(minWidth: 50, maxWidth: maxWidth),
          decoration: BoxDecoration(
              color: widget.backgroundColor,
              borderRadius: const BorderRadius.all(Radius.circular(4))),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ExpandableIcon(
                width: iconWith,
                height: widget.height,
                onClicked: () {
                  onExpandableIconClicked();
                },
              ),
              SizedBox(
                width: _containerProgress < 0.9 ? 0 : maxListWidth,
                height: widget.height,
                child: Directionality(
                  textDirection: atrasDirection(context),
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: _listWidget,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// This method invoke when clicked on arrow icon or hamburger icon.
  /// In [onExpandableIconClicked] method container animation will run.
  void onExpandableIconClicked() {
    _isExpanded = !_isExpanded;
    setState(() {
      if (_isExpanded) {
        _containerAnimationController.forward();
        if (_listWidget.isEmpty) {
          Timer.periodic(const Duration(milliseconds: 5), (timer) {
            _listTimer = timer;
            final allWidgets = widget.items;
            if (_listWidget.length < allWidgets.length) {
              final item = widget.items[_listWidget.length];
              _listWidget.add(Padding(
                padding:
                    const EdgeInsets.only(left: 4, right: 4, top: 2, bottom: 2),
                child: item,
              ));
              if (_listWidget.length == widget.items.length) {
                timer.cancel();
              }
            }
          });
        }
      } else {
        _containerAnimationController.reverse();
        _listTimer?.cancel();
      }
    });
  }

  /// This method build menu items containers
  Widget buildContainer({required Widget child}) {
    return Center(
      child: Container(
        width: _listItemSize,
        height: _listItemSize,
        decoration: BoxDecoration(
            color: widget.itemContainerColor,
            borderRadius: const BorderRadius.all(Radius.circular(4))),
        margin: const EdgeInsets.all(4),
        child: child,
      ),
    );
  }

  /// This method will return size of item.
}
