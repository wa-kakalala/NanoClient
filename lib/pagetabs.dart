import 'package:flutter/material.dart';
import 'pages/light_udp_control.dart';
import 'utils/utils_udp.dart';
import 'pages/door_ble_control.dart';
import 'pages/config_json_control.dart';
import 'dart:io';
import 'dart:convert' as convert;
import 'package:path_provider/path_provider.dart';

// ignore: must_be_immutable
class PageTabs extends StatefulWidget{
  const PageTabs ({super.key});
  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() => _TabsState();
}

class _TabsState extends State<PageTabs> {
  int _currentIndex = 0;
  UtilsUdp udpInst = UtilsUdp("192.168.31.75",6666);
  String ipAddress = '192.168.31.75';
  String portAddress = '6666';


  void getAddress() async {
    // 获取应用程序目录
    Directory  appDocumentDirectory = await getApplicationDocumentsDirectory();
    // 路径
    String path = '${appDocumentDirectory.path}${Platform.pathSeparator}NanoClient${Platform.pathSeparator}config.json';
    File file = File(path);
    if( !file.existsSync()){
      ipAddress ="192.168.31.75";
      portAddress = "6666";
      return;
    }

    var jsonString = await file.readAsString();
    Map<String, dynamic> address = convert.jsonDecode(jsonString);
    ipAddress = address['ipAddress'].toString();
    portAddress = address['portAddress'].toString();
  }
  
  @override
  Widget build(BuildContext context) {
    getAddress();
    udpInst = UtilsUdp(ipAddress,int.parse(portAddress));
    udpInst.startListening();
    List<Widget> pages = [
      LigheControl(udpInst: udpInst,),
      DoorControl(udpInst: udpInst,),
      const ConfigControl(),
    ];
    
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("NanoClient"),),
        ),
        body : pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex= index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon( Icons.light),
              label: "Light",
            ),  
            BottomNavigationBarItem(
              icon: Icon( Icons.sensor_door),
              label: "Door",
            ),  
            BottomNavigationBarItem(
              icon: Icon( Icons.settings),
              label: "Config",
            ),  
          ]),
      ),
    );
  }
}