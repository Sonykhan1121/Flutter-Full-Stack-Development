import 'package:flutter/material.dart' ;
import 'package:web_socket_channel/io.dart';

class WebSocketScreen extends StatefulWidget {
  const WebSocketScreen({super.key});

  @override
  State<WebSocketScreen> createState() => _WebSocketScreenState();
}

class _WebSocketScreenState extends State<WebSocketScreen> {
  late IOWebSocketChannel channel;
  String message =  'No Message yet';


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    channel = IOWebSocketChannel.connect('ws://echo.websocket.org');
    channel.stream.listen((data) {
      setState(() {
        message = data.toString();
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    channel.sink.close();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('WebSocket in Flutter'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('Received Message'),
            Text(message),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
              channel.sink.add('Hello, Server!');
            }, child: Text('Send Message')),
          ],
        ),
      ),
    );
  }
}
