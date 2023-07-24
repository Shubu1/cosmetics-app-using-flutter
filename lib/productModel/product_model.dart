class ProductModel {
  final int pid;
  final String imgUrl;
  final String title;
  final double price;
  final String shortDescription;
  final String longDescription;
  final int reviews;
  final double ratings;
  final bool isSelected;
  int qty;

  ProductModel(
      {required this.pid,
      required this.imgUrl,
      required this.title,
      required this.price,
      required this.shortDescription,
      required this.longDescription,
      required this.reviews,
      this.isSelected = false,
      this.qty = 1,
      required this.ratings});
  ProductModel copyWith({
    int? pid,
    String? imgUrl,
    String? title,
    double? price,
    String? shortDescription,
    String? longDescription,
    int? reviews,
    bool? isSelected,
    int? qty,
    double? ratings,
  }) {
    return ProductModel(
      pid: pid ?? this.pid,
      imgUrl: imgUrl ?? this.imgUrl,
      title: title ?? this.title,
      price: price ?? this.price,
      shortDescription: shortDescription ?? this.shortDescription,
      longDescription: longDescription ?? this.longDescription,
      reviews: reviews ?? this.reviews,
      isSelected: isSelected ?? this.isSelected,
      qty: qty ?? this.qty,
      ratings: ratings ?? this.ratings,
    );
  }
}
