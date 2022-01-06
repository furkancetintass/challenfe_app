class FavoritesModel {
  final String title;
  final int id;

  FavoritesModel({required this.title, required this.id});
}

List<FavoritesModel> favoritesModelList =
    List.generate(facilities.length, (index) => FavoritesModel(title: facilities[index] + ' Tesis', id: index));

const List<String> facilities = [
  'Mavi',
  'Turuncu',
  'Siyah',
  'Sarı',
  'Lacivert',
  'Beyaz',
  'Mor',
  'Gri',
  'Pembe',
  'Kırmızı',
  'Yeşil',
  'Mavi',
  'Koyu Mavi'
];
