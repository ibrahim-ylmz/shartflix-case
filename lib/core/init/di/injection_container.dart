import 'package:get_it/get_it.dart';
/// This is the dependency injection container instance
final GetIt sl = GetIt.instance;

/// This method is used to initialize the dependency injection container
Future<void> init() async {
  sl; 
}
