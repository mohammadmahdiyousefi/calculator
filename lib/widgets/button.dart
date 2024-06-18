import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Widget icon;
  final Color? backgroundColor;
  final void Function()? onTap;
  final void Function()? onLongPress;
  final void Function(LongPressEndDetails)? onLongPressEnd;

  const Button(
      {super.key,
      required this.icon,
      this.backgroundColor,
      this.onTap,
      this.onLongPress,
      this.onLongPressEnd});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      onLongPressEnd: onLongPressEnd,
      child: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(3),
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: backgroundColor ?? Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(14)),
        child: Center(child: icon),
      ),
    );
  }
}
