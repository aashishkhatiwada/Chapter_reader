import 'package:chapter_reader/ReaderScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Chapter reader",
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  List<String> _chapters = [
    "chapter 1",
    "chapter 2",
    "chapter 3",
    "chapter 4",
    "chapter 5",
    "chapter 6",
    "chapter 7",
    "chapter 8",
    "chapter 9"
  ];
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chapter reader"),
        backgroundColor: Color(0xff340000),
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 2,
            mainAxisSpacing: 2,
          ),
          itemBuilder: (BuildContext buildContext, int index) {
            return GestureDetector(
              onTap: () {
                if (_chapters[index] == "chapter 1")
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ReaderScreen(chapterId: index),
                      ));
                else if (_chapters[index] == "chapter 2")
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ReaderScreen(chapterId: index),
                      ));
              },
              child: Card(
                child: Column(children: [
                  SizedBox(
                    height: 5,
                  ),
                  Icon(
                    Icons.book,
                    size: 40,
                  ),
                  Text(
                    _chapters[index],
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  )
                ]),
              ),
            );
          },
          itemCount: _chapters.length,
        ),
      ),
    );
  }
}
