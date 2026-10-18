import 'package:evetick_organizer/core/services/result.dart';
import 'package:evetick_organizer/features/home/data/models/home_overview.dart';

abstract class HomeRepository {
  Future<Result<HomeOverview>> getOverview();
}
