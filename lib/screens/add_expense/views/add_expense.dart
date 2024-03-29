import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class AddExpense extends StatefulWidget {
  const AddExpense({super.key});

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  TextEditingController expenseController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  //AlertDiaLog
  TextEditingController colorController = TextEditingController();
  //Icon - Alert
  List<String> myCategoriesIcons = [
    'entertainment',
    'food',
    'home',
    'pet',
    'shopping',
    'tech',
    'travel'
  ];
  String iconSelected = 'entertainment';
  //------------------------------------------------

  // Color set - Alert
  Color pickerColor = Color(0xff443a49);

  void changeColor(Color color) {
    setState(() {
      pickerColor = color;
      colorController.text = pickerColor.toString();
    });
  }

  bool openChooseColor = false;
  //------------------------------------------------

  @override
  void initState() {
    dateController.text = DateFormat('dd/MM/yyyy').format(DateTime.now());
    colorController.text = pickerColor.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.background,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Add Expenses',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
              ),
              const SizedBox(
                height: 20,
              ),

              //Money
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: TextFormField(
                  controller: expenseController,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      prefixIcon: const Icon(FontAwesomeIcons.dollarSign,
                          size: 16, color: Colors.grey),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none)),
                ),
              ),
              const SizedBox(
                height: 32,
              ),

//Category
              TextFormField(
                onTap: () {},
                readOnly: true,
                textAlignVertical: TextAlignVertical.center,
                controller: categoryController,
                decoration: InputDecoration(
                    hintText: 'Category',
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: const Icon(FontAwesomeIcons.list,
                        size: 16, color: Colors.grey),
                    suffixIcon: IconButton(
                        onPressed: () {
                          showDialog(
                              context: context,
//SHOW DIALOG ADD THE ITEM
                              builder: (context) {
                                bool openSelectedIcon = false;
                                return StatefulBuilder(
                                  builder: (context, setState) {
                                    return AlertDialog(
                                      backgroundColor: Color(0xFF522B5B),
                                      title: const Text(
                                        'Create a Category',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      content: Container(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            //NameField
                                            TextFormField(
                                              // controller: dateController,
                                              textAlignVertical:
                                                  TextAlignVertical.center,
                                              decoration: InputDecoration(
                                                  isDense: true,
                                                  hintText: 'Name',
                                                  filled: true,
                                                  fillColor: Colors.white,
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                      borderSide:
                                                          BorderSide.none)),
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            //IconField
                                            TextFormField(
                                              onTap: () {
                                                setState(() {
                                                  openSelectedIcon =
                                                      !openSelectedIcon;
                                                });
                                              },
                                              readOnly: true,
                                              // controller: dateController,
                                              textAlignVertical:
                                                  TextAlignVertical.center,
                                              decoration: InputDecoration(
                                                  isDense: true,
                                                  hintText: 'Icon',
                                                  filled: true,
                                                  prefixIcon: Transform.scale(
                                                    scale:
                                                        0.5, // Điều chỉnh độ lớn tại đây
                                                    child: Image(
                                                        image: AssetImage(
                                                            'assets/${iconSelected}.png')),
                                                  ),
                                                  suffixIcon: const Icon(
                                                    Icons.arrow_drop_down,
                                                    size: 20,
                                                  ),
                                                  fillColor: Colors.white,
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          openSelectedIcon
                                                              ? const BorderRadius
                                                                  .vertical(
                                                                  top: Radius
                                                                      .circular(
                                                                          12))
                                                              : BorderRadius
                                                                  .circular(12),
                                                      borderSide:
                                                          BorderSide.none)),
                                            ),
                                            //Selected Icon
                                            openSelectedIcon
                                                ? Container(
                                                    height: 200,
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 10,
                                                        vertical: 10),
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    decoration: const BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.vertical(
                                                                bottom: Radius
                                                                    .circular(
                                                                        12)),
                                                        color: Colors.white),
                                                    child: GridView.builder(
                                                      itemCount:
                                                          myCategoriesIcons
                                                              .length,
                                                      gridDelegate:
                                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                                              crossAxisCount: 3,
                                                              crossAxisSpacing:
                                                                  5,
                                                              mainAxisSpacing:
                                                                  5),
                                                      itemBuilder:
                                                          (context, index) {
                                                        return GestureDetector(
                                                          onTap: () {
                                                            setState(() {
                                                              iconSelected =
                                                                  myCategoriesIcons[
                                                                      index];
                                                            });
                                                          },
                                                          child: Container(
                                                            height: 70,
                                                            width: 70,
                                                            decoration: BoxDecoration(
                                                                border: Border.all(
                                                                    width: 2,
                                                                    color: iconSelected ==
                                                                            myCategoriesIcons[
                                                                                index]
                                                                        ? Colors
                                                                            .green
                                                                        : Theme.of(context)
                                                                            .colorScheme
                                                                            .outline),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12)),
                                                            child: Image.asset(
                                                                'assets/${myCategoriesIcons[index]}.png'),
                                                          ),
                                                        );
                                                      },
                                                    ))
                                                : Container(),

                                            const SizedBox(
                                              height: 20,
                                            ),

                                            //ColorField
                                            TextFormField(
                                              onTap: () {
                                                setState(() {
                                                  openChooseColor =
                                                      !openChooseColor;
                                                });
                                              },
                                              style:
                                                  TextStyle(color: pickerColor),
                                              readOnly: true,
                                              controller: colorController,
                                              textAlignVertical:
                                                  TextAlignVertical.center,
                                              decoration: InputDecoration(
                                                  prefixIcon: Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            left: 5, right: 5),
                                                    height: 5,
                                                    width: 5,
                                                    decoration: BoxDecoration(
                                                        color: pickerColor,
                                                        shape: BoxShape.circle),
                                                  ),
                                                  suffixIcon: const Icon(
                                                    Icons.arrow_drop_down,
                                                    size: 20,
                                                  ),
                                                  isDense: true,
                                                  hintText: 'Color',
                                                  filled: true,
                                                  fillColor: Colors.white,
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          openChooseColor
                                                              ? const BorderRadius
                                                                  .vertical(
                                                                  top: Radius
                                                                      .circular(
                                                                          12))
                                                              : BorderRadius
                                                                  .circular(12),
                                                      borderSide:
                                                          BorderSide.none)),
                                            ),
                                            //Choose Color
                                            openChooseColor
                                                ? ColorPicker(
                                                    pickerColor: pickerColor,
                                                    onColorChanged: changeColor,
                                                  )
                                                : Container(),

                                            const SizedBox(
                                              height: 20,
                                            ),
//Savebutton
                                            SizedBox(
                                              width: double.infinity,
                                              height: kToolbarHeight,
                                              child: TextButton(
                                                onPressed: () {
                                                  //Create Category Object
                                                  Navigator.pop(context);
                                                },
                                                style: TextButton.styleFrom(
                                                    backgroundColor:
                                                        Colors.black,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12))),
                                                child: const Text(
                                                  'Save',
                                                  style: TextStyle(
                                                    fontSize: 22,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              });
                        },
                        icon: const Icon(Icons.add,
                            size: 20, color: Colors.grey)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none)),
              ),

              const SizedBox(
                height: 20,
              ),
//Date
              TextFormField(
                controller: dateController,
                onTap: () async {
                  final DateTime? selectedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(const Duration(days: 365)));

                  if (selectedDate != null) {
                    dateController.text =
                        DateFormat('dd/MM/yyyy').format(selectedDate);
                  }
                },
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                    hintText: 'Date',
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: const Icon(FontAwesomeIcons.clock,
                        size: 16, color: Colors.grey),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none)),
              ),

              const SizedBox(
                height: 32,
              ),

//save button
              SizedBox(
                width: double.infinity,
                height: kToolbarHeight,
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12))),
                  child: const Text(
                    'Save',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
