import 'package:flutter/material.dart';

class TodoApp extends StatefulWidget {
  @override
  _TodoAppState createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  var output = "";
  List<dynamic> lst = ["1", "2", "3"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView.builder(
          itemCount: lst.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(top: 15),
              height: 50,
              color: Colors.blue[100],
              child: ListTile(
                title: Text(
                  "${lst[index]}",
                  style: TextStyle(color: Colors.blue, fontSize: 30),
                ),
                trailing: Container(
                  width: 70,
                  child: Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text("Edit Item"),
                                    backgroundColor: Colors.green[200],
                                    content: TextField(
                                      onChanged: (value) {
                                        output = value;
                                      },
                                    ),
                                    actions: [
                                      ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            lst.replaceRange(
                                                index, index + 1, {output});
                                          });
                                          Navigator.of(context).pop();
                                        },
                                        child: Text("Edit"),
                                      ),
                                    ],
                                  );
                                });
                          },
                          child: Icon(Icons.edit)),
                      SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            lst.removeAt(index);
                          });
                        },
                        child: Icon(Icons.delete),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text("Add Item"),
                  backgroundColor: Colors.green[200],
                  content: TextField(
                    onChanged: (value) {
                      output = value;
                    },
                  ),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          lst.add(output);
                        });
                        Navigator.of(context).pop();
                      },
                      child: Text("Add"),
                    ),
                  ],
                );
              });
        },
        child: Text("Add"),
      ),
    );
  }
}
