import 'dart:async';

import 'package:FaceApp/utils/logger.dart';
import 'package:camera/camera.dart';
export 'package:face_camera/src/res/enums.dart';
export 'package:face_camera/src/models/detected_image.dart';

class FaceCamera {
  //static const MethodChannel _channel = MethodChannel('face_camera');
  static List<CameraDescription> _cameras = [];

  /// Initialize device cameras
  static Future<void> initialize() async {
    /// Fetch the available cameras before initializing the app.
    try {
      _cameras = await availableCameras();
    } on CameraException catch (e) {
      logError(e.code, e.description);
    }
  }

  /// Returns available cameras
  static List<CameraDescription> get cameras {
    return _cameras;
  }
}
