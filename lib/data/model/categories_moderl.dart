class CategoriesModel {
  CategoriesModel({this.name, this.nameAr, this.nameFr, this.date, this.id});
  String? id;
  String? name;
  String? nameAr;
  String? nameFr;
  String? date;

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    id = json['categorie_id'].toString();
    name = json['categorie_name'];
    nameAr = json['categorie_name_ar'];
    nameFr = json['categorie_name_fr'];
    date = json['categorie_date'];
  }
}
