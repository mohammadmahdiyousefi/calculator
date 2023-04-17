import 'package:calculator/constanc/app_colors.dart';
import 'package:calculator/model/bottom_model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Bottom extends StatelessWidget {
  Bottom({super.key, required this.property});
  BottomModel property;
  @override
  Widget build(BuildContext context) {
    double keysize = MediaQuery.of(context).size.height % 91.5;
    double keytitelsize = MediaQuery.of(context).size.height % 130;
    return Container(
      height: keysize,
      width: keysize,
      decoration: BoxDecoration(
          color: property.bottomcolor,
          borderRadius: BorderRadius.circular(1000)),
      child: Center(
        child: property.titel == '⇌'
            ? const Icon(
                Icons.sync,
                color: AppColor.white,
              )
            : Text(
                property.titel,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: keytitelsize,
                    color: property.titelcolor,
                    fontWeight: FontWeight.bold),
              ),
      ),
    );
  }
}
