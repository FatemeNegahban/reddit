import 'dart:io';
import 'main.dart';

class Request {
  static void writer(String write) async {
    if (write != null && write.isNotEmpty) {
      await Socket.connect("192.168.172.187", 1991).then((serverSocket) {
        write = (write.length + 11).toString() + 'user-' + write;
        serverSocket.write(write);
        serverSocket.flush();
      });
    } else {
      print("invalid write");


    }
  }

  static Future<String> listener() async {
    String listen = '';
    await Socket.connect("192.168.172.187", 1991).then((serverSocket) {
      serverSocket.listen((socket) {
        listen = String.fromCharCodes(socket).trim(); //.substring(2);
      }).onDone((){});
    });
    return listen;
  }


}