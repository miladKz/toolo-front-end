library collapsible_sidebar;

import 'package:flutter/material.dart';

import '../../../../gen/assets.gen.dart';
import 'collapsible_container.dart';
import 'collapsible_item.dart';

class CollapsibleSidebar extends StatefulWidget {
  const CollapsibleSidebar({
    Key? key,
    required this.items,
    required this.body,
    this.titleStyle,
    this.titleBack = false,
    this.titleBackIcon = Icons.arrow_back,
    this.onHoverPointer = SystemMouseCursors.click,
    this.textStyle,
    this.toggleTitleStyle,
    this.height = double.infinity,
    this.minWidth = 80,
    this.maxWidth = 270,
    this.iconSize = 40,
    this.customContentPaddingLeft = -1,
    this.toggleButtonIcon = Icons.chevron_right,
    this.backgroundColor = Colors.white,
    this.duration = const Duration(milliseconds: 500),
    this.curve = Curves.fastLinearToSlowEaseIn,
    this.screenPadding = 4,
    this.showToggleButton = true,
    this.topPadding = 0,
    this.bottomPadding = 0,
    this.itemPadding = 2,
    this.customItemOffsetX = -1,
    this.fitItemsToBottom = false,
    this.onTitleTap,
    this.isCollapsed = true,
    this.collapseOnBodyTap = true,
    this.showTitle = true,
  }) : super(key: key);
  final MouseCursor onHoverPointer;
  final TextStyle? titleStyle, textStyle, toggleTitleStyle;
  final IconData titleBackIcon;
  final Widget body;
  final bool showToggleButton,
      fitItemsToBottom,
      isCollapsed,
      titleBack,
      showTitle,
      collapseOnBodyTap;
  final List<CollapsibleItem> items;
  final double height,
      minWidth,
      maxWidth,
      iconSize,
      customItemOffsetX,
      padding = 10,
      itemPadding,
      topPadding,
      bottomPadding,
      screenPadding,
      customContentPaddingLeft;
  final IconData toggleButtonIcon;
  final Color backgroundColor;
  final Duration duration;
  final Curve curve;
  final VoidCallback? onTitleTap;

  @override
  _CollapsibleSidebarState createState() => _CollapsibleSidebarState();
}

class _CollapsibleSidebarState extends State<CollapsibleSidebar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _widthAnimation;
  late CurvedAnimation _curvedAnimation;
  late double tempWidth;

  var _isCollapsed;
  late double _currWidth,
      _delta,
      _delta1By4,
      _delta3by4,
      _maxOffsetX,
      _maxOffsetY;
  late int _selectedItemIndex;

  @override
  void initState() {
    assert(widget.items.isNotEmpty);

    super.initState();

    tempWidth = widget.maxWidth > 270 ? 270 : widget.maxWidth;
    _currWidth = widget.minWidth;
    _delta = tempWidth - widget.minWidth;
    _delta1By4 = _delta * 0.25;
    _delta3by4 = _delta * 0.75;
    _maxOffsetX = widget.padding * 2 + widget.iconSize;
    _maxOffsetY = widget.itemPadding * 2 + widget.iconSize;

    _selectedItemIndex = 0;
    for (var i = 0; i < widget.items.length; i++) {
      if (widget.items[i].isSelected) break;
      _selectedItemIndex += 1;
    }

    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _curvedAnimation = CurvedAnimation(
      parent: _controller,
      curve: widget.curve,
    );

    _controller.addListener(() {
      _currWidth = _widthAnimation.value;
      if (_controller.isCompleted) _isCollapsed = _currWidth == widget.minWidth;
      setState(() {});
    });

    _isCollapsed = widget.isCollapsed;
    var endWidth = _isCollapsed ? widget.minWidth : tempWidth;
    _animateTo(endWidth);
  }

  @override
  void didUpdateWidget(covariant CollapsibleSidebar oldWidget) {
    if (widget.isCollapsed != oldWidget.isCollapsed) {
      _listenCollapseChange();
    }
    super.didUpdateWidget(oldWidget);
  }

  /// Allows you to change [widget.isCollapsed] by keeping it bound
  /// to a variable other than click the button
  ///
  /// `example`: change the [widget.isCollapsed] by screen size.
  ///
  /// CollapsibleSidebar(
  ///   ...
  ///   isCollapsed: MediaQuery.of(context).size.width <= 800,
  /// )
  void _listenCollapseChange() {
    _isCollapsed = widget.isCollapsed;
    var endWidth = _isCollapsed ? widget.minWidth : tempWidth;
    _animateTo(endWidth);
  }

  void _animateTo(double endWidth) {
    _widthAnimation = Tween<double>(
      begin: _currWidth,
      end: endWidth,
    ).animate(_curvedAnimation);
    _controller.reset();
    _controller.forward();
  }

  void _onHorizontalDragUpdate(DragUpdateDetails details) {
    if (details.primaryDelta != null) {
      if (Directionality.of(context) == TextDirection.ltr) {
        _currWidth += details.primaryDelta!;
      } else {
        _currWidth -= details.primaryDelta!;
      }
      if (_currWidth > tempWidth)
        _currWidth = tempWidth;
      else if (_currWidth < widget.minWidth)
        _currWidth = widget.minWidth;
      else
        setState(() {});
    }
  }

  void _onHorizontalDragEnd(DragEndDetails _) {
    if (_currWidth == tempWidth)
      setState(() => _isCollapsed = false);
    else if (_currWidth == widget.minWidth)
      setState(() => _isCollapsed = true);
    else {
      var threshold = _isCollapsed ? _delta1By4 : _delta3by4;
      var endWidth = _currWidth - widget.minWidth > threshold
          ? tempWidth
          : widget.minWidth;
      _animateTo(endWidth);
    }
  }

  @override
  Widget build(BuildContext context) {

    Widget sidebar = GestureDetector(
      onHorizontalDragUpdate: _onHorizontalDragUpdate,
      onHorizontalDragEnd: _onHorizontalDragEnd,
      child: CollapsibleContainer(
        height: widget.height,
        width: _currWidth ,
        padding: widget.padding,
        color: widget.backgroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                reverse: widget.fitItemsToBottom,
                child: Stack(
                  children: [
                    Column(
                      children: _items,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: widget.bottomPadding,
            ),
            _toggleButton
          ],
        ),
      ),
    );

    return _isCollapsed
        ? Stack(
            alignment: Directionality.of(context) == TextDirection.ltr
                ? Alignment.topLeft
                : Alignment.topRight,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: widget.minWidth *
                          (widget.customContentPaddingLeft < 0 ? 1.1 : 1) +
                      (widget.customContentPaddingLeft >= 0
                          ? widget.customContentPaddingLeft
                          : 0),
                ),
                child: widget.body,
              ),
              sidebar,
            ],
          )
        : Stack(
            alignment: Directionality.of(context) == TextDirection.ltr
                ? Alignment.topLeft
                : Alignment.topRight,
            children: [
              widget.collapseOnBodyTap
                  ? GestureDetector(
                      onTap: () {
                        _isCollapsed = true;
                        _animateTo(widget.minWidth);
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: widget.minWidth *
                                  (widget.customContentPaddingLeft < 0
                                      ? 1.1
                                      : 1) +
                              (widget.customContentPaddingLeft >= 0
                                  ? widget.customContentPaddingLeft
                                  : 0),
                        ),
                        child: widget.body,
                      ),
                    )
                  : Padding(
                      padding: EdgeInsets.only(
                        left: widget.minWidth *
                                (widget.customContentPaddingLeft < 0
                                    ? 1.1
                                    : 1) +
                            (widget.customContentPaddingLeft >= 0
                                ? widget.customContentPaddingLeft
                                : 0),
                      ),
                      child: widget.body,
                    ),
              sidebar,
            ],
          );
  }

  List<Widget> get _items {
    return List.generate(widget.items.length, (index) {
      var item = widget.items[index];
      return !_isCollapsed
          ? Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 1),
              child: item.content)
          : Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: item.iconImage,
            );
    });
  }

  Widget get _toggleButton {
    return Align(
      alignment: Alignment.bottomLeft,
      child: IconButton(
          icon: AnimatedRotation(
            turns: _isCollapsed ? 0.5 : 0,
            duration: const Duration(milliseconds: 300),
            child: Assets.ico.closeMenu.image(width: 20, height: 20),
          ),
          onPressed: () {
            _isCollapsed = !_isCollapsed;
            var endWidth = _isCollapsed ? widget.minWidth : tempWidth;
            _animateTo(endWidth);
          },
          style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          )),
    );
  }

  double get _fraction => (_currWidth - widget.minWidth) / _delta;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
