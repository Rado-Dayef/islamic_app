import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic_app/constants/extensions.dart';
import 'package:islamic_app/controllers/prayer_cubit/prayer_cubit.dart';
import 'package:islamic_app/models/pray_model.dart';
import 'package:islamic_app/views/widgets/app_main_widget.dart';

class PrayerScreen extends StatelessWidget {
  const PrayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => PrayerCubit(),
        child: BlocBuilder<PrayerCubit, PrayerState>(
          builder: (context, state) {
            if (state is PrayerLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is PrayerLoaded) {
              return ListView.separated(
                itemBuilder: (_, int index) {
                  PrayModel pray = state.prayers[index];
                  return AppMainWidget(pray.name, leading: (index + 1).toString(), trailing: pray.time);
                },
                separatorBuilder: (_, __) {
                  return 10.gap;
                },
                itemCount: state.prayers.length,
              );
            } else if (state is PrayerException) {
              return Center(child: Text(state.message));
            } else {
              return Center(child: Text("Unknown Error"));
            }
          },
        ),
      ),
    );
  }
}
