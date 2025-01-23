// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:io';
import 'package:audioplayers/audioplayers.dart';

Future<void> playMusic(
  String audioPath,
) async {
  try {
    // Check if the file exists.
    if (!File(audioPath).existsSync()) {
      throw Exception("Audio file not found at path: $audioPath");
    }

    // Initialize the audio player.
    final audioPlayer = AudioPlayer();

    // Play the audio file.
    await audioPlayer.play(DeviceFileSource(audioPath));
  } catch (e) {
    // Handle any errors that occur.
    print('Error playing audio: $e');
  }
}
