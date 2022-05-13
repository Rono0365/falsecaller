import 'package:falsecaller/answer.dart';
import 'package:falsecaller/decline.dart';
import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';

class call extends StatelessWidget {
  const call(
      {Key? key,
      required this.state,
      required this.number,
      required this.userid})
      : super(key: key);
  final String state;
  final String number;
  final String userid;
  @override
  Widget build(BuildContext context) {
    //var Colorcolorr = 'blue';
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        backgroundColor: Colors.blue.shade50,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "Incoming call",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.blue.shade50,
            Colors.blue.shade100,
            Colors.blue.shade200,
            Colors.blue.shade300,
            Colors.blue.shade500
            //hello there rono this is the aimated version of you here speaking
          ],
          stops: [0.1, 0.4, 0.7, 0.9, 1.0],
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              userid,
              style: TextStyle(
                  fontSize: 32,
                  color: Colors.grey[900],
                  fontWeight: FontWeight.bold),
            ),
            Text(
              state,
              style: TextStyle(
                fontSize: 19,
                color: Colors.grey[900],
              ),
            ),
            Text(
              number,
              style: TextStyle(
                  fontSize: 27,
                  color: Colors.grey[900],
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
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
                        glowColor: Colors.green,
                        endRadius: 100.0,
                        duration: const Duration(milliseconds: 2000),
                        repeatPauseDuration: const Duration(milliseconds: 100),
                        repeat: true,
                        child: FloatingActionButton(
                          backgroundColor: Colors.white,
                          onPressed: () {
                            FlutterRingtonePlayer.stop();
                            
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => calla(
                                    state: state,
                                    number: number,
                                    userid: userid,
                                  ),
                                ));
                          },
                          child: Icon(
                            Icons.call,
                            color: Colors.green,
                            size: 28,
                          ),
                        ))),
                SizedBox(width: 15),
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
                              FlutterRingtonePlayer.stop();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => calld(
                                      state: state,
                                      number: number,
                                      userid: userid,
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
