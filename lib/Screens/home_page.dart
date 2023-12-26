import 'package:flutter/material.dart';

import 'package:todo/components/roundiconbutton.dart';
import 'package:todo/components/todolist.dart';

import '../components/buttonsmall.dart';
import '../components/welcome_container.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.toDoList});
  final ToDoList toDoList;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const Icon(
            Icons.menu_sharp,
            size: 30,
          ),
        ),
        body: Column(
          children: [
            const Expanded(
              flex: 2,
              child: WelcomeContainer(),
            ),
            Expanded(
              flex: 7,
              child: Stack(children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                      color: Colors.amber),
                  child: ToDoList(),
                ),
                Align(
                  alignment: const FractionalOffset(0.5, 1.0),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: RoundIconButton(
                        icon: Icons.add,
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                TextEditingController textController =
                                    TextEditingController();
                                return AlertDialog(
                                  title: const Text(
                                    'Add Task',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      TextField(
                                        maxLength: 40,
                                        controller: textController,
                                        decoration: InputDecoration(
                                            hintText: 'Enter New Task Name',
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20))),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            RoundIconButtonSmall(
                                              color: Colors.green,
                                              icon: Icons.check,
                                              onPressed: () {
                                                setState(() {
                                                  widget.toDoList.addTask(
                                                      textController.text);
                                                });

                                                Navigator.pop(context);
                                              },
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            RoundIconButtonSmall(
                                              color: Colors.red,
                                              icon: Icons.close,
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              });
                        }),
                  ),
                )
              ]),
            ),
          ],
        ));
  }
}
