

import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'dart:async';
import 'decline.dart';
late Timer _timer;
int _start = 0;
class calla extends StatefulWidget {
  const calla({Key? key,
      required this.state,
      required this.number,
      required this.userid})
      : super(key: key);
  final String state;
  final String number;
  final String userid;

  @override
  State<calla> createState() => _callaState();
}

class _callaState extends State<calla> {
  final interval = const Duration(seconds: 1);

  final int timerMaxSeconds = 1200;

  int currentSeconds = 0;

  String get timerText =>
      '${((timerMaxSeconds - currentSeconds) ~/ 60).toString().padLeft(2, '0')}: ${((timerMaxSeconds - currentSeconds) % 60).toString().padLeft(2, '0')}';

  startTimeout() {
    var duration = interval;
    Timer.periodic(duration, (timer) {
      setState(() {
        print(timer.tick);
        currentSeconds = timer.tick;
        if (timer.tick >= timerMaxSeconds) timer.cancel();
      });
    });
  }

  @override
  void initState() {
    startTimeout();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    //var Colorcolorr = 'blue';
    

    return Scaffold(
     
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.green.shade50,
            Colors.green.shade100,
            Colors.green.shade200,
            Colors.green.shade300,
            Colors.green.shade500
            //hello there rono this is the aimated version of you here speaking
          ],
          stops: [0.1, 0.4, 0.7, 0.9, 1.0],
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
height: MediaQuery.of(context).size.height*0.22,
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
            SizedBox(height: 10,),
            Text(
              timerText,
              style: TextStyle(
                fontSize: 19,
                color: Colors.grey[900],
              ),
            ),
            SizedBox(height: 10,),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black26,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(
                                                  10.0) //                 <--- border radius here
                                              ),
                                        ),
               // color: Colors.black,
                height: 500,
                width: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: [
                       Column(
                        children: [
                          Icon(Icons.add,color: Colors.white,),
                          Text("Add call",
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
                          Icon(Icons.pause,color: Colors.white,),
                          Text("Hold call",
              style: TextStyle(
                  //fontSize: 32,
                  color: Colors.white,
                  //fontWeight: FontWeight.bold
                  ),)
                        ],
                      ),Column(
                        children: [
                          Icon(Icons.bluetooth,color: Colors.white,),
                          Text("bluetooth",
              style: TextStyle(
                  //fontSize: 32,
                  color: Colors.white,
                  //fontWeight: FontWeight.bold
                  ),)
                        ],
                      )
                    ],),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: [
                       Column(
                        children: [
                          Icon(Icons.volume_up,color: Colors.white,),
                          Text("Speaker",
              style: TextStyle(
                  //fontSize: 32,
                  color: Colors.white,
                  //fontWeight: FontWeight.bold
                  ),)
                        ],
                      ),
                      Column(
                        children: [
                          Icon(Icons.mic_off,color: Colors.white,),
                          Text("Mute",
              style: TextStyle(
                  //fontSize: 32,
                  color: Colors.white,
                  //fontWeight: FontWeight.bold
                  ),)
                        ],
                      ),Column(
                        children: [
                          Icon(Icons.keyboard,color: Colors.white,),
                          Text("Keypad",
              style: TextStyle(
                  //fontSize: 32,
                  color: Colors.white,
                  //fontWeight: FontWeight.bold
                  ),)
                        ],
                      )
                    ],),
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
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => calld(
                                      state: widget.state,
                                      number: widget.number,
                                      userid: widget.userid,
                                    ),
                                  ));
                            },
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
