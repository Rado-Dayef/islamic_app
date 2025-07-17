import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic_app/models/sura_model.dart';
import 'package:quran/quran.dart' as quran;

part 'quran_state.dart';

class QuranCubit extends Cubit<QuranState> {
  QuranCubit() : super(QuranLoading()) {
    getQuran();
  }

  void getQuran() {
    QuranLoading loadingState = QuranLoading();
    emit(loadingState);
    try {
      List<SuraModel> quranList = [];
      for (int suraNumber = 1; suraNumber <= 114; suraNumber++) {
        int verseCount = quran.getVerseCount(suraNumber);
        List<String> ayahs = [];
        SuraModel sura = SuraModel(name: quran.getSurahNameArabic(suraNumber), ayahs: ayahs, verseCount: verseCount, number: suraNumber);
        quranList.add(sura);
        QuranLoaded loadedState = QuranLoaded(quranList);
        emit(loadedState);
      }
    } catch (error) {
      QuranException exceptionState = QuranException(error.toString());
      emit(exceptionState);
    }
  }
}
