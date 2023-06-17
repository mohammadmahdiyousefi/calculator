import 'package:calculator/constanc/app_colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Property extends StatefulWidget {
  Property({super.key, this.boximage = '', this.titel = '', this.newpage});
  String boximage;
  String titel;
  Widget? newpage;

  @override
  State<Property> createState() => _PropertyState();
}

class _PropertyState extends State<Property> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height / 8;
    var width = (MediaQuery.of(context).size.width / 3);
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      child: SizedBox(
        height: height,
        width: width,
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
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            height: height,
            width: width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: height / 2.5,
                  width: width,
                  child: Image.asset(
                    'assets/images/${widget.boximage}.png',
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  widget.titel,
                  style: TextStyle(
                      color: Color(0xFFFFA500),
                      fontSize: MediaQuery.of(context).size.width / 30,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
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
                    child: const Text(
                      'ok',
                      style: TextStyle(color: Colors.blue, fontSize: 18),
                    ))
              ],
            ));
  }
}
