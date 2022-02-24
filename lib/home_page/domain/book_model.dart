class BookModel {
  String? kind;
  int? totalItems;
  List<Items>? items;

  BookModel({this.kind, this.totalItems, this.items});

  BookModel.fromJson(Map<String, dynamic> json) {
    kind = json['kind'];
    totalItems = json['totalItems'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['kind'] = this.kind;
    data['totalItems'] = this.totalItems;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  String? kind;
  String? id;
  String? etag;
  String? selfLink;
  VolumeInfo? volumeInfo;

  Items({this.kind, this.id, this.etag, this.selfLink, this.volumeInfo});

  Items.fromJson(Map<String, dynamic> json) {
    kind = json['kind'];
    id = json['id'];
    etag = json['etag'];
    selfLink = json['selfLink'];
    volumeInfo = json['volumeInfo'] != null
        ? new VolumeInfo.fromJson(json['volumeInfo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['kind'] = this.kind;
    data['id'] = this.id;
    data['etag'] = this.etag;
    data['selfLink'] = this.selfLink;
    if (this.volumeInfo != null) {
      data['volumeInfo'] = this.volumeInfo!.toJson();
    }
    return data;
  }
}

class VolumeInfo {
  String? title;
  String? subtitle;
  String? publisher;
  String? publishedDate;
  String? description;
  int? pageCount;
  String? printType;
  String? maturityRating;
  bool? allowAnonLogging;
  String? contentVersion;
  String? language;
  String? previewLink;
  String? infoLink;
  String? canonicalVolumeLink;
  int? averageRating;
  int? ratingsCount;

  VolumeInfo(
      {this.title,
      this.subtitle,

      this.publisher,
      this.publishedDate,
      this.description,
      this.pageCount,
      this.printType,
      this.maturityRating,
      this.allowAnonLogging,
      this.contentVersion,
      this.language,
      this.previewLink,
      this.infoLink,
      this.canonicalVolumeLink,
      this.averageRating,
      this.ratingsCount});

  VolumeInfo.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    subtitle = json['subtitle'];

    publisher = json['publisher'];
    publishedDate = json['publishedDate'];
    description = json['description'];
    pageCount = json['pageCount'];
    printType = json['printType'];
    maturityRating = json['maturityRating'];
    allowAnonLogging = json['allowAnonLogging'];
    contentVersion = json['contentVersion'];
    language = json['language'];
    previewLink = json['previewLink'];
    infoLink = json['infoLink'];
    canonicalVolumeLink = json['canonicalVolumeLink'];
    averageRating = json['averageRating'];
    ratingsCount = json['ratingsCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['subtitle'] = this.subtitle;

    data['publisher'] = this.publisher;
    data['publishedDate'] = this.publishedDate;
    data['description'] = this.description;
    data['pageCount'] = this.pageCount;
    data['printType'] = this.printType;

    data['maturityRating'] = this.maturityRating;
    data['allowAnonLogging'] = this.allowAnonLogging;
    data['contentVersion'] = this.contentVersion;
    data['language'] = this.language;
    data['previewLink'] = this.previewLink;
    data['infoLink'] = this.infoLink;
    data['canonicalVolumeLink'] = this.canonicalVolumeLink;
    data['averageRating'] = this.averageRating;
    data['ratingsCount'] = this.ratingsCount;
    return data;
  }
}
