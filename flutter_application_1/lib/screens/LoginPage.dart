import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/FlutterModel.dart';
import 'package:flutter_application_1/model/FlutterStatus.dart';
import 'package:flutter_application_1/screens/BottoNavigationBar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

class HomeOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(
    //   SystemUiOverlayStyle(
    //     statusBarColor: HexColor("#1D1E32"),
    //     statusBarBrightness: Brightness.light,
    //     statusBarIconBrightness: Brightness.light,
    //   ),
    // );
    return Consumer<CheckStatus>(
      builder: (BuildContext context, CheckStatus data, Widget child) {
        return MaterialApp(
          theme: new ThemeData(
            scaffoldBackgroundColor: HexColor("#1D1E32"),
            accentColor: HexColor("#FC4B4B"),
          ),
          home: data.isAuthentificated ? BottomNav() : LoginPage(),
          debugShowCheckedModeBanner: false,
        );
      },
    );

    //   return MaterialApp(
    //     theme: new ThemeData(
    //       scaffoldBackgroundColor: HexColor("#1D1E32"),
    //       accentColor: HexColor("#FC4B4B"),
    //     ),
    //     home: LoginPage(),
    //     debugShowCheckedModeBanner: false,
    //   );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        toolbarHeight: 150.0,
        backgroundColor: HexColor("#1D1E32"),
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          'BUYMAX',
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
                fontSize: 40.0,
                color: HexColor("#FC4B4B"),
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: new Column(
          children: <Widget>[
            _tabSection(context),
          ],
        ),
      ),
    );
  }
}

Widget _tabSection(BuildContext context) {
  TextEditingController controller = TextEditingController();

  return ChangeNotifierProvider<CheckStatus>(
    create: (context) => CheckStatus(),
    child: DefaultTabController(
      length: 2,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          new Container(
            alignment: Alignment.center,
            child: PreferredSize(
              preferredSize: new Size(45.0, 100.0),
              child: TabBar(
                indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(
                      width: 3,
                      color: HexColor("#FC4B4B"),
                    ),
                    insets: EdgeInsets.only(
                      left: 32,
                      right: 32,
                      bottom: 4,
                    )),
                tabs: [
                  Tab(
                    text: "Log In",
                  ),
                  Tab(
                    text: "Sign Up",
                  ),
                ],
              ),
            ),
          ),
          new Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: TabBarView(
              children: [
                new Container(
                  margin: EdgeInsets.only(top: 20.0),
                  child: new Column(
                    children: [
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          new Text(
                            'Welcome back,',
                            style: GoogleFonts.poppins(
                              textStyle: new TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          new Text(
                              'Login with a social account or ' +
                                  '\n' +
                                  'enter your mobile number',
                              style: new TextStyle(
                                  color: HexColor("#ACACAC"), fontSize: 11),
                              textAlign: TextAlign.center),
                        ],
                      ),
                      SizedBox(
                        height: 50.0,
                      ),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          //
                          //    CONSUMER    - LOGIN
                          //
                          Consumer<FlutterModel>(
                            builder: (context, data, child) {
                              // ignore: deprecated_member_use
                              return new FlatButton(
                                minWidth: 144.0,
                                onPressed: () {
                                  data.loginWithCustomer();
                                },
                                padding: EdgeInsets.all(8.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  side: BorderSide(
                                    color: HexColor("#D6D6D6"),
                                    width: 0.0,
                                  ),
                                ),
                                child: Text(
                                  'Customer',
                                  style: GoogleFonts.poppins(
                                    textStyle: new TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),

                          SizedBox(
                            width: 15.0,
                          ),
                          //
                          //    CONSUMER    - LOGIN
                          //
                          Consumer<FlutterModel>(
                            builder: (context, data, child) {
                              // ignore: deprecated_member_use
                              return new FlatButton(
                                minWidth: 144.0,
                                onPressed: () {
                                  data.loginWithSeller();
                                },
                                padding: EdgeInsets.all(8.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  side: BorderSide(
                                    color: HexColor("#D6D6D6"),
                                    width: 0.0,
                                  ),
                                ),
                                child: Text(
                                  'Seller',
                                  style: GoogleFonts.poppins(
                                    textStyle: new TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          //
                          //    CONSUMER    - LOGIN
                          //
                          Consumer<FlutterModel>(
                            builder: (context, data, child) {
                              return new Container(
                                width: 300.0,
                                height: 45.0,
                                child: new TextField(
                                  controller: controller,
                                  cursorColor: HexColor("#C2C2C2"),
                                  decoration: InputDecoration(
                                    hintText: 'Mobile Number',
                                    // hintText: data.hint == null
                                    //     ? 'Mobile Number'
                                    //     : data.hint,
                                    hintStyle: GoogleFonts.poppins(
                                        color: HexColor("#C2C2C2"),
                                        fontSize: 11.0),
                                    enabledBorder: new OutlineInputBorder(
                                      borderSide: new BorderSide(
                                        color: HexColor("#D6D6D6"),
                                      ),
                                    ),
                                    focusedBorder: new OutlineInputBorder(
                                      borderSide: new BorderSide(
                                        color: HexColor("#D6D6D6"),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      new SizedBox(
                        height: 50.0,
                      ),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          new Container(
                            width: 300.0,
                            child: new Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                new Container(
                                  child: new Text(
                                    "Forget Password?",
                                    style: GoogleFonts.poppins(
                                      fontSize: 11,
                                      color: HexColor("#F0F0F0"),
                                    ),
                                  ),
                                ),
                                //
                                //    CONSUMER    - LOGIN
                                //
                                Consumer<FlutterModel>(
                                  builder: (context, data, child) {
                                    return new Container(
                                      width: 112.0,
                                      // decoration: BoxDecoration(
                                      //   border: Border.all(color: Colors.white),
                                      // ),
                                      // ignore: deprecated_member_use
                                      child: new FlatButton(
                                        onPressed: () {
                                          // data.saveSignUpData(who, what)
                                          // data.saveLoginData(controller.text);

                                          // Navigator.pushReplacement(
                                          //   context,
                                          //   MaterialPageRoute(
                                          //     builder: (context) => HomePage1(),
                                          //   ),
                                          // );
                                        },
                                        child: new Icon(
                                          Icons.arrow_forward,
                                          color: Colors.white,
                                        ),
                                        color: HexColor("#FC4B4B"),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                new Container(
                  margin: EdgeInsets.only(top: 20.0),
                  child: new Column(
                    children: [
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          new Text(
                            'Sign Up,',
                            style: GoogleFonts.poppins(
                              textStyle: new TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          new Text(
                              'Signup with a social account or ' +
                                  '\n' +
                                  'enter your mobile number',
                              style: new TextStyle(
                                  color: HexColor("#ACACAC"), fontSize: 11),
                              textAlign: TextAlign.center),
                        ],
                      ),
                      SizedBox(
                        height: 50.0,
                      ),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Consumer<FlutterModel>(
                            builder: (context, data, child) {
                              // ignore: deprecated_member_use
                              return new FlatButton(
                                minWidth: 144.0,
                                onPressed: () {
                                  data.signUpWithCustomer();
                                },
                                padding: EdgeInsets.all(8.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  side: BorderSide(
                                    color: HexColor("#D6D6D6"),
                                    width: 0.0,
                                  ),
                                ),
                                child: Text(
                                  'Customer',
                                  style: GoogleFonts.poppins(
                                    textStyle: new TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                          SizedBox(
                            width: 15.0,
                          ),
                          Consumer<FlutterModel>(
                            builder: (context, data, child) {
                              // ignore: deprecated_member_use
                              return new FlatButton(
                                minWidth: 144.0,
                                onPressed: () {
                                  data.signUpWithSeller();
                                },
                                padding: EdgeInsets.all(8.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  side: BorderSide(
                                    color: HexColor("#D6D6D6"),
                                    width: 0.0,
                                  ),
                                ),
                                child: Text(
                                  'Seller',
                                  style: GoogleFonts.poppins(
                                    textStyle: new TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Consumer<FlutterModel>(
                            builder: (context, data, child) {
                              return new Container(
                                width: 300.0,
                                height: 45.0,
                                child: new TextField(
                                  controller: controller,
                                  cursorColor: HexColor("#C2C2C2"),
                                  decoration: InputDecoration(
                                    hintText: 'Mobile Number',
                                    // hintText: data.hint == null
                                    //     ? 'Mobile Number'
                                    //     : data.hint,
                                    hintStyle: GoogleFonts.poppins(
                                        color: HexColor("#C2C2C2"),
                                        fontSize: 11.0),
                                    enabledBorder: new OutlineInputBorder(
                                      borderSide: new BorderSide(
                                        color: HexColor("#D6D6D6"),
                                      ),
                                    ),
                                    focusedBorder: new OutlineInputBorder(
                                      borderSide: new BorderSide(
                                        color: HexColor("#D6D6D6"),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      new SizedBox(
                        height: 50.0,
                      ),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          new Container(
                            width: 300.0,
                            // decoration: BoxDecoration(
                            //   border: Border.all(color: Colors.white),
                            // ),
                            child: new Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                new Container(
                                  child: new Text(
                                    "Forget Password?",
                                    style: GoogleFonts.poppins(
                                      fontSize: 11,
                                      color: HexColor("#F0F0F0"),
                                    ),
                                  ),
                                ),
                                new Container(
                                  width: 112.0,
                                  // ignore: deprecated_member_use
                                  child: new FlatButton(
                                    onPressed: () {
                                      // _saveData(controller.text);
                                      CheckStatus checkStatus =
                                          Provider.of<CheckStatus>(context,
                                              listen: false);
                                      checkStatus.isAuthentificated = true;
                                    },
                                    child: new Icon(
                                      Icons.arrow_forward,
                                      color: Colors.white,
                                    ),
                                    color: HexColor("#FC4B4B"),
                                  ),
                                ),
                                // Consumer<CheckStatus>(
                                //   builder: (context, data, child) {
                                //     return new Container(
                                //       width: 112.0,
                                //       // decoration: BoxDecoration(
                                //       //   border: Border.all(color: Colors.white),
                                //       // ),

                                //       // ignore: deprecated_member_use
                                //       child: new FlatButton(
                                //         onPressed: () {
                                //           print('clicked');
                                //           // print(controller.text +
                                //           //     " " +
                                //           //     data.who +
                                //           //     " " +
                                //           //     data.loginORSignup);
                                //           // data.saveSignUpData(controller.text);

                                //           // CheckStatus checkStatus =
                                //           //     Provider.of<CheckStatus>(context,
                                //           //         listen: false);
                                //           // checkStatus.isAuthentificated = true;

                                //           // Navigator.pushReplacement(
                                //           //   context,
                                //           //   MaterialPageRoute(
                                //           //     builder: (context) => HomePage1(),
                                //           //   ),
                                //           // );
                                //         },
                                //         child: new Icon(
                                //           Icons.arrow_forward,
                                //           color: Colors.white,
                                //         ),
                                //         color: Colors.blue,
                                //         // color: HexColor("#FC4B4B"),
                                //       ),
                                //     );
                                //   },
                                // ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );

  // return DefaultTabController(
  //   length: 2,
  //   child: new Column(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     crossAxisAlignment: CrossAxisAlignment.center,
  //     mainAxisSize: MainAxisSize.min,
  //     children: <Widget>[
  //       new Container(
  //         alignment: Alignment.center,
  //         child: PreferredSize(
  //           preferredSize: new Size(45.0, 100.0),
  //           child: TabBar(
  //             indicator: UnderlineTabIndicator(
  //                 borderSide: BorderSide(
  //                   width: 3,
  //                   color: HexColor("#FC4B4B"),
  //                 ),
  //                 insets: EdgeInsets.only(
  //                   left: 32,
  //                   right: 32,
  //                   bottom: 4,
  //                 )),
  //             tabs: [
  //               Tab(
  //                 text: "Log In",
  //               ),
  //               Tab(
  //                 text: "Sign Up",
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //       new Container(
  //         width: MediaQuery.of(context).size.width,
  //         height: MediaQuery.of(context).size.height,
  //         child: TabBarView(
  //           children: [
  //             new Container(
  //               margin: EdgeInsets.only(top: 20.0),
  //               child: new Column(
  //                 children: [
  //                   new Row(
  //                     mainAxisAlignment: MainAxisAlignment.center,
  //                     crossAxisAlignment: CrossAxisAlignment.center,
  //                     children: [
  //                       new Text(
  //                         'Welcome back,',
  //                         style: GoogleFonts.poppins(
  //                           textStyle: new TextStyle(
  //                             fontSize: 22,
  //                             color: Colors.white,
  //                           ),
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                   new Row(
  //                     mainAxisAlignment: MainAxisAlignment.center,
  //                     crossAxisAlignment: CrossAxisAlignment.center,
  //                     children: [
  //                       new Text(
  //                           'Login with a social account or ' +
  //                               '\n' +
  //                               'enter your mobile number',
  //                           style: new TextStyle(
  //                               color: HexColor("#ACACAC"), fontSize: 11),
  //                           textAlign: TextAlign.center),
  //                     ],
  //                   ),
  //                   SizedBox(
  //                     height: 50.0,
  //                   ),
  //                   new Row(
  //                     mainAxisAlignment: MainAxisAlignment.center,
  //                     crossAxisAlignment: CrossAxisAlignment.center,
  //                     children: [
  //                       // ignore: deprecated_member_use
  //                       new FlatButton(
  //                         minWidth: 144.0,
  //                         onPressed: () {},
  //                         padding: EdgeInsets.all(8.0),
  //                         shape: RoundedRectangleBorder(
  //                           borderRadius: BorderRadius.circular(5.0),
  //                           side: BorderSide(
  //                             color: HexColor("#D6D6D6"),
  //                             width: 0.0,
  //                           ),
  //                         ),
  //                         child: Text(
  //                           'Customer',
  //                           style: GoogleFonts.poppins(
  //                             textStyle: new TextStyle(
  //                               fontSize: 14,
  //                               color: Colors.white,
  //                             ),
  //                           ),
  //                         ),
  //                       ),
  //                       SizedBox(
  //                         width: 15.0,
  //                       ),
  //                       // ignore: deprecated_member_use
  //                       new FlatButton(
  //                         minWidth: 144.0,
  //                         onPressed: () {},
  //                         padding: EdgeInsets.all(8.0),
  //                         shape: RoundedRectangleBorder(
  //                           borderRadius: BorderRadius.circular(5.0),
  //                           side: BorderSide(
  //                             color: HexColor("#D6D6D6"),
  //                             width: 0.0,
  //                           ),
  //                         ),
  //                         child: Text(
  //                           'Seller',
  //                           style: GoogleFonts.poppins(
  //                             textStyle: new TextStyle(
  //                               fontSize: 14,
  //                               color: Colors.white,
  //                             ),
  //                           ),
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                   SizedBox(
  //                     height: 30.0,
  //                   ),
  //                   new Row(
  //                     mainAxisAlignment: MainAxisAlignment.center,
  //                     crossAxisAlignment: CrossAxisAlignment.center,
  //                     children: [
  //                       new Container(
  //                         width: 300.0,
  //                         height: 45.0,
  //                         child: new TextField(
  //                           controller: controller,
  //                           cursorColor: HexColor("#C2C2C2"),
  //                           decoration: InputDecoration(
  //                             hintText: "Mobile Number",
  //                             hintStyle: GoogleFonts.poppins(
  //                                 color: HexColor("#C2C2C2"), fontSize: 11.0),
  //                             enabledBorder: new OutlineInputBorder(
  //                               borderSide: new BorderSide(
  //                                 color: HexColor("#D6D6D6"),
  //                               ),
  //                             ),
  //                             focusedBorder: new OutlineInputBorder(
  //                               borderSide: new BorderSide(
  //                                 color: HexColor("#D6D6D6"),
  //                               ),
  //                             ),
  //                           ),
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                   new SizedBox(
  //                     height: 50.0,
  //                   ),
  //                   new Row(
  //                     mainAxisAlignment: MainAxisAlignment.center,
  //                     crossAxisAlignment: CrossAxisAlignment.center,
  //                     children: [
  //                       new Container(
  //                         width: 300.0,
  //                         // decoration: BoxDecoration(
  //                         //   border: Border.all(color: Colors.white),
  //                         // ),
  //                         child: new Row(
  //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                           children: [
  //                             new Container(
  //                               child: new Text(
  //                                 "Forget Password?",
  //                                 style: GoogleFonts.poppins(
  //                                   fontSize: 11,
  //                                   color: HexColor("#F0F0F0"),
  //                                 ),
  //                               ),
  //                             ),
  //                             new Container(
  //                               width: 112.0,
  //                               // decoration: BoxDecoration(
  //                               //   border: Border.all(color: Colors.white),
  //                               // ),
  //                               // ignore: deprecated_member_use
  //                               child: new FlatButton(
  //                                 onPressed: () {
  //                                   Navigator.pushReplacement(
  //                                     context,
  //                                     MaterialPageRoute(
  //                                       builder: (context) => HomePage1(),
  //                                     ),
  //                                   );
  //                                 },
  //                                 child: new Icon(
  //                                   Icons.arrow_forward,
  //                                   color: Colors.white,
  //                                 ),
  //                                 color: HexColor("#FC4B4B"),
  //                               ),
  //                             ),
  //                           ],
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 ],
  //               ),
  //             ),
  //             new Container(
  //               margin: EdgeInsets.only(top: 20.0),
  //               child: new Column(
  //                 children: [
  //                   new Row(
  //                     mainAxisAlignment: MainAxisAlignment.center,
  //                     crossAxisAlignment: CrossAxisAlignment.center,
  //                     children: [
  //                       new Text(
  //                         'Sign Up,',
  //                         style: GoogleFonts.poppins(
  //                           textStyle: new TextStyle(
  //                             fontSize: 22,
  //                             color: Colors.white,
  //                           ),
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                   new Row(
  //                     mainAxisAlignment: MainAxisAlignment.center,
  //                     crossAxisAlignment: CrossAxisAlignment.center,
  //                     children: [
  //                       new Text(
  //                           'Signup with a social account or ' +
  //                               '\n' +
  //                               'enter your mobile number',
  //                           style: new TextStyle(
  //                               color: HexColor("#ACACAC"), fontSize: 11),
  //                           textAlign: TextAlign.center),
  //                     ],
  //                   ),
  //                   SizedBox(
  //                     height: 50.0,
  //                   ),
  //                   new Row(
  //                     mainAxisAlignment: MainAxisAlignment.center,
  //                     crossAxisAlignment: CrossAxisAlignment.center,
  //                     children: [
  //                       // ignore: deprecated_member_use
  //                       new FlatButton(
  //                         minWidth: 144.0,
  //                         onPressed: () {},
  //                         padding: EdgeInsets.all(8.0),
  //                         shape: RoundedRectangleBorder(
  //                           borderRadius: BorderRadius.circular(5.0),
  //                           side: BorderSide(
  //                             color: HexColor("#D6D6D6"),
  //                             width: 0.0,
  //                           ),
  //                         ),
  //                         child: Text(
  //                           'Customer',
  //                           style: GoogleFonts.poppins(
  //                             textStyle: new TextStyle(
  //                               fontSize: 14,
  //                               color: Colors.white,
  //                             ),
  //                           ),
  //                         ),
  //                       ),
  //                       SizedBox(
  //                         width: 15.0,
  //                       ),
  //                       // ignore: deprecated_member_use
  //                       new FlatButton(
  //                         minWidth: 144.0,
  //                         onPressed: () {},
  //                         padding: EdgeInsets.all(8.0),
  //                         shape: RoundedRectangleBorder(
  //                           borderRadius: BorderRadius.circular(5.0),
  //                           side: BorderSide(
  //                             color: HexColor("#D6D6D6"),
  //                             width: 0.0,
  //                           ),
  //                         ),
  //                         child: Text(
  //                           'Seller',
  //                           style: GoogleFonts.poppins(
  //                             textStyle: new TextStyle(
  //                               fontSize: 14,
  //                               color: Colors.white,
  //                             ),
  //                           ),
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                   SizedBox(
  //                     height: 30.0,
  //                   ),
  //                   new Row(
  //                     mainAxisAlignment: MainAxisAlignment.center,
  //                     crossAxisAlignment: CrossAxisAlignment.center,
  //                     children: [
  //                       new Container(
  //                         width: 300.0,
  //                         height: 45.0,
  //                         child: new TextField(
  //                           controller: controller,
  //                           cursorColor: HexColor("#C2C2C2"),
  //                           decoration: InputDecoration(
  //                             hintText: "Mobile Number",
  //                             hintStyle: GoogleFonts.poppins(
  //                                 color: HexColor("#C2C2C2"), fontSize: 11.0),
  //                             enabledBorder: new OutlineInputBorder(
  //                               borderSide: new BorderSide(
  //                                 color: HexColor("#D6D6D6"),
  //                               ),
  //                             ),
  //                             focusedBorder: new OutlineInputBorder(
  //                               borderSide: new BorderSide(
  //                                 color: HexColor("#D6D6D6"),
  //                               ),
  //                             ),
  //                           ),
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                   new SizedBox(
  //                     height: 50.0,
  //                   ),
  //                   new Row(
  //                     mainAxisAlignment: MainAxisAlignment.center,
  //                     crossAxisAlignment: CrossAxisAlignment.center,
  //                     children: [
  //                       new Container(
  //                         width: 300.0,
  //                         // decoration: BoxDecoration(
  //                         //   border: Border.all(color: Colors.white),
  //                         // ),
  //                         child: new Row(
  //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                           children: [
  //                             new Container(
  //                               child: new Text(
  //                                 "Forget Password?",
  //                                 style: GoogleFonts.poppins(
  //                                   fontSize: 11,
  //                                   color: HexColor("#F0F0F0"),
  //                                 ),
  //                               ),
  //                             ),
  //                             new Container(
  //                               width: 112.0,
  //                               // decoration: BoxDecoration(
  //                               //   border: Border.all(color: Colors.white),
  //                               // ),
  //                               // ignore: deprecated_member_use
  //                               child: new FlatButton(
  //                                 onPressed: () {
  //                                   Navigator.pushReplacement(
  //                                     context,
  //                                     MaterialPageRoute(
  //                                       builder: (context) => HomePage1(),
  //                                     ),
  //                                   );
  //                                 },
  //                                 child: new Icon(
  //                                   Icons.arrow_forward,
  //                                   color: Colors.white,
  //                                 ),
  //                                 color: HexColor("#FC4B4B"),
  //                               ),
  //                             ),
  //                           ],
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ],
  //   ),
  // );
}
