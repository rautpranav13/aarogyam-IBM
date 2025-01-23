// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!

import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart';

Future<void> saveTXT(String text, String fileName) async {
  try {
    // Get the external storage directory
    final directory = await getExternalStorageDirectory();
    if (directory == null) {
      throw PlatformException(
        code: 'DIRECTORY_ERROR',
        message: 'Unable to access external storage directory.',
      );
    }

    // Create a unique file path if the file already exists
    String filePath = '${directory.path}/$fileName';
    File file = File(filePath);
    // int counter = 1;
    // while (file.existsSync()) {
    //   filePath = '${directory.path}/$fileName${counter}.txt';
    //   file = File(filePath);
    //   counter++;
    // }

    // Write the text to the file
    await file.writeAsString(text);

    print('File saved successfully at $filePath');
  } catch (e) {
    print('Error saving file: $e');
    throw PlatformException(
      code: 'FILE_SAVE_ERROR',
      message: 'Failed to save file: $e',
    );
  }
}
