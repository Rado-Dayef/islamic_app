import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic_app/constants/extensions.dart';
import 'package:islamic_app/controllers/sura_cubit/sura_cubit.dart';
import 'package:islamic_app/models/sura_model.dart';
import 'package:quran/quran.dart' as quran;

class SuraScreen extends StatelessWidget {
  const SuraScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SuraModel sura = ModalRoute
        .of(context)!
        .settings
        .arguments as SuraModel;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SuraCubit>().getAyahs(sura);
    });
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text(sura.name, style: TextStyle(fontSize: 30))),
      body: BlocBuilder<SuraCubit, List<String>>(
        builder: (context, state) {
          return ListView.separated(
            itemBuilder: (_, int index) {
              String ayah = state[index];
              return Directionality(textDirection: TextDirection.rtl, child: Text(ayah, style: TextStyle(fontSize: 30, fontFamily: "Times"),));
            },
            separatorBuilder: (_, __) {
              return 10.gap;
            },
            itemCount: state.length,
          );
        },
      ),
    );
  }
}
