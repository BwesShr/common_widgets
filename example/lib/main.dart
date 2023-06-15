import 'package:common_widgets/common_widgets.dart';
import 'package:flutter/material.dart';

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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _fullName = '';

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Common Widgets'),
      ),
      body: Column(
        children: [
          SizedBox(
            width: width / 1.5,
            child: InputFormWidget(
              initialValue: _fullName,
              hint: 'Full Name',
              validateField: (String value) {
                return;
              },
              onChangedInput: (String value) => debugPrint(value),
            ),
          ),
          const SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: width / 3,
                height: 50.0,
                child: RaisedButton(
                  title: 'Proceed',
                  onPressed: () {
                    debugPrint('Proceed Button Pressed');
                  },
                ),
              ),
              SizedBox(
                width: width / 3,
                height: 50.0,
                child: RaisedButton(
                  title: 'Cancel',
                  color: Colors.amber,
                  onPressed: () {
                    debugPrint('Cancel Button Pressed');
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          const RichTextWidget(
            texts: [
              'This',
              'is',
              'the',
              'example\n',
              'for\n',
              'Rich',
              'Text',
            ],
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
