import 'package:calculator/constanc/app_colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Property extends StatefulWidget {
  Property({super.key, this.boxicon = Icons.mp, this.titel = '', this.newpage});
  IconData boxicon;
  String titel;
  Widget? newpage;

  @override
  State<Property> createState() => _PropertyState();
}

class _PropertyState extends State<Property> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 7,
        width: (MediaQuery.of(context).size.width / 3) - 10,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              elevation: 0),
          onPressed: () {
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                widget.boxicon,
                color: AppColor.iconcolor,
                size: 40,
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                widget.titel,
                style: TextStyle(
                    color: AppColor.iconcolor,
                    fontSize: MediaQuery.of(context).size.width / 30),
              ),
            ],
          ),
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
                    child: Text(
                      'ok',
                      style: TextStyle(color: Colors.blue, fontSize: 18),
                    ))
              ],
            ));
  }
}
