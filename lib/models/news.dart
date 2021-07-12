class News{
  String id;
  String title;
  String author;
  String content;
  String source;
  String image;
  DateTime date;
  bool label;


  News({
    this.title,
    this.author,
    this.content,
    this.source,
    this.image,
    this.date,
    this.label,
  });

  toJson() {
    return {
      "title": title,
      "author": author,
      "content": content,
      "source": source,
      "image": image,
      "date": date,
      "label": label,
    };
  }

  News.fromMap(snapshot, id)
      : id = id ?? '',
        title = snapshot['title'] ?? '',
        author = snapshot['author'] ?? '',
        content = snapshot['content'] ?? '',
        source = snapshot['source'] ?? '',
        image = snapshot['image'] ?? '',
        date = snapshot['date'].toDate() ?? '',
        label = snapshot['label'] ?? '';
}