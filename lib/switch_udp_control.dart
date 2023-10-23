import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'dart:io';

class SwitchCotrolCode {
  static Uint8List stateCode =  Uint8List(2) ;
  static int precode = 0xff;
  static int oncode  = 0x01;
  static int offcode = 0x00;

  static Uint8List getOnCode(){
    stateCode[0] = 0xff;
    stateCode[1] = oncode;
    return stateCode;
  }

  static Uint8List getOffCode(){
    stateCode[0] = 0xff;
    stateCode[1] = offcode;
    return stateCode;
  }

  static void getHelloCode(){
    // 想要实现一个心跳信号
  }
  
}

// ignore: must_be_immutable
class SwitchControlUI extends StatelessWidget {
  SwitchControlUI({ Key? key }) : super(key: key);

  RawDatagramSocket? _socket; //? _socket可以为空  dart强制执行null检查 192.168.37.75
  void startListening() async {  
    _socket = await RawDatagramSocket.bind("0.0.0.0", 7777);
  }

  void sendMessage(Uint8List data) {
    if (_socket == null) return;
    int port = 6666;
    InternetAddress address = InternetAddress("192.168.31.75");
    _socket!.send(data, address, port);
    
  }

  @override
  Widget build(BuildContext context){
    startListening();
    final Size size = MediaQuery.of(context).size;  
    return Container(
      padding: EdgeInsets.fromLTRB(0,  size.height/4, 0, 0),
      alignment: Alignment.center,
      child: Column(   
        children: [
          SizedBox(  // turn on light
            height: 90,
            width: 150,
            child: ElevatedButton.icon(onPressed: (){sendMessage(SwitchCotrolCode.getOnCode());},icon: const Icon(Icons.light),label: const Text("on")),
          ),
          Container( // turn off light
            margin: const EdgeInsets.fromLTRB(0, 80, 0, 0),
            height: 90,
            width: 150,
            child: ElevatedButton.icon(onPressed: (){sendMessage(SwitchCotrolCode.getOffCode());},icon: const Icon(Icons.bedtime),label: const Text("off")),
          ),
      ],
      ),
    );
  }
}