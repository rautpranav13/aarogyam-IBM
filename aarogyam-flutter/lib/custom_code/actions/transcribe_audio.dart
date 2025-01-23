// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert'; // For utf8 and base64Encode
import 'dart:io'; // For File operations
import 'package:http/http.dart' as http; // For HTTP requests

Future<String?> transcribeAudio(
    String apiKey, String url, String? audioPath) async {
  if (audioPath == null) {
    print('Error: AudioPath is null');
    return null;
  }

  try {
    // Prepare the API endpoint
    final endpoint = Uri.parse('$url/v1/recognize');

    // Encode API key for Basic Authentication
    final authHeader = 'Basic ${base64Encode(utf8.encode('apikey:$apiKey'))}';

    // Load audio file from the provided path
    final audioFile = File(audioPath);
    if (!await audioFile.exists()) {
      print('Error: Audio file does not exist at path: $audioPath');
      return null;
    }

    // Read audio file bytes
    final audioBytes = await audioFile.readAsBytes();

    // Set request headers
    final headers = {
      'Authorization': authHeader,
      'Content-Type': 'audio/flac', // Adjust based on the audio file format
      'Accept': 'application/json',
    };

    // Make the POST request
    final response =
        await http.post(endpoint, headers: headers, body: audioBytes);

    if (response.statusCode == 200) {
      // Parse and return the transcription
      final responseData = jsonDecode(response.body);
      final transcription = responseData['results']
              ?.map((result) => result['alternatives'][0]['transcript'])
              ?.join('\n') ??
          'No transcription available';
      return transcription;
    } else {
      print('Error: ${response.statusCode} - ${response.body}');
      return null;
    }
  } catch (e) {
    print('Exception occurred: $e');
    return null;
  }
}
