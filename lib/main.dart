import 'package:flutter/material.dart';
import './quotes.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var text = '';
  var author = '';

  void getQuotes() {
    var randomNb = Random().nextInt(quotes.length);
    setState(() {
      text = quotes[randomNb]["quoteText"]!;
      author = quotes[randomNb]["quoteAuthor"]!;
    });
  }

  Color generateColor() {
    var r = Random().nextInt(156);
    var g = Random().nextInt(156);
    var b = Random().nextInt(156);
    return Color.fromRGBO(r, g, b, 1);
  }

  @override
  void initState() {
    getQuotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('5K Quotes'),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 100),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,3
            end: Alignment.bottomRight,
            colors: [generateColor(), generateColor(), generateColor()],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.network(
                'https://firebasestorage.googleapis.com/v0/b/flutter-pro-51469.appspot.com/o/quoteImage.png?alt=media&token=38137f05-7dbe-4dee-8cdf-142cc0064726',
                height: 80,
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(255, 83, 100, 0.8),
                    border: Border.all(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(25)),
                child: Text(
                  "\" $text \" ",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Lobster',
                      color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.white, width: 2),
                    ),
                  ),
                  child: Text(
                    "- $author",
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                        fontSize: 21,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: getQuotes,
        backgroundColor: Colors.teal,
        child: const Icon(Icons.refresh),
      ),
      // ), This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
