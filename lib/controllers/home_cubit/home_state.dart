part of 'home_cubit.dart';

abstract class HomeState {
  String day, hijriDate, meladyDate;
  List<HomeCategoriesModel> categories;

  HomeState({required this.day, required this.hijriDate, required this.categories, required this.meladyDate});
}

final class HomeInitial extends HomeState {
  HomeInitial()
    : super(
        day: "",
        hijriDate: "",
        meladyDate: "",
        categories: [
          HomeCategoriesModel("assets/images/quran_light_icon.png", name: "القرآن الكريم", route: AppStrings.quranRoute),
          HomeCategoriesModel("assets/images/salawat_light_icon.png", name: "الصلاة", route: AppStrings.prayerRoute),
          HomeCategoriesModel("assets/images/compass_light_icon.png", name: "القبلة", route: AppStrings.quiblahRoute),
          HomeCategoriesModel("assets/images/azkar_light_icon.png", name: "أذكار", route: AppStrings.azkarRoute),
          HomeCategoriesModel("assets/images/setting_light_icon.png", name: "إعدادات", route: AppStrings.settingsRoute),
        ],
      );
}

final class HomeLoaded extends HomeState {
  HomeLoaded({required super.day, required super.hijriDate, required super.categories, required super.meladyDate});
}
