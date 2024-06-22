import 'package:get_it/get_it.dart';
import 'package:hsu_bakery/features/language/presentation/bloc/language/language_cubit.dart';
import 'package:hsu_bakery/features/nav/presentation/bloc/navigation_cubit.dart';
import 'package:hsu_bakery/services/storage.dart';
import 'package:hsu_bakery/utility/navigation.dart';
import 'package:hsu_bakery/utility/utility.dart';
import 'package:hsu_bakery/widgets/theme.dart';

var getIt = GetIt.instance;

void locator() {
  //services
  getIt.registerLazySingleton(() => Storage());
  getIt.registerLazySingleton(() => Utility());
  getIt.registerLazySingleton(() => Navigation());
  getIt.registerLazySingleton(() => AppTheme());

  //language
  getIt.registerLazySingleton(() => LanguageCubit(getIt.call()));

  //Navigation
  getIt.registerLazySingleton(() => NavigationCubit());
}
