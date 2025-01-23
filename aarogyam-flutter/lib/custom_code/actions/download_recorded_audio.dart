// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/sqlite/sqlite_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:ffmpeg_kit_flutter/ffmpeg_kit.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

Future<String?> downloadRecordedAudio(FFUploadedFile? recordedAudio) async {
  // Ensure the audio file exists
  if (recordedAudio == null || recordedAudio.bytes == null) {
    print('No audio file found or invalid audio bytes');
    return null;
  }

  try {
    // Get the external storage directory
    final directory = await getExternalStorageDirectory();
    if (directory == null) {
      print('External storage directory not found');
      return null;
    }

    // Set the target .flac file path
    final flacFilePath = '${directory.path}/recorded_audio.flac';

    // Save the original audio bytes to a temporary file for conversion
    final tempFilePath = '${directory.path}/temp_audio_input';
    final tempFile = File(tempFilePath);
    await tempFile.writeAsBytes(recordedAudio.bytes!);

    // Perform the conversion using FFmpeg
    await FFmpegKit.execute(
        '-i $tempFilePath -c:a flac -sample_fmt s16 $flacFilePath');

    // Check if the conversion was successful
    final flacFile = File(flacFilePath);
    if (await flacFile.exists()) {
      print('Audio file successfully converted to FLAC: $flacFilePath');

      // Clean up temporary input file
      await tempFile.delete();

      return flacFilePath;
    } else {
      print('Conversion to FLAC failed.');
      return null;
    }
  } catch (e) {
    print('Error during audio conversion: $e');
    return null;
  }
}
