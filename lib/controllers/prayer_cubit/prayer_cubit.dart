import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:islamic_app/models/pray_model.dart';
import 'package:prayers_times/prayers_times.dart';

part 'prayer_state.dart';

class PrayerCubit extends Cubit<PrayerState> {
  PrayerCubit() : super(PrayerLoading()) {
    getPrayer();
  }

  void getPrayer() {
    try {
      PrayerLoading loadingState = PrayerLoading();
      emit(loadingState);
      PrayerTimes prayerTimes = PrayerTimes(
        coordinates: Coordinates(30.0444, 31.2357),
        calculationParameters: PrayerCalculationMethod.egyptian(),
        locationName: "Africa/Cairo",
        dateTime: DateTime.now(),
      );
      List<PrayModel> prayers = [
        PrayModel(name: "فَجْر", time: DateFormat("hh:mm").format(prayerTimes.fajrStartTime!)),
        PrayModel(name: "ظُهْر", time: DateFormat("hh:mm").format(prayerTimes.dhuhrStartTime!)),
        PrayModel(name: "عَصْر", time: DateFormat("hh:mm").format(prayerTimes.asrStartTime!)),
        PrayModel(name: "مَغْرِب", time: DateFormat("hh:mm").format(prayerTimes.maghribStartTime!)),
        PrayModel(name: "عِشَاء", time: DateFormat("hh:mm").format(prayerTimes.ishaStartTime!)),
      ];
      PrayerLoaded loadedState = PrayerLoaded(prayers);
      emit(loadedState);
    } catch (error) {
      PrayerException exceptionState = PrayerException(error.toString());
      emit(exceptionState);
    }
  }
}
