import 'package:flutter/material.dart';

import 'package:todo/components/roundiconbutton.dart';
import 'package:todo/components/todolist.dart';
import 'package:todo/components/create_new_task.dart';

import '../components/welcome_container.dart';

class Home extends StatefulWidget {
  const Home({super.key});

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
                  child: const ToDoList(),
                ),
                Align(
                  alignment: const FractionalOffset(0.5, 1.0),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: RoundIconButton(
                        icon: Icons.add,
                        onPressed: () {
                          CreateNewTask().createNewTask(context);
                        }),
                  ),
                )
              ]),
            ),
          ],
        ));
  }
}
