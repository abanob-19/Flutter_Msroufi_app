enum ExpenseCategory { food, clothing, car }

class Expense {
  String id;
  String title;
  double amount;
  DateTime date;
  ExpenseCategory category;
  String note;
  Expense(
      {required this.id,
      required this.title,
      required this.amount,
      required this.date,
      required this.category,
      required this.note});
}
