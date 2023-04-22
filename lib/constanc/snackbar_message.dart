import 'package:flutter/material.dart';

class SnackbarMessage {
  static SnackBar message = SnackBar(
    content: const Text(
      'Can\'t enter more than 15 digits.',
      style: TextStyle(color: Colors.white, fontSize: 16),
    ),
    backgroundColor: Color.fromARGB(255, 253, 31, 15),
    duration: const Duration(seconds: 1),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
  );
  static SnackBar decimalpointmessage = SnackBar(
    content: const Text(
      'Can\'t enter more than 10 digits after Decimal Point.',
      style: TextStyle(color: Colors.white, fontSize: 16),
    ),
    backgroundColor: Color.fromARGB(255, 253, 31, 15),
    duration: const Duration(seconds: 1),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
  );
  static SnackBar bmimessage = SnackBar(
    content: const Text(
      'Please enter Weight and Height ',
      style: TextStyle(color: Colors.white, fontSize: 16),
    ),
    backgroundColor: Color.fromARGB(255, 253, 31, 15),
    duration: const Duration(seconds: 1),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
  );
  static SnackBar bmimessage1 = SnackBar(
    content: const Text(
      'Please enter Weight',
      style: TextStyle(color: Colors.white, fontSize: 16),
    ),
    backgroundColor: Color.fromARGB(255, 253, 31, 15),
    duration: const Duration(seconds: 1),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
  );

  static SnackBar bmimessage2 = SnackBar(
    content: const Text(
      'Please enter Height',
      style: TextStyle(color: Colors.white, fontSize: 16),
    ),
    backgroundColor: Color.fromARGB(255, 253, 31, 15),
    duration: const Duration(seconds: 1),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
  );
  static SnackBar bmimessage3 = SnackBar(
    content: const Text(
      'Please enter the Height in meters',
      style: TextStyle(color: Colors.white, fontSize: 16),
    ),
    backgroundColor: Color.fromARGB(255, 253, 31, 15),
    duration: const Duration(seconds: 1),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
  );
}
