import 'dart:async';

import 'package:evetick_organizer/core/helpers/spacing.dart';
import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:evetick_organizer/core/widgets/app_toast/app_toast_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// The visible part of an `AppToast`: a card that slides in from the top,
/// closes by itself, by its X button, or when it is swiped up.
///
/// Use `AppToast.show` instead of creating this directly.
class AppToastCard extends StatefulWidget {
  const AppToastCard({
    super.key,
    required this.message,
    required this.type,
    required this.duration,
    required this.onClosed,
  });

  final String message;
  final AppToastType type;
  final Duration duration;

  /// Called once the card is fully gone, so the overlay entry can be removed.
  final VoidCallback onClosed;

  @override
  State<AppToastCard> createState() => _AppToastCardState();
}

class _AppToastCardState extends State<AppToastCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 280),
    reverseDuration: const Duration(milliseconds: 200),
  );
  late final Animation<Offset> _slide = Tween<Offset>(
    begin: const Offset(0, -1.2),
    end: Offset.zero,
  ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

  final _dismissKey = UniqueKey();
  Timer? _timer;
  bool _isClosing = false;

  @override
  void initState() {
    super.initState();
    _controller.forward();
    _timer = Timer(widget.duration, _close);
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  Future<void> _close() async {
    if (_isClosing) return;
    _isClosing = true;
    _timer?.cancel();
    if (mounted) await _controller.reverse();
    widget.onClosed();
  }

  @override
  Widget build(BuildContext context) {
    final accent = widget.type.color;

    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 0),
          child: SlideTransition(
            position: _slide,
            child: FadeTransition(
              opacity: _controller,
              child: Dismissible(
                key: _dismissKey,
                direction: DismissDirection.up,
                onDismissed: (_) {
                  _isClosing = true;
                  _timer?.cancel();
                  widget.onClosed();
                },
                child: Semantics(
                  liveRegion: true,
                  child: Material(
                    color: Colors.transparent,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 12.h,
                      ),
                      decoration: BoxDecoration(
                        color: context.colors.lightBlue,
                        borderRadius: BorderRadius.circular(16.r),
                        border: Border.all(
                          color: accent.withValues(alpha: 0.5),
                          width: 1.2,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.18),
                            blurRadius: 20,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 36.w,
                            height: 36.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: accent.withValues(alpha: 0.15),
                            ),
                            child: Icon(
                              widget.type.icon,
                              size: 22.sp,
                              color: accent,
                            ),
                          ),
                          horizontalSpace(12),
                          Expanded(
                            child: Text(
                              widget.message,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyles.font16WhiteMid(
                                context,
                              ).copyWith(fontSize: 14.sp, height: 1.4),
                            ),
                          ),
                          horizontalSpace(4),
                          InkWell(
                            onTap: _close,
                            customBorder: const CircleBorder(),
                            child: Padding(
                              padding: EdgeInsets.all(6.w),
                              child: Icon(
                                Icons.close_rounded,
                                size: 18.sp,
                                color: context.colors.gray3,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
