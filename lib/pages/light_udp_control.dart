import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:typed_data';
import '../utils/utils_udp.dart';


class LightCotrolCode {
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
}

class LigheControl extends StatelessWidget {
  final UtilsUdp udpInst;
  const LigheControl({ super.key, required this.udpInst});
  @override
  Widget build(BuildContext context){
    ScreenUtil.init( context, designSize:const Size(360,640));
    return Container(
      padding: EdgeInsets.fromLTRB(0, ScreenUtil().setHeight(130), 0, 0),
      alignment: Alignment.center,
      child: Column(   
        children: [
          SizedBox(  // turn on light
            height: ScreenUtil().setHeight(90),
            width: ScreenUtil().setWidth(150),
            child: ElevatedButton.icon(onPressed: (){udpInst.sendMessage(LightCotrolCode.getOnCode());},icon: const Icon(Icons.light),label: const Text("on")),
          ),
          Container( // turn off light
            margin: EdgeInsets.fromLTRB(0, ScreenUtil().setHeight(80), 0, 0),
            height: ScreenUtil().setHeight(90),
            width: ScreenUtil().setWidth(150),
            child: ElevatedButton.icon(onPressed: (){udpInst.sendMessage(LightCotrolCode.getOffCode());},icon: const Icon(Icons.bedtime),label: const Text("off")),
          ),
      ],
      ),
    );
  }
}