import 'package:flutter/material.dart';

class ToDoList extends StatefulWidget {
  const ToDoList({super.key});

  @override
  State<ToDoList> createState() => _ToDoListState();
}

List _toDoItem = [
  ['Code a new App', false],
  ['Code a new website', false],
];

class _ToDoListState extends State<ToDoList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: _toDoItem.length,
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            key: Key(_toDoItem[index][0]),
            direction: DismissDirection.endToStart, // Dismiss from end to start
            onDismissed: (direction) {
              setState(() {
                _toDoItem.removeAt(index); // Remove the item from the list
              });
            },
            background: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: Colors.red,
                ),
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                // Background color when swiping to delete
                child: const Icon(Icons.delete, color: Colors.white),
              ),
            ),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                tileColor: _toDoItem[index][1]
                    ? const Color.fromARGB(255, 85, 203, 89)
                    : const Color.fromARGB(31, 255, 255, 255),
                leading: Checkbox(
                  value: _toDoItem[index][1],
                  onChanged: (bool? value) {
                    setState(() {
                      _toDoItem[index][1] = value ?? false;
                    });
                  },
                ),
                contentPadding: const EdgeInsets.all(8),
                title: Text(_toDoItem[index][0]),
              ),
            ),
          );
        });
  }
}
