import 'package:flutter/material.dart';
import 'package:islamic_app/constants/colors.dart';
import 'package:islamic_app/constants/extensions.dart';
import 'package:islamic_app/constants/strings.dart';
import 'package:islamic_app/models/sura_model.dart';

class SuraWidget extends StatelessWidget {
  final SuraModel sura;
  const SuraWidget(this.sura, {super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ListTile(
        onTap: (){
          Navigator.of(context).pushNamed(AppStrings.suraRoute, arguments: sura);
        },
        tileColor: AppColors.darkBlueColor,
        shape: RoundedRectangleBorder(borderRadius: 10.borderRadiusAll),
        title: Text(sura.name, style: TextStyle(fontSize: 40, color: AppColors.whiteColor)),
        leading: CircleAvatar(
          backgroundColor: AppColors.whiteColor,
          foregroundColor: AppColors.darkBlueColor,
          child: Text(sura.number.toString(), style: TextStyle(fontSize: 24)),
        ),
        trailing: Text(sura.verseCount.toString(), style: TextStyle(fontSize: 24, color: AppColors.whiteColor.withAlpha(200))),
      ),
    );;
  }
}
