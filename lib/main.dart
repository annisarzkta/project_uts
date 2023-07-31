import 'dart:convert';

import 'package:uts_aplikasibergerak/routes.dart';
import 'package:uts_aplikasibergerak/screens/splash_screen/splash_screen.dart';
import 'package:uts_aplikasibergerak/theme.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //it requires 3 parameters
    //context, orientation, device
    //it always requires, see plugin documentation
    return Sizer(builder: (context, orientation, device) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'HMTK',
        theme: CustomTheme().baseTheme,
        //initial route is splash screen
        //mean first screen
        initialRoute: SplashScreen.routeName,
        //define the routes file here in order to access the routes any where all over the app
        routes: routes,
      );
    });
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key, required this.title});

  final String title;

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final int _counter = 0;
  int total = 0;
  var dataJson;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getDataFromStrapi();
  }

  void _getDataFromStrapi() async {
    var response =
        await http.get(Uri.parse("http://localhost:1337/api/mahasiswas"));
    dataJson = await jsonDecode(response.body);
    print(dataJson["meta"]["pagination"]["total"]);
    setState(() {
      total = dataJson["meta"]["pagination"]["total"];
    });
  }

  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
