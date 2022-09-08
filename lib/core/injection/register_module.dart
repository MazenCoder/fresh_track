import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';

@module
abstract class RegisterModule {

  // @singleton
  // FirebaseMessaging get firebaseMessaging => FirebaseMessaging.instance;

  @lazySingleton
  Future<Directory> get directory => getApplicationDocumentsDirectory();

  @lazySingleton
  http.Client get httpClient => http.Client();
}
