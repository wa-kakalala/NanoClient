import 'package:flutter/material.dart';
import 'pages/light_udp_control.dart';
import 'utils/utils_udp.dart';
import 'pages/door_ble_control.dart';
import 'pages/config_json_control.dart';
//import 'package:path_provider/path_provider.dart';

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
  
  @override
  Widget build(BuildContext context) {
    udpInst = UtilsUdp("192.168.31.75",6666);
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