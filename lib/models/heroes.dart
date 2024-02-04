class Heroes {
  final int id;
  final String nama;
  final String image;
  final String deskripsi;
  final String createdAt;
  final String updatedAt;

  const Heroes({
    required this.id,
    required this.nama,
    required this.image,
    required this.deskripsi,
    required this.createdAt,
    required this.updatedAt
  });

  factory Heroes.fromJson(Map<String, dynamic> json) {
    return Heroes(
      id: json['id'],
      nama: json['nama'],
      image: json['image'],
      deskripsi: json['deskripsi'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
