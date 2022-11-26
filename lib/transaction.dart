class Transaction {
  final String? id;
  final String? type;
  final String? purpose;
  final String? bin;
  final double? amount;
  final DateTime? date;

  Transaction({
    this.id,
    this.type,
    this.bin,
    this.purpose,
    this.amount,
    this.date,
  });
}
