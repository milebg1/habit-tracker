import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/habitos_provider.dart';
import 'screens/home_screen.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return ChangeNotifierProvider(
      create:(_)=> HabitosProvider(),
      child:MaterialApp(
        debugShowCheckedModeBanner:false,
        title:'Hábitos',
        theme:ThemeData(
          primarySwatch: Colors.purple,
        ),
        home:const HomeScreen(),
      ),
    );
  }
}
