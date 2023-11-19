import 'dart:typed_data';
import 'dart:io';

class UtilsUdp {
  String? addressIp;
  int? addressPort;
  UtilsUdp (String ip,int port){
    addressIp = ip;
    addressPort = port;
  }
  RawDatagramSocket? _socket; //? _socket可以为空  dart强制执行null检查 192.168.37.75
  void startListening() async {  
    _socket = await RawDatagramSocket.bind("0.0.0.0", 7777);
  }
  void sendMessage(Uint8List data) {
    if (_socket == null) return;
    InternetAddress address = InternetAddress(addressIp!);
    _socket!.send(data, address, addressPort!);
  }
}