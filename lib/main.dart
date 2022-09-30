import 'package:fake_account/profile/bloc/picture_bloc.dart';
import 'package:fake_account/profile/perfil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      ),
      home: BlocProvider(
        create: (context) => PictureBloc(),
        child: Perfil(),
      ),
    );
  }
}
