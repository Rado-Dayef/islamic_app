import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic_app/models/sura_model.dart';
import 'package:quran/quran.dart' as quran;

class SuraCubit extends Cubit<List<String>> {
  SuraCubit() : super([]);

  void getAyahs(SuraModel sura) {
    List<String> ayahs = List.generate(sura.verseCount, (index) => quran.getVerse(sura.number, index + 1));
    emit(ayahs);
  }
}
