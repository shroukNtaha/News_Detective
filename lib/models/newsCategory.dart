class NewsCategory{
  String id;
  String newsId;
  String categoryId;

  NewsCategory({
    this.newsId,
    this.categoryId
  });

  toJson() {
    return {
      "newsId": newsId,
      "categoryId": categoryId,
    };
  }

  NewsCategory.fromMap(snapshot, id)
      : id = id ?? '',
        newsId = snapshot['newsId'] ?? '',
        categoryId = snapshot['categoryId'] ?? '';
        
}