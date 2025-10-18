class StoryModel {
  // String? title;
  String? image;
  String? createdAt;
  List<StoryItems>? items;
  StoryType? type;
  StoryModel({this.image, this.createdAt, this.items, this.type});
}

class StoryItems {
  String? image;
  String? title;
  String? subtitle;
  StoryItems({this.image, this.title, this.subtitle});
}

enum StoryType { user, marketplace }
