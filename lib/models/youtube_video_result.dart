import 'package:FinDit/models/Video.dart';

class YoutubeVideoResult {
  int? totalResults;
  int? resultPerPage;
  String? nextPagetoken;
  List<Video> items;

  YoutubeVideoResult(
      {this.totalResults,
      this.resultPerPage,
      this.nextPagetoken,
      required this.items});
  factory YoutubeVideoResult.fromJson(Map<String, dynamic> json) =>
      YoutubeVideoResult(
          totalResults: json["pageInfo"]["totalResults"],
          resultPerPage: json["pageInfo"]["resultsPerPage"],
          nextPagetoken: json["nextPageToken"] ?? "",
          items: List<Video>.from(json["items"]
              .map((data) => Video.fromJson(data)))); // 리스트를 돌며 파싱해준다.
}
