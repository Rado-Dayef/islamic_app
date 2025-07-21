part of 'prayer_cubit.dart';

abstract class PrayerState {}

final class PrayerLoading extends PrayerState {}

final class PrayerLoaded extends PrayerState {
  List<PrayModel> prayers;

  PrayerLoaded(this.prayers);
}

final class PrayerException extends PrayerState {
  final String message;

  PrayerException(this.message);
}
