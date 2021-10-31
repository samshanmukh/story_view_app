// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Story View Flutter App',
        debugShowCheckedModeBanner: false,
        home: Home());
  }
}

class Home extends StatelessWidget {
  final StoryController controller = StoryController();

  Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("KPOP"),
      // ),
      body: Container(
        margin: const EdgeInsets.all(
          8,
        ),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height - 50,
              child: StoryView(
                controller: controller,
                storyItems: [
                  StoryItem.text(
                    title:
                        "Hello world!\nHave a look at some great KPOP starts. \n\nTap!",
                    backgroundColor: Colors.black,
                    roundedTop: true,
                  ),
                  StoryItem.inlineImage(
                    url:
                        "https://media.giphy.com/media/3otPoKe9usGOWDUijK/giphy.gif",
                    controller: controller,
                    caption: const Text(
                      "Banku & Tilapia. The food to keep you charged whole day.\n#1 Local food.",
                      style: TextStyle(
                        color: Colors.white,
                        backgroundColor: Colors.black54,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  StoryItem.inlineImage(
                    url:
                        "https://media.giphy.com/media/xT3i18Fs5BSVhGqcN2/giphy.gif",
                    controller: controller,
                    caption: const Text(
                      "Omotuo & Nkatekwan; You will love this meal if taken as supper.",
                      style: TextStyle(
                        color: Colors.white,
                        backgroundColor: Colors.black54,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  StoryItem.inlineImage(
                    url:
                        "https://media.giphy.com/media/3ohuAAZhdx0TB4XWmY/giphy.gif",
                    controller: controller,
                    caption: const Text(
                      "Hektas, sektas and skatad",
                      style: TextStyle(
                        color: Colors.white,
                        backgroundColor: Colors.black54,
                        fontSize: 17,
                      ),
                    ),
                  )
                ],
                onStoryShow: (s) {
                  print("Showing a story");
                },
                onComplete: () {
                  print("Completed a cycle");
                },
                progressPosition: ProgressPosition.bottom,
                repeat: false,
                inline: true,
              ),
            ),
            Material(
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const MoreStories()));
                },
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(8))),
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Text(
                        "View more stories",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MoreStories extends StatefulWidget {
  const MoreStories({Key? key}) : super(key: key);

  @override
  _MoreStoriesState createState() => _MoreStoriesState();
}

class _MoreStoriesState extends State<MoreStories> {
  final storyController = StoryController();

  @override
  void dispose() {
    storyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("More"),
      ),
      body: StoryView(
        storyItems: [
          StoryItem.text(
            title:
                "I guess you'd love to see more of our stories. That's great!",
            backgroundColor: Colors.black,
          ),
          StoryItem.pageImage(
            url: "https://media.giphy.com/media/xTiIzLEfo7HPIdmk3m/giphy.gif",
            caption: "kPOPPpps",
            controller: storyController,
          ),
          StoryItem.pageImage(
              url: "https://media.giphy.com/media/3ohzArZpViHY1bO2uQ/giphy.gif",
              caption: "Working with gifs of kpops",
              controller: storyController),
          StoryItem.pageImage(
            url: "https://media.giphy.com/media/7wDEaTbCupuRq/giphy.gif",
            caption: "Hello, OMG!!",
            controller: storyController,
          ),
          StoryItem.inlineImage(
            url: "https://media.giphy.com/media/l3fZLL1qHGo8CkH6w/giphy.gif",
            caption: const Text("Yeyyy!!, kitty kitty..."),
            controller: storyController,
          ),
          StoryItem.inlineImage(
            url: "https://media.giphy.com/media/KWRGEgDaW9thlZzZYg/giphy.gif",
            controller: storyController,
            caption: const Text(
              "Thanks for watching.. share your love!",
              style: TextStyle(
                color: Colors.white,
                backgroundColor: Colors.black54,
                fontSize: 17,
              ),
            ),
          )
        ],
        onStoryShow: (s) {
          print("Showing a story");
        },
        onComplete: () {
          print("Completed a cycle");
        },
        progressPosition: ProgressPosition.top,
        repeat: false,
        controller: storyController,
      ),
    );
  }
}
