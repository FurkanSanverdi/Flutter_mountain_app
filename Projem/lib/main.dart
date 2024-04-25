import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:travel_application/bloc/client_cubit.dart';
import 'package:travel_application/core/localizations.dart';
import 'package:travel_application/cubit/app_cubits.dart';
import 'package:travel_application/services/data_services.dart';
import 'core/themes.dart';
import 'cubit/app_cubit_logics.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  

  @override
  
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>ClientCubit(
        clientState(darkMode: false,language: "en")),
      child: BlocBuilder<ClientCubit,clientState>(
        builder: (context,state) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: BlocProvider<AppCubits>(
              create: (context) => AppCubits(
                data: DataServices(),
              ),
              child: const AppCubitLogics(),
            ),
            themeMode: state.darkMode ? ThemeMode.dark: ThemeMode.light,
           
            darkTheme: darkTheme,
                      localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
            supportedLocales: const [
            Locale('en', 'US'),
            Locale('tr', 'TR'),
          ],
          locale: Locale(state.language),
          );
        }
      ),
    );
  }
}
