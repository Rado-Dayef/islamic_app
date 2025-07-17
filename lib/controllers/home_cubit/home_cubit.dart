import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:jhijri/_src/_jHijri.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial()) {
    loadData();
  }

  void loadData() {
    JHijri hijriDateNow = JHijri.now();
    DateTime meladyDateNow = DateTime.now();

    String day = getDay(meladyDateNow.weekday);
    String meladyDate = DateFormat("dd/MM/yyyy").format(DateTime.now());
    String hijriDate = "${hijriDateNow.day}/${hijriDateNow.month}/${hijriDateNow.year}";
    HomeLoaded newState = HomeLoaded(day: day, hijriDate: hijriDate, meladyDate: meladyDate);
    emit(newState);
  }

  String getDay(int dayNumber) {
    switch (dayNumber) {
      case 1:
        return "الإثنين";
      case 2:
        return "الثلاثاء";
      case 3:
        return "الأربعاء";
      case 4:
        return "الخميس";
      case 5:
        return "الجمعة";
      case 6:
        return "السبت";
      default:
        return "الأحد";
    }
  }
}
