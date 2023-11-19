import 'package:flutter/material.dart';
import 'switch_udp_control.dart';
import 'utils_udp.dart';
//import 'package:path_provider/path_provider.dart';

void main(){
  UtilsUdp udpInst = UtilsUdp("192.168.31.75",6666);

  runApp(
    MaterialApp(
      home:Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("NanoClient"),),
        ),
        body : SwitchControlUI(udpInst: udpInst),
      )
    )
  );
}

