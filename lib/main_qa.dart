import 'package:flutter_folder_structure/environment_config/app_loader.dart';
import 'package:flutter_folder_structure/environment_config/env_paths.dart';

Future<void> main() async {
  final AppLoader appLoader = AppLoader();
  await appLoader.loadApp(EnvPaths.path_qa);
}