import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//import 'package:path_provider/path_provider.dart';

class ConfigControl extends StatefulWidget{
  const ConfigControl ( {super.key});
  @override
  State<StatefulWidget> createState() => _ConfigControlState();
}

class _ConfigControlState extends State<ConfigControl> {
  TextEditingController ipController = TextEditingController();
  TextEditingController portController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init( context, designSize:const Size(360,640));
    return Column(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(ScreenUtil().setWidth(5), ScreenUtil().setHeight(60), 0,0),
          width: ScreenUtil().setWidth(350),
          child: TextField(
            controller: ipController,
            decoration: const InputDecoration(
              icon: Icon( Icons.important_devices),
              helperText: "输入IP地址" 
              ),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(ScreenUtil().setWidth(5), ScreenUtil().setHeight(60), 0, 0),
          width: ScreenUtil().setWidth(350),
          child: TextField(
            controller: portController,
            decoration: const InputDecoration(
              icon: Icon( Icons.settings_input_svideo_sharp),
              helperText: "输入Port端口" 
              ),
          ),
        ),
        Container( // turn off light
            margin: EdgeInsets.fromLTRB(0, ScreenUtil().setHeight(80), 0, 0),
            height: ScreenUtil().setHeight(60),
            width: ScreenUtil().setWidth(150),
            child: ElevatedButton.icon(onPressed: (){
              print(ipController.text);
              print(portController.text);

            },icon: const Icon(Icons.save),label: const Text("Save")),
          ),

      ]
    );
  }
}