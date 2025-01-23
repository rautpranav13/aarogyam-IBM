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

import 'package:html/parser.dart' as html_parser;

import 'package:html/parser.dart' as html_parser;

String extractTextFromHTML(String htmlString) {
  try {
    // Parse the HTML string
    final document = html_parser.parse(htmlString);

    // Extract the plain text content
    String plainText = document.body?.text ?? '';

    // Remove extra spaces and special characters
    plainText = plainText
        .replaceAll(
            RegExp(r'\s+'), ' ') // Replace multiple spaces with a single space
        .replaceAll(RegExp(r'[^\w\s]'),
            '') // Remove non-alphanumeric characters (except spaces)
        .trim(); // Remove leading/trailing spaces

    return plainText;
  } catch (e) {
    throw Exception('Error extracting text from HTML: $e');
  }
}
