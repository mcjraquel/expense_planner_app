class Transaction {
  final String id;
  final String type;
  final String purpose;
  final String bin;
  final double amount;
  final DateTime date;

  Transaction({
    required this.id,
    required this.type,
    required this.bin,
    required this.purpose,
    required this.amount,
    required this.date,
  });
}
