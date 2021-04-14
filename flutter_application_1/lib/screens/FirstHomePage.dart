import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/DataFolder/Post.dart';
import 'package:flutter_application_1/PreferenceManager/PrefManager.dart';
// import 'package:flutter_application_1/PreferenceManager/PrefManager.dart';
import 'package:flutter_application_1/model/FlutterStatus.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class HomePage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: HomePageProviderData(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: HomepAgeFirstUI(),
      ),
    );
  }
}

class HomepAgeFirstUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 25.0),

          // --- Top appbar like Section ---------------------------
          new Padding(
            padding: EdgeInsets.only(
              top: 12.0,
              left: 12.0,
              right: 12.0,
            ),
            child: new Row(
              children: [
                new Column(
                  children: [
                    new Icon(Icons.flag, color: Colors.red),
                  ],
                ),
                SizedBox(
                  width: 5.0,
                ),
                new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    new Text(
                      'You are here',
                      style: GoogleFonts.poppins(
                          color: HexColor("#B8B8B8"), fontSize: 10),
                      textAlign: TextAlign.start,
                    ),
                    new Text(
                      'Select from there',
                      style: new TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: HexColor('#373539'),
                      ),
                    ),
                    // new Container(
                    //   height: 20.0,
                    //   width: 150.0,

                    //   decoration: new BoxDecoration(
                    //     border: new Border.all(color: Colors.red),
                    //   ),
                    //   child: _searchableDropDown(context),
                    // ),
                  ],
                ),
                new Spacer(),
                new Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    new IconButton(
                      onPressed: () {
                        print('clicked');
                        CheckStatus checkStatus =
                            Provider.of<CheckStatus>(context, listen: false);
                        checkStatus.isAuthentificated = false;
                      },
                      icon: Icon(Icons.person_outline),
                    ),
                  ],
                ),
              ],
            ),
          ),
          new Divider(),

          // --- Rest of the body
          _mainBody(context),
        ],
      ),
    );
  }
}

// Widget _searchableDropDown(BuildContext context) {
//   return SearchableDropdown.single(
//     items: [],
//     hint: Text(
//       'Munnar',
//       style: new TextStyle(
//         fontSize: 16.0,
//         fontWeight: FontWeight.bold,
//         color: HexColor('#373539'),
//       ),
//     ),
//     onChanged: () async {},
//     dialogBox: false,
//     isExpanded: true,
//     displayClearIcon: false,
//   );
// }

Widget _mainBody(BuildContext context) {
  return new Column(
    children: [
      // --- SearchBar Section  ---------------------------

      new Padding(
        padding: EdgeInsets.only(
          top: 4.0,
          right: 12.0,
          left: 12.0,
          bottom: 12.0,
        ),
        child: new Container(
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 2.0,
              spreadRadius: 0.0,
              offset: Offset(1.0, 1.0),
            ),
          ]),
          child: new TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixIcon: new Icon(
                Icons.search,
                color: Colors.red,
              ),
              suffixIcon: new Icon(
                Icons.mic,
                color: Colors.red,
              ),
              hintText: "What are you looking for?",
              hintStyle: GoogleFonts.poppins(
                color: HexColor("#B8B8B8"),
                fontSize: 12.0,
              ),
            ),
          ),
        ),
      ),

      new SizedBox(
        height: 3.0,
      ),

      // --- OffersNearBy Section ---------------------------

      new Padding(
        padding: EdgeInsets.only(
          right: 12.0,
          left: 12.0,
        ),
        child: new Container(
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              new Text(
                "Offers Near By",
                style: GoogleFonts.poppins(
                  color: HexColor("#4E4E4E"),
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              new Icon(
                Icons.more_horiz,
                color: HexColor("#B9B9B9"),
              ),
            ],
          ),
        ),
      ),

      new SizedBox(
        height: 3.0,
      ),

      new Container(
        height: 103.0,
        child: _horizontalListView(context),
      ),

      new SizedBox(
        height: 3.0,
      ),

      // --- TodaysOffer Section ---------------------------

      Provider.of<HomePageProviderData>(context).todaysOffersList.length == 0
          ? SizedBox.shrink()
          : new Padding(
              padding: EdgeInsets.only(
                right: 12.0,
                left: 12.0,
              ),
              child: new Column(
                children: [
                  new Container(
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        new Text(
                          "Todays offers on near by restaurant & Hotels",
                          style: GoogleFonts.poppins(
                            color: HexColor("#4E4E4E"),
                            fontSize: 13.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        new Icon(
                          Icons.more_horiz,
                          color: HexColor("#B9B9B9"),
                        ),
                      ],
                    ),
                  ),
                  new Container(
                    height: 167.0,
                    child: _secondHorizontalListView(context),
                  ),
                ],
              ),
            ),

      new Divider(),
      new SizedBox(
        height: 3.0,
      ),

      // --- BottomGridView Section ---------------------------
      new Padding(
        padding: EdgeInsets.only(
          right: 12.0,
          left: 12.0,
        ),
        child: Container(
          height: MediaQuery.of(context).size.height / 2.5,
          width: MediaQuery.of(context).size.width,
          child: _gridView(context),
        ),
      ),
    ],
  );
}

/// ------------------INDIVIDUAL WIDGET START FROM HERE--------------------------
///
//---BottomGridview Main Section----
//
//
Widget _gridView(BuildContext context) {
  List data = [
    {
      'image': 'assets/fork.png',
      'name': 'Restaurent',
      'nearby': '3 near by',
      'color': '#5779FF',
    },
    {
      'image': 'assets/fork.png',
      'name': 'Hypermarket',
      'nearby': '2 near by',
      'color': '#2900FF'
    },
    {
      'image': 'assets/fashion.png',
      'name': 'Textiles',
      'nearby': '5 near by',
      'color': '#12CE44'
    },
    {
      'image': 'assets/monitor.png',
      'name': 'Electronics',
      'nearby': '1 near by',
      'color': '#FF9100'
    },
  ];
  return MediaQuery.removePadding(
    context: context,
    removeTop: true,
    removeBottom: true,
    removeLeft: true,
    removeRight: true,
    child: GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemCount: Provider.of<HomePageProviderData>(context).categoryList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
      ),
      itemBuilder: (BuildContext context, int index) {
        return Card(
          color: Provider.of<HomePageProviderData>(context)
                      .categoryList[index]
                      .categoryName ==
                  'Restaurant'
              ? HexColor('#5779FF')
              : Provider.of<HomePageProviderData>(context)
                          .categoryList[index]
                          .categoryName ==
                      'Hyper Market'
                  ? HexColor('#2900FF')
                  : Provider.of<HomePageProviderData>(context)
                              .categoryList[index]
                              .categoryName ==
                          'Textiles'
                      ? HexColor('#12CE44')
                      : Provider.of<HomePageProviderData>(context)
                                  .categoryList[index]
                                  .categoryName ==
                              'Electronics'
                          ? HexColor('#FF9100')
                          : HexColor('#FF9100'),
          child: new Padding(
            padding: EdgeInsets.all(14.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: new Image.asset(
                        data[index]['image'],
                        width: 40.0,
                        height: 40.0,
                      ),
                    ),
                    Container(
                      child: new Text(
                        Provider.of<HomePageProviderData>(context)
                                .categoryList[index]
                                .categorySellerCount +
                            " near by",
                        // data[index]['nearby'],
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 12.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                new Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      child: new Text(
                        Provider.of<HomePageProviderData>(context)
                            .categoryList[index]
                            .categoryName,
                        // data[index]['name'],
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    ),
  );
}
//
//
//---OffersNearBy Main Section---

Widget _horizontalListView(BuildContext context) {
  return new ListView.builder(
    scrollDirection: Axis.horizontal,
    padding: EdgeInsets.only(right: 11.0, left: 11.0),
    // itemCount: imageData.length,
    itemCount:
        Provider.of<HomePageProviderData>(context).offersNearbyList.length,
    itemBuilder: (BuildContext context, int i) {
      return new Container(
        width: 103.0,
        height: 103.0,
        child: new Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          color: Colors.red,
          child: Center(
            child: new Text(
              Provider.of<HomePageProviderData>(context)
                  .offersNearbyList[i]
                  .offerNearshopName,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // child: Image(
          //   image: NetworkImage(
          // Provider.of<HomePageProviderData>(context)
          //     .offersNearbyList[i]
          //     .offerNearPhoto,
          //   ),
          // ),
        ),
      );
    },
  );
}

Widget _secondHorizontalListView(BuildContext context) {
  // return Expanded(
  return new ListView.builder(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.only(right: 11.0, left: 11.0),
      itemCount:
          Provider.of<HomePageProviderData>(context).todaysOffersList.length,
      itemBuilder: (BuildContext context, int i) {
        return new Container(
          width: 122.0,
          height: 168.0,
          child: new Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            color: Colors.red,
            child: Image(
              image: NetworkImage(
                Provider.of<HomePageProviderData>(context)
                    .todaysOffersList[i]
                    .todaysOfferPhoto,
              ),
            ),
          ),
        );
      });
}

class HomePageProviderData with ChangeNotifier {
  var offersNearbyResponse;
  var todaysOffersResponse;
  var categoryResponse;
  List<DataModelClass> offersNearbyList = [];
  List<DataModelClass> todaysOffersList = [];
  List<DataModelClass> categoryList = [];

  HomePageProviderData() {
    print('going to fetch');
    fetchOffersNearBy();
    fetchTodaysOffers();
    fetchCategoryData();
  }

  Future<List<DataModelClass>> fetchOffersNearBy() async {
    print('inside fetch');
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    Map data;
    data = {
      'keyword': 'Koovappally',
      // 'page': page.toString(),
      // 'limit': limit.toString()
    };
    var body = json.encode(data);
    var url = PrefManager.baseurl + '/nearby/sellers/offers/list';
    offersNearbyResponse =
        await http.post(url, headers: requestHeaders, body: body);

    // offerNearList = json.decode(response.body)['data'];

    // offerNearList = json.decode(response.body)['data'];
    // if (json.decode(response.body)['status']) {
    print('yes inside');
    // var parsed = json.decode(response.body)['data'];
    var decodedDataForOfferesNearby =
        json.decode(offersNearbyResponse.body)['data'];

    for (var listdata in decodedDataForOfferesNearby) {
      DataModelClass dataModelClass = new DataModelClass(
        offerNearPhoto: listdata["photo"],
        offerNearshopName: listdata['shopName'],
      );
      offersNearbyList.add(dataModelClass);
    }
    notifyListeners();
    print(offersNearbyList.length);
    // Map<String, dynamic> map = json.decode(response.body);

    // List<dynamic> values = map["data"];

    // if (values.length > 0) {
    //   for (int i = 0; i < values.length; i++) {
    //     if (values[i] != null) {
    //       Map<String, dynamic> map = values[i];
    //       _postList.add(Post.fromJson(map));
    //       debugPrint('Id-------${map['id']}');
    //     }
    //   }
    // }
    return offersNearbyList;
    // } else {
    //   // If that call was not successful, throw an error.
    //   throw Exception('Failed to load post');
    // }
  }

  Future<List<DataModelClass>> fetchTodaysOffers() async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    Map secondData;
    secondData = {
      'keyword': 'Koovappally',
    };
    var body = json.encode(secondData);
    var url = PrefManager.baseurl + '/seller/offer/list';
    todaysOffersResponse =
        await http.post(url, headers: requestHeaders, body: body);
    var decodedDataForTodaysOffer =
        json.decode(todaysOffersResponse.body)['data'];
    for (var listdata in decodedDataForTodaysOffer) {
      DataModelClass dataModelClass = new DataModelClass(
        todaysOfferPhoto: listdata["photo"],
      );
      todaysOffersList.add(dataModelClass);
    }
    notifyListeners();
    print(todaysOffersList.length);
    return todaysOffersList;
  }

  Future<List<DataModelClass>> fetchCategoryData() async {
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    Map secondData;
    secondData = {
      'keyword': 'Koovappally',
    };
    var categoryBody = json.encode(secondData);
    var categoryUrl = PrefManager.baseurl + '/homepage/category/list';
    categoryResponse = await http.post(categoryUrl,
        headers: requestHeaders, body: categoryBody);
    var decodedDataForCategory = json.decode(categoryResponse.body)['data'];
    for (var categoryData in decodedDataForCategory) {
      DataModelClass dataModelClass = new DataModelClass(
          categoryName: categoryData["name"],
          categorySellerCount: categoryData["sellerCount"].toString());
      categoryList.add(dataModelClass);
    }
    notifyListeners();
    print(categoryList.length);
    return categoryList;
  }
  //`````````````````````````````````````````````````````
  // bool isLoading = true;
  // var length;

  // DataClass _dataClass = new DataClass();
  // List<DataItems> list = [];

  // HomePageProviderData() {
  //   _dataClass.dataItems = list;
  // }

  // setData(DataClass data) {
  //   _dataClass = data;
  //   isLoading = false;
  //   notifyListeners();
  // }

  // DataClass getData() {
  //   return _dataClass;
  // }

  // Future<DataClass> hitApi() async {
  //   var response;

  //   // int page = 1, limit = 10;

  // Map<String, String> requestHeaders = {
  //   'Content-type': 'application/json',
  //   'Accept': 'application/json',
  // };
  // Map data;
  // data = {
  //   'keyword': 'Koovappally',
  //   // 'page': page.toString(),
  //   // 'limit': limit.toString()
  // };

  //   var body = json.encode(data);
  //   var url = PrefManager.baseurl + '/nearby/sellers/offers/list';
  //   response = await http.post(url, headers: requestHeaders, body: body);
  //   list = json.decode(response.body)['data'];
  //   length = json.decode(response.body)['totalLength'];

  //   // var response =
  //   //     await http.get(PrefManager.baseurl + '/nearby/sellers/offers/list');
  //   final Map parsed = json.decode(response.body);
  //   DataClass dataClass = DataClass.fromJson(parsed);
  //   return dataClass;
  // }
  //
  // ```````````````````````````````````````````````````````````````````

  // List offerNearList = [];
  // var length;
  // var response;
  // int page = 1, limit = 10;

  // HomePageProviderData() {
  //   offerNear();
  // }

  // Future<void> offerNear() async {
  // Map<String, String> requestHeaders = {
  //   'Content-type': 'application/json',
  //   'Accept': 'application/json',
  // };
  // Map data;
  // data = {
  //   'keyword': 'Koovappally',
  //   'page': page.toString(),
  //   'limit': limit.toString()
  // };

  // var body = json.encode(data);
  // var url = PrefManager.baseurl + '/nearby/sellers/offers/list';
  // response = await http.post(url, headers: requestHeaders, body: body);
  // offerNearList = json.decode(response.body)['data'];
  //   length = json.decode(response.body)['totalLength'];
  //   print(length.toString());
  // }

  // int get urlCount {
  //   return length;
  // }

  // UnmodifiableListView get listData {
  //   return UnmodifiableListView(offerNearList);
  // }

  // List imageData = [
  //   'assets/kalyanSilks.jpg',
  //   'assets/seematti.jpg',
  //   'assets/jayalakshmi.jpeg',
  //   'assets/alukas.jpg'
  // ];

  // UnmodifiableListView get listData {
  //   return UnmodifiableListView(imageData);
  // }

  // int get listCount {
  //   return imageData.length;
  // }

  // void addData(String data) {
  //   imageData.add(data);
  //   notifyListeners();
  // }
}
