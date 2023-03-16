// ignore_for_file: prefer_interpolation_to_compose_strings, avoid_unnecessary_containers


import 'package:confetti/confetti.dart';


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final user = FirebaseAuth.instance.currentUser!;
  final controller = ConfettiController();

  @override
  void initState() {
    super.initState();
    controller.play();
   
  }

  @override
  Widget build(BuildContext context) {
    setState(() {});
    
    return Stack(
      alignment: Alignment.center,
      children: [
        Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.pink.shade600,
            actions: [
              IconButton(
                  onPressed: () {
                    signerUserOut();
                  },
                  icon: const Icon(Icons.logout))
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(44),
            child: Container(
              child: Text(
                'Welcome : ' + user.email!,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
          ),
        ),
        ConfettiWidget(
          confettiController: controller,
          //shouldLoop: false,
          blastDirectionality: BlastDirectionality.explosive,
          emissionFrequency: 0.5,
        ),
      ],
    );
  }

  void signerUserOut() {
    FirebaseAuth.instance.signOut();
    //Navigator.pop(context);
  }
}
