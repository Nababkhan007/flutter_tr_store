import 'dart:convert';

List<PostModel> postModelFromJson(String response) => List<PostModel>.from(json.decode(response).map((data) => PostModel.fromJson(data)));

String postModelToJson(List<PostModel> data) => json.encode(List<dynamic>.from(data.map((data) => data.toJson())));

class PostModel {
  final int? id;
  final String? title;
  final String? content;
  final String? image;
  final String? thumbnail;
  final int? userId;

  PostModel({
    this.id,
    this.title,
    this.content,
    this.image,
    this.thumbnail,
    this.userId,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        id: json["id"] ?? 0,
        title: json["title"] ?? "",
        content: json["content"] ?? "",
        image: json["image"] ?? "",
        thumbnail: json["thumbnail"] ?? "",
        userId: json["userId"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? 0,
        "title": title ?? "",
        "content": content ?? "",
        "image": image ?? "",
        "thumbnail": thumbnail ?? "",
        "userId": userId ?? 0,
      };
}
