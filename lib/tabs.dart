import 'package:flutter/material.dart';
import 'package:nano_client/utils/utils_udp.dart';
import 'pages/light_udp_control.dart';
import 'pages/door_ble_control.dart';
import 'pages/config_json_control.dart';
//import 'package:path_provider/path_provider.dart';

class Tabs extends StatefulWidget{
  const Tabs ( {super.key});
  @override
  State<StatefulWidget> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _currentIndex = 0;
  UtilsUdp udpInst = UtilsUdp("192.168.31.75",6666);

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      LigheControl(udpInst: udpInst),
      DoorControl(udpInst: udpInst),
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