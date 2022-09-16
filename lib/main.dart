import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_todo_app/view/screen/home_screen.dart';
import 'package:flutter_todo_app/view/widgets/snack_bar.dart';
import 'package:flutter_todo_app/view_model/tasks.dart';

import 'model/database/database_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBHelper.initDB();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Tasks(),
      child: MaterialApp(
        home: HomeScreen(),
        debugShowCheckedModeBanner: false,
        scaffoldMessengerKey: messengerKey,
      ),
    );
  }
}
