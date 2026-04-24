class BorrowedItemModel {
  final String id;
  final String code;
  final String name;
  final DateTime borrowDate;
  final DateTime dueDate;
  final String status;

  BorrowedItemModel({
    required this.id,
    required this.code,
    required this.name,
    required this.borrowDate,
    required this.dueDate,
    required this.status,
  });
}
