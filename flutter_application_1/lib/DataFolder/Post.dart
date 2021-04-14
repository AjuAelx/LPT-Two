class DataModelClass {
  String offerNearPhoto,
      offerNearshopName,
      todaysOfferPhoto,
      categorySellerCount,
      categoryName;

  DataModelClass(
      {this.offerNearPhoto,
      this.offerNearshopName,
      this.todaysOfferPhoto,
      this.categorySellerCount,
      this.categoryName});

  factory DataModelClass.fromJson(Map<String, dynamic> json) {
    return DataModelClass(
        offerNearPhoto: json['photo'],
        offerNearshopName: json['offerNearshopName'],
        todaysOfferPhoto: json['photo'],
        categorySellerCount: json['sellerCount'],
        categoryName: json['name']);
  }
}
