class Mesa {
  final int? id;
  final String name;

  Mesa(
      { this.id,
      required this.name});

  Mesa.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        name = res["name"];

  Map<String, Object?> toMap() {
    return {'id':id,'name': name,};
  }
}