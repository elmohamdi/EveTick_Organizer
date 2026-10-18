import 'package:evetick_organizer/core/helpers/formatters.dart';
import 'package:evetick_organizer/core/helpers/spacing.dart';
import 'package:evetick_organizer/core/theming/colors.dart';
import 'package:evetick_organizer/core/theming/extensions/build_context_extension.dart';
import 'package:evetick_organizer/core/theming/text_styles.dart';
import 'package:evetick_organizer/features/event_dashboard/data/models/ticket_tier_sales.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TicketTierSalesTile extends StatelessWidget {
  const TicketTierSalesTile({super.key, required this.tier});

  final TicketTierSales tier;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: context.colors.lightBlue,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: context.colors.secondaryBlue.withValues(alpha: 0.25),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  tier.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyles.font16WhiteMid(context),
                ),
              ),
              horizontalSpace(8),
              Text(
                Formatters.money(tier.revenue),
                style: TextStyles.font16WhiteMid(
                  context,
                ).copyWith(color: ColorsManager.orange),
              ),
            ],
          ),
          verticalSpace(4),
          Text(
            '${Formatters.money(tier.price)} per ticket',
            style: TextStyles.font12LightGrayRegular(context),
          ),
          verticalSpace(12),
          ClipRRect(
            borderRadius: BorderRadius.circular(4.r),
            child: LinearProgressIndicator(
              value: tier.soldRatio,
              minHeight: 6.h,
              backgroundColor: context.colors.secondaryBlue.withValues(
                alpha: 0.4,
              ),
              valueColor: const AlwaysStoppedAnimation(ColorsManager.orange),
            ),
          ),
          verticalSpace(8),
          Text(
            '${Formatters.number(tier.sold)} of ${Formatters.number(tier.capacity)} sold',
            style: TextStyles.font12LightGrayRegular(context),
          ),
        ],
      ),
    );
  }
}
