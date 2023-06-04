import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StoryPage extends StatefulWidget {
  int index = 0;
  String name = "";
  String storyList = "";

  StoryPage(
      {Key? key,
      required this.name,
      required this.storyList,
      required this.index})
      : super(key: key);

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  var size, height, width;

  @override
  Widget build(BuildContext context) {

    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent[100],
          title: const Text("Hikoyalar"),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
              child: Text(widget.name, style: const TextStyle(fontSize: 30)),
            ),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: Text(
                  widget.storyList,
                  style: const TextStyle(fontSize: 20, color: Colors.black54),
                )),
            CupertinoButton(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                onPressed: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();

                    prefs.setString('name', widget.name);
                    prefs.setString("storyList", widget.storyList);


                },
                child: Container(
                    height: 50,
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                      color: Colors.blueAccent[100],
                    ),
                    child: const Center(
                        child: Text(
                      "Saqlash",
                      style: TextStyle(color: Colors.white),
                    )))),
          ],
        )));
  }
}
