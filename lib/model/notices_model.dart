class NoticesModel {
  NoticesModel(this.title, this.subtitle, this.content, this.id);

  final String title;
  final String subtitle;

  final List<String> content;

  final int id;
}

List<NoticesModel> noticesModelList = List.generate(
    15,
    (index) => NoticesModel('Duyuru - ${index + 1}', 'Duyuru metni satır - 1',
        List.generate(index + 1, (index) => 'Satır ${index + 1}'), index));
