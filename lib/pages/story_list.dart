import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stories_in_uzbek/pages/storypage.dart';
import 'package:stories_in_uzbek/story_model.dart';

class StoryList extends StatefulWidget {
  const StoryList({Key? key}) : super(key: key);

  @override
  State<StoryList> createState() => _StoryListState();
}

class _StoryListState extends State<StoryList> {
  int id = 0;
  List name = [];
  List storyList = [];

  Future<void> loadDatafromJson() async {
    final String response = await rootBundle.loadString("assets/stories.json");
    Map<String, dynamic> jsonMap = json.decode(response);
    List<dynamic> stories = jsonMap['stories'];
    List<StoryModel> storyModel =
        stories.map((harflar) => StoryModel.fromJson(harflar)).toList();

    for (var story in storyModel) {
      setState(() {
        name.add(story.name);
        id = story.id;
        storyList.add(story.story);
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadDatafromJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            itemCount: name.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  margin: const EdgeInsets.only(
                      left: 10, top: 5, right: 10, bottom: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 0.5,
                          blurRadius: 0.5,
                          offset: const Offset(0, 4),
                        ),
                      ]),
                  child: ListTile(title: Text(name[index]), onTap: () {

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  StoryPage(name: name[index],storyList: storyList[index],index: index,)),
                    );
                  }));
            }));
  }
}
