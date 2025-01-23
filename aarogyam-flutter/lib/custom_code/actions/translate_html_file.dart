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
import 'package:flutter/services.dart';
import 'package:translator/translator.dart';
import 'package:path_provider/path_provider.dart';

Future<void> translateHtmlFile(
    String inputFileName, String outputFileName) async {
  try {
    // Get the external storage directory
    final directory = await getExternalStorageDirectory();
    if (directory == null) {
      throw Exception("Could not find external storage directory.");
    }

    final inputFile = File('${directory.path}/$inputFileName');

    if (!await inputFile.exists()) {
      throw Exception("Input file does not exist.");
    }

    // Read the content of the input file
    final htmlContent = await inputFile.readAsString();

    // Extract text content from the HTML
    final textRegex = RegExp(r'>(.*?)<');
    final matches = textRegex.allMatches(htmlContent);

    final translator = GoogleTranslator();

    // Translate all extracted text content to Marathi
    Map<String, String> translations = {};
    for (var match in matches) {
      final originalText = match.group(1)?.trim() ?? '';
      if (originalText.isNotEmpty && !translations.containsKey(originalText)) {
        final translation = await translator.translate(originalText, to: 'mr');
        translations[originalText] = translation.text; // Use the text property
      }
    }

    // Replace the original text in the HTML with the translated text
    String translatedHtmlContent = htmlContent;
    translations.forEach((original, translated) {
      translatedHtmlContent =
          translatedHtmlContent.replaceAll('>$original<', '>$translated<');
    });

    // Write the translated content to the output file
    final outputFile = File('${directory.path}/$outputFileName');
    await outputFile.writeAsString(translatedHtmlContent);

    print(
        "Translation completed. Translated file saved as: ${outputFile.path}");
  } catch (e) {
    print("Error during translation: $e");
  }
}
