import 'dart:io';

class Request {
  static void sendMassage(String massage) async{
    if (massage.isNotEmpty) {
      await Socket.connect("192.168.172.187", 1991).then((serverSocket) {
        serverSocket.write(massage);
        serverSocket.flush();
        print("client massage: "+ massage);
      });
    } else {
      print("invalid write");
    }
  }

  static Future<String> getMassage() async{
    String serverMassage = '';
    await Socket.connect("192.168.172.187", 1991).then((serverSocket) {
      serverSocket.listen((socket) {
        serverMassage = String.fromCharCodes(socket).trim();
      }).onDone((){
        print("Server massage: " + serverMassage);
      });
    });
    return serverMassage;
  }

  static Future<String> sendThenGetMassage(String massage) async {
    String serverMassage = '';
    if (massage.isNotEmpty) {
      await Socket.connect("192.168.172.187", 1991).then((serverSocket) {
        print('_WE ARE Connect!!!');
        serverSocket.write(massage);
        serverSocket.flush();
        print('client massage: ' + massage);
        serverSocket.listen((socket) {
          serverMassage = String.fromCharCodes(socket).trim();
        }).onDone(() {
          print("server massage: " + serverMassage);
        });
        // serverSocket.close();
      });
    } else {
      print("_invalid massage!");
    }
    return serverMassage;
  }


}