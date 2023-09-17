import 'package:flutter/material.dart';
import 'move_controlhub.dart';

void main(){
  runApp(
    MaterialApp(
      home:Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("NanoClient"),),
        ),
        body : const MoveControlHub(),
      )
    )
  );
}

