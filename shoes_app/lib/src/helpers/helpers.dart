import 'package:flutter/services.dart' as services;

void changeLightStatus() {
  services.SystemChrome.setSystemUIOverlayStyle(services.SystemUiOverlayStyle.light);
}

void changeDarkStatus() {
  services.SystemChrome.setSystemUIOverlayStyle(services.SystemUiOverlayStyle.dark);
}