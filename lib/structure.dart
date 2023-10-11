// import 'expense.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'NewExWidget.dart';
// import 'ExListWidget.dart';

// class Structure extends StatefulWidget {
//   State<StatefulWidget> createState() {
//     return StructureState();
//   }
// }

// class StructureState extends State<Structure> {
//   final List<Expense> expenseList = [];
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         NewExWidget(callBackFunc: addNewExpense),
//         ExListWidget(expenseList)
//       ],
//     );
//   }

//   // void addNewExpense({required String t, required double a}) {
//   //   setState(() {
//   //     Expense e = Expense(
//   //         title: t,
//   //         amount: a,
//   //         date: DateTime.now(),
//   //         id: DateTime.now().toString());
//   //     expenseList.add(e);
//   //   });
//   // }
// }
