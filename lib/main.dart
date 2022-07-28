import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/core/presentation/bloc/app_bloc_observer.dart';
import 'package:todo/core/presentation/resources/routes_manager.dart';
import 'package:todo/core/presentation/resources/strings_manager.dart';
import 'package:todo/core/presentation/resources/theme_manager.dart';
import 'package:todo/di/injector.dart';
import 'package:todo/features/tasks/presentation/cubit/tasks_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  BlocOverrides.runZoned(
    blocObserver: AppBlocObserver(),
    () => runApp(const App()),
  );
}

class App extends StatelessWidget {
  const App();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<TasksCubit>(),
      child: MaterialApp(
        title: AppStrings.appName,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: onGenerateRoute,
        theme: getLightTheme(),
        darkTheme: getDarkTheme(),
      ),
    );
  }
}
