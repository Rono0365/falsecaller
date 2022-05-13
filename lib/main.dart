import 'package:flutter/material.dart';
import 'call.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'ad_helper.dart';
//import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<InitializationStatus> _initGoogleMobileAds() {
    // TODO: Initialize Google Mobile Ads SDK
    return MobileAds.instance.initialize();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FalseCaller',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late BannerAd _bannerAd;

  // TODO: Add _isBannerAdReady
  bool _isBannerAdReady = false;
  
  
  final titleController = TextEditingController();
  final titleController1 = TextEditingController();
  final titleController2 = TextEditingController();
  final titleController3 = TextEditingController();
  final titleController4 = TextEditingController();
  final titleControllerv = TextEditingController();

  var passtok;
  var userid;
  var userid1;
  var userid2;
  var userid3;
  int State = 0;
  int State2 = 0;
  /*Future createAlbumX() async {
    http.Response response1 = await http.post(
      Uri.parse('http://192.168.100.20:8000/api-token-auth/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': titleController2.text,
        'password': titleController3.text,
      }),
    );
    print(response1.statusCode);
    //works => print(token['token']);
    setState(() {
      State2 = response1.statusCode;
    });
    var token = jsonDecode(response1.body);
    if (response1.statusCode == 200) {
      setState(() {
        passtok = token['token'].toString();
        userid = token['user_id'].toString();
      });

      //});

    }
  }

  Future createAlbum() async {
    http.Response response1 = await http.post(
      Uri.parse('http://192.168.100.20:8000/register/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        /*
        'username': 'ivy',
    'password': 'greensoko001',
    'password2': 'greensoko001',
    'email': 'LadyKeisa@gmail.com',
    'first_name': 'Atndi',
    'last_name': 'Kesha'
        */
        'username': titleController2.text,
        'password': titleController3.text,
        'password2': titleController4.text,
        'email': titleController1.text,
        'first_name': titleControllerv.text,
        'last_name': titleController.text,
      }),
    );

    //works => print(token['token']);

    var token = jsonDecode(response1.body);

    print(token);
    print(response1.statusCode);
    //works => print(token['token']);
    setState(() {
      State = response1.statusCode;
    });
    //var token = jsonDecode(response1.body);
    

  }*/
  @override
  void initState() {

  // TODO: Initialize _bannerAd
  _bannerAd = BannerAd(
    adUnitId: AdHelper.bannerAdUnitId,
    request: AdRequest(),
    size: AdSize.banner,
    listener: BannerAdListener(
      onAdLoaded: (_) {
        setState(() {
          _isBannerAdReady = true;
        });
      },
      onAdFailedToLoad: (ad, err) {
        print('Failed to load a banner ad: ${err.message}');
        _isBannerAdReady = false;
        ad.dispose();
      },
    ),
  );

  _bannerAd.load();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: Text("FalseCaller",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Padding(
                //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  controller: titleControllerv,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[100],
                      //fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      labelText: 'name',
                      hintText: 'Enter Your name'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 0),
                child: TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[100],
                      //fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      labelText: 'Number',
                      hintText: 'Enter a Number'),
                ),
              ),
              
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 0),
                //padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  controller: titleController4,
                  obscureText: true,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[100],
                      //fillColor: Colors.white,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),

                      //border: OutlineInputBorder(),
                      labelText: 'Location ie. Kenya',
                      hintText: 'enter Location'),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20)),
                child: FlatButton(
                  onPressed: () {
                    if(userid != ''){
setState(() {
                      FlutterRingtonePlayer.playRingtone();
                    });
                    
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => call(
                            state: titleController4.text,
                            userid: titleControllerv.text,
                            number: titleController.text,
                          )
                        ));
                    
                     // createAlbumX();
                    
                    
                     
                      
                    
                    }
                    
                  },
                  child: 
                    State == 400 ?Text('retry',style: TextStyle(color: Colors.red, fontSize: 25),):Text('Simulate a call',style: TextStyle(color: Colors.white, fontSize: 25),),
                    
                  ),
                ),
              
              SizedBox(
                height: 130,
              ),
              Text('© 2022' + '\n' + 'a Rono Production',
                  textAlign: TextAlign.center),
                  if (_isBannerAdReady)
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: _bannerAd.size.width.toDouble(),
                height: _bannerAd.size.height.toDouble(),
                child: AdWidget(ad: _bannerAd),
              ),
            ),
            ],
          ),
        ));
  }
}
