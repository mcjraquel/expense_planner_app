import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Bin {
  final String id;
  final String name;
  double total;

  Bin({
    required this.name,
    required this.total,
  }) : id = uuid.v4();
}
