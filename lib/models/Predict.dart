class Predict {
  List<Hero>? hero;
  List<String>? tipeBuild;
  List<String>? emblem;
  List<String>? hasil;

  Predict({this.hero, this.tipeBuild, this.emblem, this.hasil});

  Predict.fromJson(Map<String, dynamic> json) {
    if (json['hero'] != null) {
      hero = <Hero>[];
      json['hero'].forEach((v) {
        hero!.add(new Hero.fromJson(v));
      });
    }
    tipeBuild = json['tipe_build'].cast<String>();
    emblem = json['emblem'].cast<String>();
    hasil = json['hasil'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.hero != null) {
      data['hero'] = this.hero!.map((v) => v.toJson()).toList();
    }
    data['tipe_build'] = this.tipeBuild;
    data['emblem'] = this.emblem;
    data['hasil'] = this.hasil;
    return data;
  }
}

class Hero {
  int? id;
  String? nama;

  Hero({this.id, this.nama});

  Hero.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama'] = this.nama;
    return data;
  }
}