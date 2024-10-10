import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laza/screens/nav_bar_screen.dart';

import 'cuibts/navbar_cuibt.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: BlocProvider<NavBarCubit>(
            create:(context)=> NavBarCubit(),
            child: BottomNavBar(),
        )
    );
  }
}