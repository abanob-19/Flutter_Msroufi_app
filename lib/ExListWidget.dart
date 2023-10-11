import 'expense.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class ExListWidget extends StatelessWidget{
List<Expense> l_ex =[];
Function deleteCallback=(){};

ExListWidget(List<Expense> l, Function f) {
this.l_ex = l;
this.deleteCallback = f;
}
// @override
// Widget build(BuildContext context) {
//   return OrientationBuilder(
//     builder: (context, orientation) {
//       if (orientation == Orientation.landscape) {
//         return _buildLandscapeLayout();
//       } else {
//         return _buildPortraitLayout();
//       }
//     },
//   );
// }

// Widget _buildPortraitLayout() {
//   return Container(
//     height: 400, // Set the desired height here
//     child: Expanded(
//       child: ListView.builder(
//         itemBuilder: (ctx, index) {
//           return _buildCard(l_ex[index]);
//         },
//         itemCount: l_ex.length,
//       ),
//     ),
//   );
// }

// Widget _buildLandscapeLayout() {
//   return Row(
//     children: [
//       Expanded(
//         child: ListView.builder(
//           itemBuilder: (ctx, index) {
//             return _buildCard(l_ex[index]);
//           },
//           itemCount: l_ex.length,
//         ),
//       ),
//       // Add any additional landscape-specific widgets here
//     ],
//   );
// }

// Widget _buildCard(Expense item) {
//   return Card(
//     margin: EdgeInsets.all(10),
//     elevation: 5,
//     child: Row(
//       children: [
//         Container(
//           margin: EdgeInsets.all(5),
//           decoration: BoxDecoration(border: Border.all()),
//           padding: EdgeInsets.all(10),
//           child: Center(
//             child: Text(
//               item.amount.toString(),
//               style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//         ),
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 item.title,
//                 style: TextStyle(
//                   fontSize: 15,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               Text(
//                 DateFormat('dd-MM-yyyy').format(item.date),
//                 style: TextStyle(color: Colors.grey),
//               ),
//             ],
//           ),
//         ),
//         Container(
//           child: IconButton(
//             onPressed: () {
//               deleteCallback(item.id);
//             },
//             icon: Icon(Icons.delete),
//             color: Colors.red,
//           ),
//         ),
//       ],
//     ),
//   );
// }

// }
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
@override
Widget build(BuildContext context) {
  return Container(
    height: 400, // Set the desired height here
    child: ListView.builder(
      itemBuilder: (ctx, index) {
        return ListTile(
          contentPadding: EdgeInsets.all(10),
          leading: Container(
            width: 50,
            height: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.green, // Set the circle color to green
              shape: BoxShape.circle,
            ),
            child: Text(
              l_ex[index].amount.toString(),
              style: TextStyle(
                fontSize: 20, // Increase the font size
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          title:Row(children:[ Text(
            l_ex[index].title,
            style: TextStyle(
              fontSize: 30, // Increase the font size
              fontWeight: FontWeight.bold,
            ),
          ), Icon(
                _getCategoryIcon(l_ex[index].category),
                size: 32,
              ),]),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.calendar_today,
                    size: 30, // Set the calendar icon size
                    color: Colors.grey,
                  ),
                  SizedBox(width: 5), // Add spacing between icon and text
                  Text(
                    DateFormat('dd-MM-yyyy').format(l_ex[index].date),
                    style: TextStyle(
                      fontSize: 20, // Increase the font size
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              Text("notes: "+
                l_ex[index].note,
                style: TextStyle(
                  fontSize: 20, // Increase the font size
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () {
                  deleteCallback(l_ex[index].id);
                },
                icon: Icon(Icons.delete, size: 40),
                color: Colors.red,
              ),
            ],
          ),
        );
      },
      itemCount: l_ex.length,
    ),
  );
}


}
