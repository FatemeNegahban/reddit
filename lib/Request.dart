import 'dart:io';
import 'main.dart';

class Request {
  static void writer(String write) async {
    if (write != null && write.isNotEmpty) {
      await Socket.connect("192.168.172.187", 1991).then((serverSocket) {
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

  static Future<String> writerListener(String write) async {
    String listen = '';
    if (write != null && write.isNotEmpty) {
      await Socket.connect("192.168.172.187", 1991).then((serverSocket) {
        serverSocket.write(write);
        serverSocket.flush();
        print('write: ' + write);
        serverSocket.listen((socket) {
          listen = String.fromCharCodes(socket).trim(); //substring(2);
        }).onDone(() {
          print("listen: " + listen);
        });
        // serverSocket.close();
      });
    } else {
      print("invalid write");
    }
    return listen;
  }
}