import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/services.dart';
import 'package:stories_in_uzbek/pages/saved.dart';
import 'package:stories_in_uzbek/pages/story_list.dart';
import 'package:stories_in_uzbek/pages/storypage.dart';

void main() {

  runApp(const MaterialApp(
    home: MyApp(),
  ));
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(

        appBar: AppBar(
          backgroundColor: Colors.blueAccent[100],

          title: const Text('Ibratli Hikoyalar',style: TextStyle(color: Colors.black),),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(AppBar().preferredSize.height),
            child: Container(
              height: 50,
              padding: const EdgeInsets.symmetric(
                horizontal:20,
                vertical: 5,
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                  color: Colors.white,
                ),
                child: TabBar(
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                    color: Colors.blueAccent,
                  ),
                  tabs: const [
                    Tab(
                      text: 'Hikoyalar',
                    ),
                    Tab(
                      text: 'Saqlanganlar',
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            StoryList(),
            SavedPage(),
          ],
        ),
      ),
    );
  }
}
