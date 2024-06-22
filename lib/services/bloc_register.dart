import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hsu_bakery/features/language/presentation/bloc/language/language_cubit.dart';
import 'package:hsu_bakery/features/nav/presentation/bloc/navigation_cubit.dart';
import 'package:hsu_bakery/services/locator.dart';

class BlocRegister extends StatelessWidget {
  const BlocRegister({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LanguageCubit(getIt.call()),
        ),
        BlocProvider(create: 
        (context) => NavigationCubit()
        ),
      ],
      child: child,
    );
  }
}
