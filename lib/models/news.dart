class News{
  String id;
  String title;
  String author;
  String content;
  String source;
  String image;
  String category;
  /*DateTime*/String date;
  /*bool*/ String label;


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
        title = snapshot['Title'] ?? '',
        author = snapshot['Author'] ?? '',
        content = snapshot['Content'] ?? '',
        source = snapshot['Source'] ?? '',
        image = snapshot['Image'] ?? '',
        category = snapshot['Category'] ?? '',
        date = snapshot['Date']/*.toDate()*/ ?? '',
        label = snapshot['Label'] ?? '';
}