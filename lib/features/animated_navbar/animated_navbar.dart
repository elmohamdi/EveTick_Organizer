import 'package:evetick_organizer/core/theming/colors.dart';
import 'package:evetick_organizer/features/animated_navbar/indicator.dart';
import 'package:evetick_organizer/features/animated_navbar/navbar_icon.dart';
import 'package:evetick_organizer/features/animated_navbar/navbar_item.dart';
import 'package:evetick_organizer/features/animated_navbar/spotlight.dart';
import 'package:flutter/material.dart';

class AnimatedSpotlightNavbar extends StatefulWidget {
  final List<AnimatedNavbarItem> items;
  final int currentIndex;
  final ValueChanged<int> onTap;
  final double height;
  final double borderRadius;
  final Color backgroundColor;
  final Color activeColor;
  final Color inactiveColor;
  final Duration animationDuration;

  const AnimatedSpotlightNavbar({
    super.key,
    required this.items,
    required this.currentIndex,
    required this.onTap,
    this.height = 72,
    this.backgroundColor = ColorsManager.lightBlue,
    this.activeColor = ColorsManager.orange,
    this.inactiveColor = ColorsManager.lightGray,
    this.borderRadius = 24,
    this.animationDuration = const Duration(milliseconds: 500),
  });

  @override
  State<AnimatedSpotlightNavbar> createState() =>
      _AnimatedSpotlightNavbarState();
}

class _AnimatedSpotlightNavbarState extends State<AnimatedSpotlightNavbar>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  double _startX = 0;
  double _endX = 0;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: widget.animationDuration,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOutCubic,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final center = _calculateCenterX(widget.currentIndex);
      setState(() {
        _startX = center;
        _endX = center;
      });
    });
  }

  @override
  void didUpdateWidget(covariant AnimatedSpotlightNavbar oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.currentIndex != widget.currentIndex) {
      _startX = _endX;
      _endX = _calculateCenterX(widget.currentIndex);
      _controller
        ..reset()
        ..forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  double _calculateCenterX(int index) {
    final totalWidth = MediaQuery.of(context).size.width;
    final itemWidth = totalWidth / widget.items.length;
    return itemWidth * index + itemWidth / 2;
  }

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).padding.bottom;

    return Container(
      height: widget.height + bottomPadding,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(widget.borderRadius),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(widget.borderRadius),
        ),
        child: Stack(
          children: [
            _buildSpotlight(),
            Padding(
              padding: EdgeInsets.only(bottom: bottomPadding),
              child: Stack(children: [_buildIndicator(), _buildIcons()]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSpotlight() {
    return AnimatedBuilder(
      animation: _animation,
      builder: (_, _) {
        return Spotlight(
          progress: _animation.value,
          startX: _startX,
          endX: _endX,
          color: widget.activeColor,
        );
      },
    );
  }

  Widget _buildIndicator() {
    return AnimatedBuilder(
      animation: _animation,
      builder: (_, _) {
        return Indicator(
          progress: _animation.value,
          startX: _startX,
          endX: _endX,
          color: widget.activeColor,
        );
      },
    );
  }

  Widget _buildIcons() {
    return Row(
      children: List.generate(widget.items.length, (index) {
        return Expanded(
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => widget.onTap(index),
            child: AnimatedNavbarIcon(
              item: widget.items[index],
              selected: widget.currentIndex == index,
              activeColor: widget.activeColor,
              inactiveColor: widget.inactiveColor,
            ),
          ),
        );
      }),
    );
  }
}
