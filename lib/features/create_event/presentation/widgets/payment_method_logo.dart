import 'package:evetick_organizer/core/theming/colors.dart';
import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:evetick_organizer/features/create_event/data/models/payment_method_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentMethodLogo extends StatelessWidget {
  const PaymentMethodLogo({super.key, required this.type});

  final PaymentMethodType type;

  @override
  Widget build(BuildContext context) {
    final String? asset = type.logoAsset;

    return Container(
      width: 40.w,
      height: 40.w,
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: ColorsManager.defaultWhite,
      ),
      child: asset == null
          ? Icon(
              Icons.paypal_rounded,
              color: context.colors.darkBlue,
              size: 22.sp,
            )
          : Image.asset(asset, fit: BoxFit.cover),
    );
  }
}
