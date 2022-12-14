import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_shared/screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late int _counter = 0;
  late SharedPreferences shared; //

  void navShared() {
    Navigator.push(
        context,
        MaterialPageRoute(
          //переход на другу страницу(класс)
          builder: (context) => Screen(counter: _counter),
        ));
  }


  



  void clearCounter() {
    _counter = 0;
    shared.setInt("counter", _counter);
    setState(() {
      _counter;
    });
  }

  Future<void> initShared() async //
  {
    shared = await SharedPreferences.getInstance();
    _counter = shared.getInt('counter') ?? 0;

    setState(() {
      _counter;
    });

    // if(_counter>0 || _counter!=null)
    // {
    //    navShared();
    // }
  }

  @override
  void initState() //
  {
    initShared();
    super.initState();
  }

  void _incrementCounter() async {
    setState(() {
      _counter++;
    });

    await shared.setInt("counter", _counter); //
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Кликай',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            ElevatedButton(
                onPressed: () {


                  navShared();


                },
                child: Text('Переход')),
            ElevatedButton(
                onPressed: () {
                  clearCounter();
                },
                child: Text('Очистить')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
