import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum TransactionType { inflow, outflow }

class Transaction {
  final String id;
  final TransactionType type;
  final String purpose;
  final String bin;
  final double amount;
  final DateTime date;

  Transaction({
    required this.type,
    required this.bin,
    required this.purpose,
    required this.amount,
    required this.date,
  }) : id = uuid.v4();
}
