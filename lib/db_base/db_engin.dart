import 'dart:typed_data';

class Food {
  final int id;
  final Uint8List imageBytes;
  final String source;
  final double rate;
  final int type;
  final DateTime date;

  Food(
      {required this.id,
      required this.imageBytes,
      required this.source,
      required this.rate,
      required this.type,
      required this.date});

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "imageBytes": imageBytes,
      "source":source,
      "rate": rate,
      "type": type,
      "date": date.toIso8601String(),
    };
  }

  factory Food.formMap(Map<String, dynamic> map) {
    return Food(
        id: map['id'],
        imageBytes: map['imageBytes'] as Uint8List,
        source: map['source'],
        rate: map['rate'],
        type: map['type'],
        date: DateTime.parse(map['date']));
  }

  @override
  String toString() {
    // TODO: implement toString
    return super.toString();
  }
}
