import 'package:dongpakka_calendar/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();        // flutter framework가 준비가 될 때까지 기다릴 수 있다.
                                                    // 원래는 runApp을 실행하면 같이 실행된다. 그래서 이때까지는 안썼던 것이다.

  await initializeDateFormatting();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeScreen(),));
}
