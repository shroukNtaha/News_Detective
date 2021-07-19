class Category{
  String id;
  String name;

  Category({
    this.name,
  });

  toJson() {
    return {
      "name": name,
    };
  }

  Category.fromMap(snapshot, id)
      : id = id ?? '',
        name = snapshot['name'] ?? '';
}