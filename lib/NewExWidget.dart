import 'expense.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class NewExWidget extends
StatefulWidget{
final Function callBackFunc;
NewExWidget(
{required this.callBackFunc});

  @override
  State<NewExWidget> createState() => _NewExWidgetState();
}

class _NewExWidgetState extends State<NewExWidget> {
  DateTime selectedDate = DateTime.utc(1970, 1, 1);
    ExpenseCategory? category; 
void openDatePicker() {
showDatePicker( context: context,
initialDate: DateTime.now(),
firstDate: DateTime(2019, 1, 1),
lastDate: DateTime.now())
.then((pickedDate)
{
if (pickedDate == null) {
return;
} // if user presses cancel
// else if he/she presses OK
setState(() {
selectedDate = pickedDate;
});
});
}
final titleValue = TextEditingController();

final amountValue = TextEditingController();
final notes = TextEditingController();

Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Expense title'),
              controller: titleValue,
            ),
            TextField(
  decoration: InputDecoration(labelText: 'Amount in EGP'),
  controller: amountValue,
  keyboardType: TextInputType.number, // Set the keyboard type to numeric
),

            TextField(
              decoration: InputDecoration(labelText: 'notes'),
              controller: notes,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(selectedDate == DateTime.utc(1970, 1, 1)
                      ? 'No Date chosen'
                      : DateFormat.yMd().format(selectedDate)),
                ),
                TextButton(
                  onPressed: () {
                    openDatePicker();
                  },
                  child: Text('Choose date'),
                ),
              ],
            ),
            // Category selection using Radio buttons
            Row(
              children: [
                Text("Category: "),
                for (ExpenseCategory value in ExpenseCategory.values)
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        category = value;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Icon(
                            _getCategoryIcon(value), // Get the icon for the category
                            size: 32,
                            color: category == value ? Colors.blue : Colors.grey,
                          ),
                          Text(
                            value.toString().split('.').last,
                            style: TextStyle(
                              color: category == value ? Colors.blue : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                widget.callBackFunc(
                  t: titleValue.text,
                  a: double.parse(amountValue.text),
                  d: selectedDate,
                  category: category,
                  note: notes.text // Pass the selected category
                );
              },
              child: Text(
                "Submit",
                style: TextStyle(fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }
   IconData _getCategoryIcon(ExpenseCategory category) {
    switch (category) {
      case ExpenseCategory.food:
        return Icons.fastfood; // Replace with the appropriate food icon
      case ExpenseCategory.clothing:
        return Icons.shopping_bag; // Replace with the appropriate clothing icon
      case ExpenseCategory.car:
        return Icons.directions_car; // Replace with the appropriate car icon
      default:
        return Icons.category; // Default icon
    }
  }
}