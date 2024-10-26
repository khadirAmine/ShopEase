class FavoriteModel {
  FavoriteModel({this.id, this.itemId, this.userId});
  int? id, itemId, userId;

  FavoriteModel.fromJson(Map<String, dynamic> json) {
    id = json['favorite_id'];
    itemId = json['favorite_item_id'];
    userId = json['favorite_user_id'];
  }
}
