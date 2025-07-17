import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic_app/constants/colors.dart';
import 'package:islamic_app/constants/extensions.dart';
import 'package:islamic_app/constants/strings.dart';
import 'package:islamic_app/controllers/home_cubit/home_cubit.dart';
import 'package:islamic_app/controllers/quran_cubit/quran_cubit.dart';
import 'package:islamic_app/models/sura_model.dart';
import 'package:islamic_app/views/widgets/sura_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: 10.edgeInsetsAll,
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              return Column(
                children: [
                  Row(
                    children: [
                      Expanded(flex: 0, child: Text(state.meladyDate, style: TextStyle(fontSize: 30))),
                      Spacer(),
                      Expanded(flex: 0, child: Text(state.hijriDate, style: TextStyle(fontSize: 30))),
                    ],
                  ),
                  Text(state.day, style: TextStyle(fontSize: 60)),
                  BlocBuilder<QuranCubit, QuranState>(
                    builder: (context, state) {
                      if (state is QuranLoading) {
                        return CircularProgressIndicator();
                      } else if (state is QuranException) {
                        return Text(state.message, style: TextStyle(fontSize: 40));
                      } else if (state is QuranLoaded) {
                        return ListView.separated(
                          itemCount: state.suras.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (_, int index) {
                            SuraModel sura = state.suras[index];
                            return SuraWidget(sura);
                          },
                          separatorBuilder: (_, __) {
                            return 10.gap;
                          },
                        );
                      } else {
                        return Text("Unknown Error", style: TextStyle(fontSize: 40));
                      }
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
