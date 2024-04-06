import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class Property extends StatefulWidget {
  const Property(
      {super.key, this.boximage = '', this.titel = '', this.newpage});
  final String boximage;
  final String titel;
  final Widget? newpage;

  @override
  State<Property> createState() => _PropertyState();
}

class _PropertyState extends State<Property> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height / 7.5;
    var width = (MediaQuery.of(context).size.width / 3.5);
    return GestureDetector(
      onTap: () {
        if (widget.newpage == null) {
          openDialog();
        } else {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return widget.newpage!;
            },
          ));
        }
      },
      child: Container(
        margin: const EdgeInsets.only(top: 8, bottom: 8, left: 8, right: 8),
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Theme.of(context).cardColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: SvgPicture.asset(
                'assets/svg/${widget.boximage}.svg',
                height: height * 0.4,

                // ignore: deprecated_member_use
                color: Theme.of(context).iconTheme.color,
              ),
            ),
            Text(widget.titel,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelSmall),
            const Gap(9)
          ],
        ),
      ),
    );
  }

  Future openDialog() {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('This feature will be added in future updates'),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text(
                      'ok',
                      style: TextStyle(color: Colors.blue, fontSize: 18),
                    ))
              ],
            ));
  }
}
