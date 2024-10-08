import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guess_app/constants/theme/project_theme.dart';
import 'package:guess_app/feature/number_guess/bloc/number_guess_bloc.dart';
import 'package:guess_app/feature/welcome_page/view/welcome_page.dart';
import 'package:guess_app/init/product_init.dart';

void main() async {
  await ProductInit.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Guess It',
      debugShowCheckedModeBanner: false,
      theme: ProjectThemes.lightTheme,
      home: BlocProvider<NumberGuessBloc>(
        create: (context) => NumberGuessBloc(),
        child: const WelcomePage(),
      ),
    );
  }
}
