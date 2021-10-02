import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
        ),
        home: MyApp(),
      ),
    );

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List todos = [];
  String input = "";
  // bool _isEnabled = false;
  bool ischeck = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TODO APP"),
      ),
      body: Column(children: <Widget>[
        Padding(
          padding: EdgeInsets.all(16.0),
          child: TextField(
            // enabled: _isEnabled,
            onChanged: (value) {
              input = value;
            },
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                hintText: 'Enter your Todo',
                suffixIcon: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      todos.add(input);
                    });
                  },
                )),
          ),
        ),
        Expanded(
            child: SizedBox(
                height: 200.0,
                child: ListView.builder(
                    itemCount: todos.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Dismissible(
                          key: Key(todos[index]),
                          child: Card(
                            elevation: 4,
                            margin: EdgeInsets.all(8),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24)),
                            child: ListTile(
                              leading: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      ischeck = true;
                                    });
                                  },
                                  color: ischeck ? Colors.green : Colors.white,
                                  icon: Icon(Icons.check_box)),
                              title: Text(todos[index]),
                              trailing: Wrap(
                                spacing: 4,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        // _isEnabled = !_isEnabled;
                                      });
                                    },
                                    icon: Icon(
                                      Icons.edit,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  // Icon(
                                  //   Icons.edit,

                                  // ),
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          todos.removeAt(index);
                                        });
                                      },
                                      icon: Icon(Icons.delete,
                                          color: Colors.redAccent)),
                                ],
                              ),
                            ),
                          ));
                    })))
      ]),
    );
  }
}
