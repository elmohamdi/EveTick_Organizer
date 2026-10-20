import 'package:evetick_organizer/core/theming/colors.dart';
import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SupportSearchField extends StatefulWidget {
  const SupportSearchField({
    super.key,
    required this.hintText,
    required this.clearTooltip,
    required this.onChanged,
  });

  final String hintText;
  final String clearTooltip;
  final ValueChanged<String> onChanged;

  @override
  State<SupportSearchField> createState() => _SupportSearchFieldState();
}

class _SupportSearchFieldState extends State<SupportSearchField> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onChanged(String value) {
    // Rebuild so the clear button follows the text.
    setState(() {});
    widget.onChanged(value);
  }

  void _clear() {
    _controller.clear();
    _onChanged('');
  }

  OutlineInputBorder _border(Color color, {double width = 1}) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color, width: width),
      borderRadius: BorderRadius.circular(16.r),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      onChanged: _onChanged,
      textInputAction: TextInputAction.search,
      style: TextStyles.font16WhiteRegular(context),
      cursorColor: ColorsManager.orange,
      decoration: InputDecoration(
        isDense: true,
        filled: true,
        fillColor: context.colors.fourthBlue,
        hintText: widget.hintText,
        hintStyle: TextStyles.font16LightGrayRegular(context),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        prefixIcon: Icon(
          Icons.search_rounded,
          color: context.colors.gray3,
          size: 26.sp,
        ),
        suffixIcon: _controller.text.isEmpty
            ? null
            : IconButton(
                tooltip: widget.clearTooltip,
                onPressed: _clear,
                icon: Icon(
                  Icons.close_rounded,
                  color: context.colors.gray3,
                  size: 20.sp,
                ),
              ),
        enabledBorder: _border(
          context.colors.secondaryBlue.withValues(alpha: 0.25),
        ),
        border: _border(context.colors.secondaryBlue.withValues(alpha: 0.25)),
        focusedBorder: _border(ColorsManager.orange, width: 1.3),
      ),
    );
  }
}
