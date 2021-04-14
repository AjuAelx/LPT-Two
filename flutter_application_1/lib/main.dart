import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/screens/FirstHomePage.dart';
import 'package:flutter_application_1/screens/LoginPage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import 'model/FlutterModel.dart';
import 'model/FlutterStatus.dart';

Future<void> main() async => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<CheckStatus>(
            create: (BuildContext context) {
              return CheckStatus();
            },
          ),
          ChangeNotifierProvider<FlutterModel>(
            create: (BuildContext context) {
              return FlutterModel();
            },
          ),
          ChangeNotifierProvider<HomePageProviderData>.value(
              value: HomePageProviderData()),
        ],
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
    ));

    return MaterialApp(
      title: 'Buymax',
      theme: new ThemeData(
        backgroundColor: Colors.white,
      ),
      // home: HomePage(),
      home: SplashScreen(),
      // home: _providerTurn(context),
      debugShowCheckedModeBanner: false,
    );
  }
}

// Widget _providerTurn(BuildContext context) {
//   return MultiProvider(
//     providers: [
//       ChangeNotifierProvider.value(
//         value: CheckStatus(),
//       ),
//     ],
//     child: Consumer(
//         // ignore: missing_return
//         builder: (context, data, child) {
//       switch (data.status) {
//         case Status.Uninitialized:
//           return SplashScreen();
//       }
//     }),
//   );
// }

class SplashScreen extends StatefulWidget {
  _SplashScreen createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  //this is for fetch data from server
  // hitApi() async {
  //   print('inside hit');
  //   DataClass data = await Provider.of<HomePageProviderData>(context).hitApi();
  //   Provider.of<HomePageProviderData>(context).setData(data);
  // }

  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),
      () => directToNext(),
    );
  }

  void directToNext() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => HomeOne()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // child: ListView.builder(
        //   itemCount: Provider.of<HomePageProviderData>(context)
        //       .getData()
        //       .dataItems
        //       .length,
        //   itemBuilder: (BuildContext context, int index) {
        //     return ListTile(
        //       title: Text(Provider.of<HomePageProviderData>(context)
        //           .getData()
        //           .dataItems[index]
        //           .id),
        //     );
        //   },
          child: new Center(
            child: new Text(
              'BUYMAX',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40.0,
                  color: HexColor("#FC4B4B"),
                ),
              ),
            ),
          ),
      ),
    );
  }
}

// class HomeOne extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: new ThemeData(
//         scaffoldBackgroundColor: HexColor("#1D1E32"),
//         accentColor: HexColor("#FC4B4B"),
//       ),
//       home: LoginPage(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

// import 'package:flutter/cupertino.dart';
// import 'package:provider/provider.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return FutureProvider<FlutterModel>();
//   }
// }

// Future<FlutterModel> someAsyncFunctionToGetMyModel() async{
//   await Future.delayed(Duration(seconds: 3));
//   return FlutterModel(someValue: 'new data');
// }

// class FlutterModel {
//    FlutterModel({this.someValue});
//    String someValue = 'Hello';
// }
