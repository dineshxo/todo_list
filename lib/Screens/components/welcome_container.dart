import 'package:flutter/material.dart';

class WelcomeContainer extends StatelessWidget {
  const WelcomeContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 20.0,
        right: 20.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Hello!',
                style: TextStyle(
                    fontSize: 35,
                    color: Colors.orange[800],
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                'Dinesh Manchanayaka',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
              )
            ],
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Image.asset(
              'assets/images/dp.jpg',
              height: 80,
              width: 80,
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  }
}
