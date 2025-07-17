part of 'home_cubit.dart';

abstract class HomeState {
  String day, hijriDate, meladyDate;

  HomeState({required this.day, required this.hijriDate, required this.meladyDate});
}

final class HomeInitial extends HomeState {
  HomeInitial() : super(day: "", hijriDate: "", meladyDate: "");
}

final class HomeLoaded extends HomeState {
  HomeLoaded({required super.day, required super.hijriDate, required super.meladyDate});
}
