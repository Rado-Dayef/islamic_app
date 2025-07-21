import 'package:flutter/material.dart';
import 'package:islamic_app/constants/colors.dart';
import 'package:islamic_app/constants/extensions.dart';
import 'package:islamic_app/constants/strings.dart';
import 'package:islamic_app/models/sura_model.dart';

class AppMainWidget extends StatelessWidget {
  final String title, leading, trailing;
  final VoidCallback? onTap;
  const AppMainWidget(this.title, {required this.leading, required this.trailing, this.onTap,super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ListTile(
        onTap: onTap,
        tileColor: AppColors.darkBlueColor,
        shape: RoundedRectangleBorder(borderRadius: 10.borderRadiusAll),
        title: Text(title, style: TextStyle(fontSize: 40, color: AppColors.whiteColor)),
        leading: CircleAvatar(
          backgroundColor: AppColors.whiteColor,
          foregroundColor: AppColors.darkBlueColor,
          child: Text(leading, style: TextStyle(fontSize: 24)),
        ),
        trailing: Text(trailing, style: TextStyle(fontSize: 24, color: AppColors.whiteColor.withAlpha(200))),
      ),
    );
  }
}
