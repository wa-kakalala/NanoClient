import 'package:flutter/material.dart';

class SwitchCotrolCode {

  int precode = 0xff;
  int oncode  = 0x01;
  int offcode = 0x00;

  SwitchCotrolCode(this.precode, this.oncode,this.offcode);

  void getOnCode(){

  }

  void getOffCode(){

  }

  void getHelloCode(){
    // 想要实现一个心跳信号
  }
  
}


class SwitchControlUI extends StatelessWidget {
  const SwitchControlUI({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    final Size size = MediaQuery.of(context).size;  
    return Container(
      padding: EdgeInsets.fromLTRB(0,  size.height/4, 0, 0),
      alignment: Alignment.center,
      child: Column(   
        children: [
          SizedBox(  // turn on light
            height: 60,
            width: 100,
            child: ElevatedButton.icon(onPressed: (){},icon: const Icon(Icons.light),label: const Text("on")),
          ),
          Container( // turn off light
            margin: const EdgeInsets.fromLTRB(0, 80, 0, 0),
            height: 60,
            width: 100,
            child: ElevatedButton.icon(onPressed: (){},icon: const Icon(Icons.bedtime),label: const Text("off")),
          ),
      ],
      ),
    );
  }
}