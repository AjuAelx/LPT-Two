import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/FirstHomePage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    // final TextEditingController controller = TextEditingController();

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

  return DefaultTabController(
    length: 2,
    child: new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        new Container(
          alignment: Alignment.center,
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
                        // ignore: deprecated_member_use
                        new FlatButton(
                          minWidth: 144.0,
                          onPressed: () {},
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
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        // ignore: deprecated_member_use
                        new FlatButton(
                          minWidth: 144.0,
                          onPressed: () {},
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
                        new Container(
                          width: 300.0,
                          height: 45.0,
                          child: new TextField(
                            controller: controller,
                            decoration: InputDecoration(
                              hintText: "Mobile Number",
                              hintStyle: GoogleFonts.poppins(
                                  color: HexColor("#C2C2C2"), fontSize: 11.0),
                              enabledBorder: new OutlineInputBorder(
                                borderSide: new BorderSide(
                                  color: HexColor("#D6D6D6"),
                                ),
                              ),
                            ),
                          ),
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
                                // decoration: BoxDecoration(
                                //   border: Border.all(color: Colors.white),
                                // ),
                                // ignore: deprecated_member_use
                                child: new FlatButton(
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => HomePage1(),
                                      ),
                                    );
                                  },
                                  child: new Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                  ),
                                  color: HexColor("#FC4B4B"),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              new Container(),
            ],
          ),
        ),
      ],
    ),
  );
}
