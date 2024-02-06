class Note {
  String title;
  String description;
  bool isSelected;

  Note({
    required this.title,
    required this.description,
    this.isSelected = false,
  });

  Map toJson() => {
        'title': title,
        'description': description,
        'isSelected': isSelected,
      };

  factory Note.fromJson(Map<String, dynamic> json) => Note(
        title: json["title"],
        description: json["description"],
        isSelected: json["isSelected"],
      );
}
