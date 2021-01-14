import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _controller = TextEditingController();
  final List<TodoItem> _items = List();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Todo App')),
      body: Column(
        children: <Widget>[
          Row (
            children: <Widget>[
              Expanded(
                flex: 3,
                child: TextField(controller: _controller,)
              ),
              Expanded(
                flex: 1,
                child: RaisedButton(
                  child: Text('Add'),
                  color: Colors.orange[600],
                  textColor: Colors.white,
                  onPressed: () {
                    setState(() {
                      _items.add(TodoItem(content: _controller.text,));
                      _controller.clear();
                    });
                  },
                )
              ),
            ],
          ),
          Expanded(
            child: Column(
              children: _items,
            )
          ),
      ],),
    );
  }
}

class TodoItem extends StatelessWidget {
  final String content;
  TodoItem({@required this.content});

  @override
  Widget build (BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.expand(height: 50),
      child: Container(
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.lightBlue[200]))
        ),
        child: Center(
          child: Text(
            content,
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
        ),
      ),
    );
  }
}
