import 'package:flutter/material.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Color> circleColors = List.generate(20, (index) => Colors.green.shade300); 
  List<bool> isBarVisible = List.generate(10, (index) => true); 

  Color getRandomColor() {
    Random random = Random();
    return Colors.pink.shade100;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            Container(
              height: 120,  
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          circleColors[index] = getRandomColor();
                        });
                      },
                      child: Column(
                        children: [
                          Flexible(
                            child: Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                color: circleColors[index],  
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
           
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return isBarVisible[index] 
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                isBarVisible[index] = false;
                              });
                            },
                            child: Container(
                              height: 200,
                              color: Colors.blue.shade100,
                              child: Center(
                                child: Text(
                                  index.toString(), 
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        )
                      : Container(); 
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(HomePage());
}