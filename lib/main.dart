import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  final int page = 0;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const PageViewDemo());
  }
}

class PageViewDemo extends StatefulWidget {
  const PageViewDemo({Key? key}) : super(key: key);
  @override
  _PageViewDemoState createState() => _PageViewDemoState();
}

class _PageViewDemoState extends State<PageViewDemo> {
  final PageController _controller = PageController(initialPage: 0, viewportFraction: 0.8);

  @override
  initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        TextButton(
          onPressed: () => _controller.animateToPage(0, duration: const Duration(milliseconds: 750), curve: Curves.ease),
          child: const Text(
            'Meet-Ups',
            style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
        TextButton(
          onPressed: () => _controller.animateToPage(3, duration: const Duration(milliseconds: 750), curve: Curves.ease),
          child: const Text(
            'Members',
            style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
        TextButton(
          onPressed: () => _controller.animateToPage(4, duration: const Duration(milliseconds: 750), curve: Curves.ease),
          child: const Text(
            'Sponsors',
            style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
        TextButton(
          onPressed: () => _controller.animateToPage(5, duration: const Duration(milliseconds: 750), curve: Curves.ease),
          child: const Text(
            'About',
            style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
      ], title: const Text('')),
      body: Scrollbar(
        controller: _controller,
        child: PageView(
            controller: _controller,
            physics: const ClampingScrollPhysics(),
            scrollDirection: Axis.vertical,
            children: const [
              MeetUpWidget(additionalText: ' - 26.05.2022. '),
              MeetUpWidget(additionalText: ' - 25.04.2022. '),
              MeetUpWidget(additionalText: ' - 24.03.2022. '),
              MembersWidget(additionalText: ''),
              SponsorsWidget(additionalText: ''),
              AboutWidget(additionalText: ' Flutter Croatia')
            ]),
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Flutter Croatia'),
            ),
            ListTile(
              title: const Text('Meet-Ups'),
              onTap: () {
                _controller.animateToPage(0, duration: const Duration(milliseconds: 750), curve: Curves.ease);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Members'),
              onTap: () {
                _controller.animateToPage(3, duration: const Duration(milliseconds: 750), curve: Curves.ease);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Sponsors'),
              onTap: () {
                _controller.animateToPage(4, duration: const Duration(milliseconds: 750), curve: Curves.ease);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('About'),
              onTap: () {
                _controller.animateToPage(5, duration: const Duration(milliseconds: 750), curve: Curves.ease);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MeetUpWidget extends StatelessWidget {
  final String additionalText;

  const MeetUpWidget({Key? key, required this.additionalText}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: [MyBox(mediumGreen, text: 'Meet-Up $additionalText', height: 80)],
        ),
        Expanded(
            child: Row(
          children: [MyBox(lightGreen, height: 300), MyBox(lightGreen, height: 300), MyBox(lightGreen, height: 300)],
        )),
        Expanded(
            child: Row(
          children: [
            MyBox(Colors.blueGrey, height: 200),
            MyBox(Colors.blueGrey, height: 200),
            MyBox(Colors.blueGrey, height: 200)
          ],
        )),
      ],
    );
  }
}

class MembersWidget extends StatelessWidget {
  final String additionalText;

  const MembersWidget({Key? key, required this.additionalText}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: [MyBox(darkBlue, text: 'Members $additionalText', height: 80)],
        ),
        Expanded(
            child: Row(
          children: [MyBox(Colors.blue, height: 300), MyBox(Colors.blue, height: 300), MyBox(Colors.blue, height: 300)],
        )),
        Expanded(
            child: Row(
          children: [
            MyBox(Colors.lightBlue, height: 200),
            MyBox(Colors.lightBlue, height: 200),
            MyBox(Colors.lightBlue, height: 200)
          ],
        )),
      ],
    );
  }
}

class SponsorsWidget extends StatelessWidget {
  final String additionalText;

  const SponsorsWidget({Key? key, required this.additionalText}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: [MyBox(darkRed, text: 'Sponsors $additionalText', height: 80)],
        ),
        Expanded(
            child: Row(
          children: [MyBox(Colors.red, height: 300), MyBox(Colors.red, height: 300), MyBox(Colors.red, height: 300)],
        )),
        Expanded(
            child: Row(
          children: [
            MyBox(lightRed, height: 200),
            MyBox(lightRed, height: 200),
            MyBox(lightRed, height: 200)
          ],
        )),
      ],
    );
  }
}

class AboutWidget extends StatelessWidget {
  final String additionalText;

  const AboutWidget({Key? key, required this.additionalText}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: [MyBox(Colors.blueGrey, text: 'About $additionalText', height: 500)],
        )
      ],
    );
  }
}

const lightBlue = Color(0xff00bbff);
const mediumBlue = Color(0xff00a2fc);
const darkBlue = Color(0xff0075c9);

final lightGreen = Colors.green.shade300;
final mediumGreen = Colors.green.shade600;
final darkGreen = Colors.green.shade900;

final lightRed = Colors.red.shade300;
final mediumRed = Colors.red.shade600;
final darkRed = Colors.red.shade900;

class MyBox extends StatelessWidget {
  final Color color;
  final double? height;
  final String? text;

  MyBox(this.color, {this.height, this.text});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(10),
        color: color,
        height: (height == null) ? 150 : height,
        child: (text == null)
            ? null
            : Center(
                child: Text(
                  text!,
                  style: const TextStyle(
                    fontSize: 50,
                    color: Colors.white,
                  ),
                ),
              ),
      ),
    );
  }
}
