class StoryModel {
  int id;
  String name;
  String story;

  StoryModel({required this.id, required this.name, required this.story});

  factory StoryModel.fromJson(Map<String, dynamic> json) {
    return StoryModel(id: json['id'], name: json['name'], story: json['story']);
  }
}
