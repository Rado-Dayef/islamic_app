part of 'quran_cubit.dart';

abstract class QuranState {}

final class QuranLoading extends QuranState {}

final class QuranLoaded extends QuranState {
  List<SuraModel> suras;
  QuranLoaded(this.suras);
}

final class QuranException extends QuranState {
  String message;

  QuranException(this.message);
}
