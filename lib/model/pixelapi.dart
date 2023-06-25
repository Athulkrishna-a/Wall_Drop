import 'dart:convert';

PixelImage pixelImageFromJson(String str) =>
    PixelImage.fromJson(json.decode(str));

String pixelImageToJson(PixelImage data) => json.encode(data.toJson());

class PixelImage {
  int? total;
  int? totalHits;
  List<Hit>? hits;

  PixelImage({
    this.total,
    this.totalHits,
    this.hits,
  });

  factory PixelImage.fromJson(Map<String, dynamic> json) => PixelImage(
        total: json["total"],
        totalHits: json["totalHits"],
        hits: List<Hit>.from(json["hits"].map((x) => Hit.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "totalHits": totalHits,
        "hits": List<dynamic>.from(hits!.map((x) => x.toJson())),
      };
}

class Hit {
  int? id;
  String? type;
  String? tags;
  String? previewUrl;
  String? largeImageUrl;
  String? fullHdurl;
  String? imageUrl;
  int? collections;

  Hit({
    this.id,
    this.type,
    this.tags,
    this.previewUrl,
    this.largeImageUrl,
    this.fullHdurl,
    this.imageUrl,
    this.collections,
  });

  factory Hit.fromJson(Map<String, dynamic> json) => Hit(
        id: json["id"],
        type: json["type"],
        tags: json["tags"],
        previewUrl: json["previewURL"],
        largeImageUrl: json["largeImageURL"],
        fullHdurl: json["fullHDURL"],
        imageUrl: json["imageURL"],
        collections: json["collections"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "tags": tags,
        "previewURL": previewUrl,
        "largeImageURL": largeImageUrl,
        "fullHDURL": fullHdurl,
        "imageURL": imageUrl,
        "collections": collections,
      };
}
