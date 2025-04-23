import 'package:flutter/material.dart';
import 'package:stomp_dart_client/stomp_dart_client.dart';
import 'dart:developer' as developer;

class WebSocketScreen extends StatefulWidget {
  const WebSocketScreen({super.key});

  @override
  State<WebSocketScreen> createState() => _WebSocketScreenState();
}

class _WebSocketScreenState extends State<WebSocketScreen> {
  StompClient? stompClient;
  List<String> messages = [];
  final TextEditingController _controller = TextEditingController();
  bool isConnected = false;
  bool isConnecting = false;

  // The WebSocket URL - verify this is correct
  final String socketUrl = "wss://grozziie.zjweiting.com:3091/Attendance-System-Management/ws";

  void onConnect(StompFrame frame) {
    developer.log('WebSocket connected successfully', name: 'WebSocketScreen');
    setState(() {
      isConnected = true;
      isConnecting = false;
      messages.add("Connected to STOMP WebSocket");
    });

    stompClient!.subscribe(
      destination: '/topic/chat',
      callback: (frame) {
        developer.log('Message received: ${frame.body}', name: 'WebSocketScreen');
        setState(() {
          messages.add("Received: ${frame.body}");
        });
      },
    );
  }

  void connect() {
    // Prevent multiple connection attempts
    if (isConnecting) return;

    setState(() {
      isConnecting = true;
      messages.add("Attempting to connect...");
    });

    developer.log('Initializing WebSocket connection', name: 'WebSocketScreen');

    stompClient = StompClient(
      config: StompConfig(
        url: socketUrl,
        onConnect: onConnect,
        onStompError: (frame) {
          developer.log('STOMP error: ${frame.body}', name: 'WebSocketScreen', error: frame.body);
          setState(() {
            messages.add("STOMP Error: ${frame.body}");
            isConnecting = false;
          });
        },
        onWebSocketError: (dynamic error) {
          developer.log('WebSocket error', name: 'WebSocketScreen', error: error);
          setState(() {
            messages.add("WebSocket Error: $error");
            isConnecting = false;
          });
        },
        onDisconnect: (StompFrame frame) {
          developer.log('WebSocket disconnected', name: 'WebSocketScreen');
          setState(() {
            isConnected = false;
            isConnecting = false;
            messages.add("Disconnected from WebSocket");
          });
        },
        // Remove authentication headers if not needed
        stompConnectHeaders: {
          'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzdHJpbmdAZGVtby5jb20iLCJyb2xlIjpbIlJPTEVfQURNSU4iXSwiZXhwIjoxNzQ1NDA1NzY3fQ.tO0T493M-GYJr8vnQGffgmRU6ixx-5lmKCNIN-KAYBQ', // STOMP-level auth
        },
        webSocketConnectHeaders: {
          'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJzdHJpbmdAZGVtby5jb20iLCJyb2xlIjpbIlJPTEVfQURNSU4iXSwiZXhwIjoxNzQ1NDA1NzY3fQ.tO0T493M-GYJr8vnQGffgmRU6ixx-5lmKCNIN-KAYBQ', // WebSocket handshake auth
        },
        // If needed, replace with actual tokens
      ),
    );

    try {
      developer.log('Activating WebSocket client', name: 'WebSocketScreen');
      stompClient!.activate();
    } catch (e) {
      developer.log('Exception during WebSocket activation', name: 'WebSocketScreen', error: e);
      setState(() {
        messages.add("Connection Error: $e");
        isConnecting = false;
      });
    }
  }

  void disconnect() {
    developer.log('Disconnecting WebSocket', name: 'WebSocketScreen');
    try {
      stompClient?.deactivate();
      setState(() {
        isConnected = false;
        messages.add("Manually disconnected");
      });
    } catch (e) {
      developer.log('Error during disconnect', name: 'WebSocketScreen', error: e);
      setState(() {
        messages.add("Disconnect Error: $e");
      });
    }
  }

  void sendMessage() {
    if (_controller.text.isNotEmpty && isConnected && stompClient != null) {
      try {
        developer.log('Sending message: ${_controller.text}', name: 'WebSocketScreen');
        stompClient!.send(
          destination: '/app/messages',
          body: _controller.text,
        );
        setState(() {
          messages.add("Sent: ${_controller.text}");
        });
        _controller.clear();
      } catch (e) {
        developer.log('Error sending message', name: 'WebSocketScreen', error: e);
        setState(() {
          messages.add("Send Error: $e");
        });
      }
    }
  }

  @override
  void dispose() {
    try {
      stompClient?.deactivate();
    } catch (e) {
      developer.log('Error during dispose', name: 'WebSocketScreen', error: e);
    }
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('STOMP WebSocket')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: isConnected ? disconnect : (isConnecting ? null : connect),
              style: ElevatedButton.styleFrom(
                backgroundColor: isConnected ? Colors.red : (isConnecting ? Colors.grey : Colors.blue),
              ),
              child: Text(isConnected ? 'Disconnect' : (isConnecting ? 'Connecting...' : 'Connect')),
            ),
            const SizedBox(height: 16),
            if (isConnected)
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: const InputDecoration(
                        labelText: 'Send a message',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: sendMessage,
                    child: const Text('Send'),
                  ),
                ],
              ),
            const SizedBox(height: 16),
            Text("Messages (${messages.length}):"),
            Expanded(
              child: ListView.builder(
                itemCount: messages.length,
                reverse: true,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Text(messages[messages.length - 1 - index]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
