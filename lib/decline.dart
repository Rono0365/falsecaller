import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'main.dart';
import 'ad_helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class calld extends StatefulWidget {
  const calld(
      {Key? key,
      required this.state,
      required this.number,
      required this.userid})
      : super(key: key);
  final String state;
  final String number;
  final String userid;
  @override
  State<calld> createState() => _calldState();
}

class _calldState extends State<calld> {
  InterstitialAd? _interstitialAd;
  int _numInterstitialLoadAttempts = 0;

  RewardedAd? _rewardedAd;
  int _numRewardedLoadAttempts = 0;

  @override
  void initState() {
    super.initState();
    _createInterstitialAd();

    _navtohome(); 
  }

  void _createInterstitialAd() {
    InterstitialAd.load(
        adUnitId: AdHelper.interstitialAdUnitId,
        request: AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (InterstitialAd ad) {
            print('$ad loaded');
            _interstitialAd = ad;
            _numInterstitialLoadAttempts = 0;
            _interstitialAd!.setImmersiveMode(true);
          },
          onAdFailedToLoad: (LoadAdError error) {
            print('InterstitialAd failed to load: $error.');
            _numInterstitialLoadAttempts += 1;
            _interstitialAd = null;
            if (_numInterstitialLoadAttempts <= 3) {
              _createInterstitialAd();
            }
          },
        ));
  }

  void _showInterstitialAd() {
    if (_interstitialAd == null) {
      print('Warning: attempt to show interstitial before loaded.');
      return;
    }
    _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (InterstitialAd ad) =>
          print('ad onAdShowedFullScreenContent.'),
      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        print('$ad onAdDismissedFullScreenContent.');
        ad.dispose();
        _createInterstitialAd();
      },
      onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
        print('$ad onAdFailedToShowFullScreenContent: $error');
        ad.dispose();
        _createInterstitialAd();
      },
    );
    _interstitialAd!.show();
    _interstitialAd = null;
  }

  void _showRewardedAd() {
    if (_rewardedAd == null) {
      print('Warning: attempt to show rewarded before loaded.');
      return;
    }
    _rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (RewardedAd ad) =>
          print('ad onAdShowedFullScreenContent.'),
      onAdDismissedFullScreenContent: (RewardedAd ad) {
        print('$ad onAdDismissedFullScreenContent.');
        ad.dispose();
      },
      onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError error) {
        print('$ad onAdFailedToShowFullScreenContent: $error');
        ad.dispose();
      },
    );

    _rewardedAd!.setImmersiveMode(true);
    _rewardedAd!.show(onUserEarnedReward: (RewardedAd ad, RewardItem reward) {
      print('$ad with reward $RewardItem(${reward.amount}, ${reward.type}');
    });
    _rewardedAd = null;
  }

  @override
  void dispose() {
    _showInterstitialAd();
    super.dispose();
    
    _interstitialAd?.dispose();
    _rewardedAd?.dispose();
  }

  _navtohome() async {
    await Future.delayed(Duration(milliseconds: 2000), () {});
    _showInterstitialAd();
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => MyApp())); //MyHomePage(title: "myRiara")
  }

  Widget build(BuildContext context) {
    //var Colorcolorr = 'blue';
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.red.shade50,
            Colors.red.shade100,
            Colors.red.shade200,
            Colors.red.shade300,
            Colors.red.shade500
            //hello there rono this is the aimated version of you here speaking
          ],
          stops: [0.1, 0.4, 0.7, 0.9, 1.0],
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.22,
            ),
            Text(
              widget.userid,
              style: TextStyle(
                  fontSize: 32,
                  color: Colors.grey[900],
                  fontWeight: FontWeight.bold),
            ),
            Text(
              widget.state,
              style: TextStyle(
                fontSize: 19,
                color: Colors.grey[900],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "00:00",
              style: TextStyle(
                fontSize: 19,
                color: Colors.grey[900],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.all(Radius.circular(
                          10.0) //                 <--- border radius here
                      ),
                ),
                // color: Colors.black,
                height: 500,
                width: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            Text(
                              "Add call",
                              style: TextStyle(
                                //fontSize: 32,
                                color: Colors.white,
                                //fontWeight: FontWeight.bold
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Icon(
                              Icons.pause,
                              color: Colors.white,
                            ),
                            Text(
                              "Hold call",
                              style: TextStyle(
                                //fontSize: 32,
                                color: Colors.white,
                                //fontWeight: FontWeight.bold
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Icon(
                              Icons.bluetooth,
                              color: Colors.white,
                            ),
                            Text(
                              "bluetooth",
                              style: TextStyle(
                                //fontSize: 32,
                                color: Colors.white,
                                //fontWeight: FontWeight.bold
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Icon(
                              Icons.volume_up,
                              color: Colors.white,
                            ),
                            Text(
                              "Speaker",
                              style: TextStyle(
                                //fontSize: 32,
                                color: Colors.white,
                                //fontWeight: FontWeight.bold
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Icon(
                              Icons.mic_off,
                              color: Colors.white,
                            ),
                            Text(
                              "Mute",
                              style: TextStyle(
                                //fontSize: 32,
                                color: Colors.white,
                                //fontWeight: FontWeight.bold
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Icon(
                              Icons.keyboard,
                              color: Colors.white,
                            ),
                            Text(
                              "Keypad",
                              style: TextStyle(
                                //fontSize: 32,
                                color: Colors.white,
                                //fontWeight: FontWeight.bold
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    height: 150,
                    width: 150,
                    child: AvatarGlow(
                        animate: true,
                        glowColor: Colors.redAccent,
                        endRadius: 100.0,
                        duration: const Duration(milliseconds: 2000),
                        repeatPauseDuration: const Duration(milliseconds: 100),
                        repeat: true,
                        child: FloatingActionButton(
                            backgroundColor: Colors.white,
                            onPressed: () {},
                            child: Icon(
                              Icons.call_end,
                              color: Colors.red,
                              size: 28,
                            ))))
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.07,
            ),
          ],
        ),
      ),
      //floatingActionButton:
    );
  }
}
