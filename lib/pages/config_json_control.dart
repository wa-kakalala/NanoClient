import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:convert' as convert;

class ConfigControl extends StatefulWidget{
  const ConfigControl ( {super.key});
  @override
  State<StatefulWidget> createState() => _ConfigControlState();
}

class _ConfigControlState extends State<ConfigControl> {
  TextEditingController ipController = TextEditingController();
  TextEditingController portController = TextEditingController();

  void saveBnt() async {
    // 获取应用程序目录
    Directory  appDocumentDirectory = await getApplicationDocumentsDirectory();
    // 路径
    String path = '${appDocumentDirectory.path}${Platform.pathSeparator}NanoClient${Platform.pathSeparator}config.json';
    File file = File(path);
    if( ! file.existsSync()){
      file = await File(path).create(recursive: true);
    }

    Map<String,String> address = {
      "ipAddress": ipController.text,
      "portAddress": portController.text,
    };
    await file.writeAsString('{"ipAddress":"${address['ipAddress']}","portAddress":"${address['portAddress']}"}');
  }

  void setAddress() async {
    // 获取应用程序目录
    Directory  appDocumentDirectory = await getApplicationDocumentsDirectory();
    // 路径
    String path = '${appDocumentDirectory.path}${Platform.pathSeparator}NanoClient${Platform.pathSeparator}config.json';
    File file = File(path);
    if( ! file.existsSync()){
      ipController.text = '';
      portController.text = '';
      return;
    }

    var jsonString = await file.readAsString();
    Map<String, dynamic> address = convert.jsonDecode(jsonString);
    ipController.text = address['ipAddress'].toString();
    portController.text = address['portAddress'].toString();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init( context, designSize:const Size(360,640));
    setAddress();
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
            child: ElevatedButton.icon(onPressed: saveBnt ,icon: const Icon(Icons.save),label: const Text("Save")),
          ),

      ]
    );
  }
}