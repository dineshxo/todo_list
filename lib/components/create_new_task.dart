import 'package:flutter/material.dart';

class CreateNewTask {
  void createNewTask(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            title: Text(
              'Add Task',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            content: InputContent(),
          );
        });
  }
}

TextEditingController textController = TextEditingController();

class InputContent extends StatelessWidget {
  const InputContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          controller: textController,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              hintText: 'Add New Task'),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              RoundIconButtonSmall(
                color: Colors.green,
                icon: Icons.check,
                onPressed: () {},
              ),
              const SizedBox(
                width: 10,
              ),
              RoundIconButtonSmall(
                color: const Color.fromARGB(255, 224, 42, 29),
                icon: Icons.close,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}

class RoundIconButtonSmall extends StatelessWidget {
  const RoundIconButtonSmall(
      {super.key,
      required this.icon,
      required this.onPressed,
      required this.color});

  final IconData icon;
  final Function onPressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        onPressed();
      },
      shape: const CircleBorder(),
      elevation: 5,
      constraints: const BoxConstraints.tightFor(width: 50.0, height: 50.0),
      fillColor: color,
      child: Icon(
        icon,
        size: 30,
        color: Colors.white,
      ),
    );
  }
}
