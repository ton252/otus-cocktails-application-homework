import 'dart:async';

import 'package:flutter/material.dart';

import 'hidden/application.dart';

void main() {
  runApp(ApplicationWidget(child: FileDataReaderWidget()));
}

///
/// Мы разработчики своей библиотеки для чтения каких-либо данных.
/// Представим себе, что для чтения данных мы разработали такой интерфейс.
///
abstract class DataReader<T> {
  Stream<T> read();
}

///
/// Кажется, что такой контракт DataReader можно использовать для реализации
/// конкретных классов для чтения чело-либо. Например, создадим класс для
/// чтения из файла побайтово!
///
class IOFileDataReader implements DataReader<int> {

  @override
  Stream<int> read() {
    return Stream.periodic(Duration(seconds: 1), (int byte) => byte);
  }
}

class FileDataReaderWidget extends StatefulWidget {
  @override
  _FileDataReaderWidgetState createState() => _FileDataReaderWidgetState();
}


class _FileDataReaderWidgetState extends State<FileDataReaderWidget> {
  final List<int> fileData = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello Stream!'),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Text('Весь ваш код выполняется в одном потоке', textAlign: TextAlign.center),
            SizedBox(height: 140, child: Image.asset('assets/gifs/so_fast_cats.gif')),
            for (final i in fileData) Center(child: Text('Это элемент $i из файла')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _readData,
        tooltip: 'Get Data',
        child: Icon(Icons.file_download),
      ),
    );
  }

  void _readData() async {
    final fileReader = IOFileDataReader();

    fileData.clear();

    ///
    /// А теперь само чтение данных из нашего DataReader
    /// является асинхронным - мы будем получать данные по мере чтения асинхронно и порционно!
    ///
    await for (final data in fileReader.read()) {
      print('Current data is $data');
      setState(() {
        fileData.add(data);
      });
    }
  }
}
