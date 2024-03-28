import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/add_expense/views/add_expense.dart';
import 'package:flutter_application_1/screens/home/views/main_screen.dart';
import 'package:flutter_application_1/screens/stats/stats.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var wigetList = [MainScreen(), StatScreen()];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //custom bottonnavigationbar
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(30)),
        child: BottomNavigationBar(
            onTap: (value) {
              setState(() {
                index = value;
              });
            },
            currentIndex: index,
            backgroundColor: Colors.white,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            elevation: 3,
            selectedIconTheme:const IconThemeData(color: Colors.blue),
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home, size: 30,), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.graph_square_fill), label: 'Stats'),
            ]),
      ),

      //custom float button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const AddExpense(),)); 
        },
        shape: const CircleBorder(),
        child: Container(
            width: double.infinity,
            height: double.maxFinite,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(colors: [
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.secondary,
                  Theme.of(context).colorScheme.tertiary,
                ], transform: const GradientRotation(pi / 4))),
            child: const Icon(
              CupertinoIcons.add,
              size: 30,
            )),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      //custom main screen
      // body: index == 0 ? MainScreen() : StatScreen(),
      body: AddExpense(),
    );
  }
}
