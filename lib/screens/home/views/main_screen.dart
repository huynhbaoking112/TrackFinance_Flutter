import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/data/data.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage(
                                'https://images.pexels.com/photos/1391498/pexels-photo-1391498.jpeg?auto=compress&cs=tinysrgb&w=300'),
                            fit: BoxFit.cover,
                          )),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.outline,
                              fontSize: 12,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'John Doe',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.onBackground,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ],
                ),
                // Icon(CupertinoIcons.settings, size: 25,)
                const Icon(
                  Icons.settings,
                  size: 25,
                )
              ],
            ),

            const SizedBox(
              height: 20,
            ),

            //Card
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width / 2,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade500,
                        offset: const Offset(15, 9),
                        blurRadius: 5)
                  ],
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(25),
                  gradient: LinearGradient(colors: [
                    Theme.of(context).colorScheme.primary,
                    Theme.of(context).colorScheme.secondary,
                    Theme.of(context).colorScheme.tertiary,
                  ], transform: const GradientRotation(pi / 4))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //total balance
                  const Text(
                    'Total Balance',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 17),
                  ),

                  const SizedBox(
                    height: 12,
                  ),
                  //balance value
                  const Text(
                    '\$ 4800.00',
                    style: TextStyle(
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 42),
                  ),

                  const SizedBox(
                    height: 12,
                  ),
                  //Income and Expenses
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //Income
                      Row(
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 30,
                                height: 30,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white30),
                                child: const Center(
                                  child: Icon(
                                    Icons.arrow_upward,
                                    size: 20,
                                    color: Colors.greenAccent,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Income',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Text('\$ 2500.00',
                                      style: TextStyle(color: Colors.white))
                                ],
                              )
                            ],
                          )
                        ],
                      ),

                      //Expenses
                      Row(
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 30,
                                height: 30,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white30),
                                child: const Center(
                                  child: Icon(
                                    Icons.arrow_downward,
                                    size: 20,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Expenses',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Text('\$ 800.00',
                                      style: TextStyle(color: Colors.white))
                                ],
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),

//Transaction and view
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Transactions",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Theme.of(context).colorScheme.onBackground),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    'View All',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        color: Theme.of(context).colorScheme.outline),
                  ),
                )
              ],
            ),
//ListView
            const SizedBox(
              height: 20,
            ),
            Expanded(
                child: ListView.builder(
              itemCount: myMainScreenData.length,
              itemBuilder: (context,int index) => Container(
                margin:const EdgeInsets.only(bottom: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                padding:const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //Ex: Image and Food text
                    Row(
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                               color: myMainScreenData[index]['color'],
                                shape: BoxShape.circle),
                          ),
                          Image.asset( myMainScreenData[index]['icon'], width: 20,height: 20, fit: BoxFit.cover,)
                          ]
                        ),
                        const SizedBox(width: 15,),
                         Text(myMainScreenData[index]['name'], style:const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600
                        ),)
                      ],
                    ),
                    //Ex: price and today text
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(myMainScreenData[index]['totalAmount']),
                        Text(myMainScreenData[index]['date'], style: TextStyle(
                          color: Theme.of(context).colorScheme.outline
                        ),)
                      ],
                    )
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
