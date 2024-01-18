import 'package:flutter/material.dart';

class ChatCScreen extends StatefulWidget {
  const ChatCScreen({super.key});

  @override
  State<ChatCScreen> createState() => _ChatCScreenState();
}

class _ChatCScreenState extends State<ChatCScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: false,
        title: const Text(
          "Message Tutor",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        bottom: PreferredSize(
            preferredSize: const Size(3, 60),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(7),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: 'Search',
                          hintStyle: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                          prefixIcon: const Icon(Icons.search),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  const BorderSide(color: Colors.white)),
                          fillColor: Colors.white),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
