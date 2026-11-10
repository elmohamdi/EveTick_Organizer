import 'package:evetick_organizer/core/helpers/formatters.dart';
import 'package:evetick_organizer/features/event_dashboard/data/models/event_dashboard.dart';
import 'package:flutter/widgets.dart';

/// What the "Sales by Event" chart measures.
enum HomeChartMetric {
  revenue('Revenue'),
  tickets('Tickets');

  const HomeChartMetric(this.label);

  final String label;

  double valueOf(EventDashboard event) => switch (this) {
    HomeChartMetric.revenue => event.revenue,
    HomeChartMetric.tickets => event.ticketsSold.toDouble(),
  };

  String format(BuildContext context, double value) => switch (this) {
    HomeChartMetric.revenue => Formatters.money(context, value),
    HomeChartMetric.tickets => Formatters.number(context, value),
  };
}
