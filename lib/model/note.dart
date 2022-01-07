import 'dart:convert';

class Note {
  String noteName;
  String note;
  Note({required this.note, required this.noteName});

  Map<String, dynamic> toMap() {
    return {
      'noteName': noteName,
      'note': note,
    };
  }

  factory Note.fromMap(data) {
    Map<String, dynamic> map = Map<String, dynamic>.from(data);
    return Note(
      noteName: map['noteName'] ?? '',
      note: map['note'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Note.fromJson(String source) => Note.fromMap(json.decode(source));
}
