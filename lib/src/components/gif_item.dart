class GifItem {
  String? type;
  String? id;
  String? url;
  String? embedUrl;
  String? username;
  String? title;
  String? rating;
  Images? images;

  GifItem(
      {this.type,
      this.id,
      this.url,
      this.embedUrl,
      this.username,
      this.title,
      this.rating,
      this.images});

  GifItem.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    id = json['id'];
    url = json['url'];
    embedUrl = json['embed_url'];
    username = json['username'];
    title = json['title'];
    rating = json['rating'];
    images =
        json['images'] != null ? new Images.fromJson(json['images']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['id'] = this.id;
    data['url'] = this.url;
    data['embed_url'] = this.embedUrl;
    data['username'] = this.username;
    data['title'] = this.title;
    data['rating'] = this.rating;
    if (this.images != null) {
      data['images'] = this.images!.toJson();
    }
    return data;
  }
}

class Images {
  Original? original;
  PreviewGif? previewGif;

  Images({this.original, this.previewGif});

  Images.fromJson(Map<String, dynamic> json) {
    original = json['original'] != null
        ? new Original.fromJson(json['original'])
        : null;
    previewGif = json['preview_gif'] != null
        ? new PreviewGif.fromJson(json['preview_gif'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.original != null) {
      data['original'] = this.original!.toJson();
    }
    if (this.previewGif != null) {
      data['preview_gif'] = this.previewGif!.toJson();
    }
    return data;
  }
}

class Original {
  String? height;
  String? width;
  String? size;
  String? url;
  String? mp4Size;
  String? mp4;
  String? webpSize;
  String? webp;
  String? frames;
  String? hash;

  Original(
      {this.height,
      this.width,
      this.size,
      this.url,
      this.mp4Size,
      this.mp4,
      this.webpSize,
      this.webp,
      this.frames,
      this.hash});

  Original.fromJson(Map<String, dynamic> json) {
    height = json['height'];
    width = json['width'];
    size = json['size'];
    url = json['url'];
    mp4Size = json['mp4_size'];
    mp4 = json['mp4'];
    webpSize = json['webp_size'];
    webp = json['webp'];
    frames = json['frames'];
    hash = json['hash'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['height'] = this.height;
    data['width'] = this.width;
    data['size'] = this.size;
    data['url'] = this.url;
    data['mp4_size'] = this.mp4Size;
    data['mp4'] = this.mp4;
    data['webp_size'] = this.webpSize;
    data['webp'] = this.webp;
    data['frames'] = this.frames;
    data['hash'] = this.hash;
    return data;
  }
}

class PreviewGif {
  String? height;
  String? width;
  String? size;
  String? url;

  PreviewGif({this.height, this.width, this.size, this.url});

  PreviewGif.fromJson(Map<String, dynamic> json) {
    height = json['height'];
    width = json['width'];
    size = json['size'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['height'] = this.height;
    data['width'] = this.width;
    data['size'] = this.size;
    data['url'] = this.url;
    return data;
  }
}
