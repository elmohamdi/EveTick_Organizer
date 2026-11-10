import 'package:evetick_organizer/features/home/data/models/home_overview.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final HomeOverview overview;
  HomeSuccess(this.overview);
}

class HomeFailure extends HomeState {
  final String error;
  HomeFailure(this.error);
}
