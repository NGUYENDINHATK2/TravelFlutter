import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travelapp/cubit/app_cubit_states.dart';
import 'package:travelapp/cubit/app_cubits.dart';
import 'package:travelapp/pages/detail_page.dart';
import 'package:travelapp/pages/home_page.dart';
import 'package:travelapp/pages/welcome_page.dart';

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({Key? key}) : super(key: key);

  @override
  State<AppCubitLogics> createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<AppCubits, CubitStates>(
      builder: (context, state) {
        if (state is WelcomeState) {
          return const WelcomePage();
        } 
        else if (state is DetailState){
          return const DetailPage();
        }
        else if (state is LoadedState) {
          return HomePage();
        } else if (state is LoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } 
        
        else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    ));
  }
}
