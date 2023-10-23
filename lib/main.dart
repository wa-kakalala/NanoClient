import 'package:flutter/material.dart';
import 'switch_udp_control.dart';

void main(){
  
  runApp(
    MaterialApp(
      home:Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("NanoClient"),),
        ),
        body : SwitchControlUI(),
      )
    )
  );
}

