import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(ShowTheSequenceOfFutures());
}

class DemoWidget07 extends StatefulWidget {
  @override
  _DemoWidgetState createState() => _DemoWidgetState();
}

class _DemoWidgetState extends State<DemoWidget07> {
  Image? _imageWidget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ShowTheSequenceOfFutures!'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Ждем выполнения асинхронной операции', textAlign: TextAlign.center),
            if (_imageWidget != null) _imageWidget!,
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final http = MyOwnHttpImplementor();
          final imageFuture = http.get(Uri.parse('http://some-image-from-network.com'));
          imageFuture.then((Image image) {
            setState(() {
              _imageWidget = image;
            });
          });
        },
        tooltip: 'Increment',
        child: Icon(Icons.file_download),
      ),
    );
  }
}

class ShowTheSequenceOfFutures extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ShowTheSequenceOfFutures',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: TextTheme(
            bodyText2: TextStyle(fontSize: 25, color: Colors.blue),
          )),
      home: DemoWidget07(),
    );
  }
}

class MyOwnHttpImplementor {
  Future<Image> get(Uri uri) {
    final completer = Completer<Image>();

    Future.delayed(Duration(seconds: 5), () {
      completer.complete(Image.asset('assets/gifs/so_fast_cats.gif'));
    });

    return completer.future;
  }
}
