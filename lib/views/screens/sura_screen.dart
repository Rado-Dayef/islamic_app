import 'package:flutter/material.dart';
import 'package:islamic_app/constants/extensions.dart';
import 'package:islamic_app/models/sura_model.dart';
import 'package:quran/quran.dart' as quran;

class SuraScreen extends StatelessWidget {
  const SuraScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SuraModel sura = ModalRoute.of(context)!.settings.arguments as SuraModel;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      print(sura.verseCount);
      List<String> ayahs = List.generate(sura.verseCount, (index) => quran.getVerse(sura.number, sura.verseCount));
      sura.ayahs.addAll(ayahs);
    });
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text(sura.name, style: TextStyle(fontSize: 30))),
      body: ListView.separated(
        itemBuilder: (_, int index) {
          String ayah = sura.ayahs[index];
          return Directionality(textDirection: TextDirection.rtl,child: Text(ayah, style: TextStyle(fontSize: 30),));
        },
        separatorBuilder: (_, __) {
          return 10.gap;
        },
        itemCount: sura.ayahs.length,
      ),
    );
  }
}
