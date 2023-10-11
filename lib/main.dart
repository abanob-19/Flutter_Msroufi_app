import 'package:flutter/material.dart';
import 'package:masroufi/expense.dart';
import 'package:intl/intl.dart';
import 'ExListWidget.dart';
import 'NewExWidget.dart';
import 'structure.dart';

//main
void main() {
  runApp(MyApp());
}

//root widget
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Masroufi',
      theme: ThemeData(
        fontFamily: 'Schyler',
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

// final List<Expense> allexpenses = [
//   Expense(
//     id: "e1",
//     title: "Coffee",
//     amount: 45,
//     date: DateTime.now(),
//   ),
//   Expense(
//     id: "e2",
//     title: "DSL",
//     amount: 14,
//     date: DateTime.now(),
//   )
// ];

// home widget
class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final List<Expense> expenseList = [];
  void showNewExpenseBottomSheet(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (sheetContext) {
          return NewExWidget(callBackFunc: addNewExpense);
        });
  }
double calculateTotal() {

double totalExpenses = 0;

for (var i = 0; i < expenseList.length; i++) {
totalExpenses += expenseList[i].amount;
}
return totalExpenses;
}

  void addNewExpense(
{required String t, required double a, required DateTime d, required ExpenseCategory category, required String note}) {
print(t + " " + a.toString() + " " + d.toString());
setState(() {
Expense e =
Expense(title: t, amount: a, date: d, id:
DateTime.now().toString(), category: category,note: note);
expenseList.add(e);
Navigator.of(context).pop();
});
}
void deleteExpense(String idToDelete) {
setState(() {
expenseList.removeWhere((element) {
return element.id == idToDelete;
});});}


  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: Text("Masroufi"), actions: [
      IconButton(
        onPressed: () {
          showNewExpenseBottomSheet(context);
        },
        icon: Icon(Icons.add),
      ),
    ]),
    floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    floatingActionButton: FloatingActionButton(
      onPressed: () {
        showNewExpenseBottomSheet(context);
      },
      child: Icon(Icons.add),
    ),
    body: OrientationBuilder(
      builder: (context, orientation) {
        if (orientation == Orientation.portrait) {
          return _buildPortraitLayout();
        } else {
          return _buildLandscapeLayout();
        }
      },
    ),
  );
}

Widget _buildPortraitLayout() {
  return SingleChildScrollView(
    child: Column(
      children: [
        // Total
        Container(
          width: double.infinity,
          height: 100,
          margin: EdgeInsets.all(10),
          child: Card(
            elevation: 5,
            child: Center(
              child: Text('EGP' + calculateTotal().toString()),
            ),
          ),
        ),
        // ExListWidget
        ExListWidget(expenseList, deleteExpense),
      ],
    ),
  );
}

Widget _buildLandscapeLayout() {
  return Row(
    children: [
      // Total on the left
      Expanded(
        flex: 1,
        child: Container(
          height: double.infinity,
          margin: EdgeInsets.all(10),
          child: Card(
            elevation: 5,
            child: Center(
              child: Text('EGP' + calculateTotal().toString()),
            ),
          ),
        ),
      ),
      // ExListWidget on the right
      Expanded(
        flex: 2,
        child: ExListWidget(expenseList, deleteExpense),
      ),
    ],
  );
}

}
