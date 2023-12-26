import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class ToDoList extends StatefulWidget {
  ToDoList({Key? key});

  @override
  State<ToDoList> createState() => _ToDoListState();
  List toDoItem = [];

  void addTask(String text) {
    toDoItem.add([text, false]);
  }
}

ToDoList toDoList = ToDoList();

class _ToDoListState extends State<ToDoList> {
  @override
  void initState() {
    super.initState();
    _loadToDoList();
  }

  void Save() {
    _saveToDoList();
  }

  Future<void> _loadToDoList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedListString = prefs.getString('toDoItem');
    if (savedListString != null) {
      setState(() {
        toDoList.toDoItem = _decodeToDoList(savedListString);
      });
    }
  }

  List<List<dynamic>> _decodeToDoList(String savedListString) {
    List<List<dynamic>> decodedList = [];
    List<String> splitList = savedListString.split(';');
    for (var item in splitList) {
      List<String> values = item.split(',');
      decodedList.add([values[0], values[1] == 'true']);
    }
    return decodedList;
  }

  String _encodeToDoList() {
    return toDoList.toDoItem.map((item) => '${item[0]},${item[1]}').join(';');
  }

  Future<void> _saveToDoList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String encodedList = _encodeToDoList();
    await prefs.setString('toDoItem', encodedList);
  }

  @override
  Widget build(BuildContext context) {
    return toDoList.toDoItem.isEmpty
        ? Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "Let's Add Some Task Hooman!",
                      style: TextStyle(
                          fontSize: 25,
                          color: Color(0xff61376b),
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    Image.asset(
                      'assets/images/error.png',
                      fit: BoxFit.cover,
                      height: 180,
                    ),
                  ],
                ),
              ),
            ),
          )
        : ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: toDoList.toDoItem.length,
            itemBuilder: (BuildContext context, int index) {
              return Dismissible(
                key: Key(toDoList.toDoItem[index][0]),
                direction:
                    DismissDirection.endToStart, // Dismiss from end to start
                onDismissed: (direction) {
                  setState(() {
                    toDoList.toDoItem
                        .removeAt(index); // Remove the item from the list
                    _saveToDoList(); // Save after removal
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
                    child: const Icon(
                      Icons.delete,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    tileColor: toDoList.toDoItem[index][1]
                        ? const Color.fromARGB(255, 85, 203, 89)
                        : const Color.fromARGB(31, 255, 255, 255),
                    leading: Checkbox(
                      value: toDoList.toDoItem[index][1],
                      onChanged: (bool? value) {
                        setState(() {
                          toDoList.toDoItem[index][1] = value ?? false;
                          _saveToDoList(); // Save after change
                        });
                      },
                    ),
                    contentPadding: const EdgeInsets.all(8),
                    title: Text(
                      toDoList.toDoItem[index][0],
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              );
            });
  }
}
