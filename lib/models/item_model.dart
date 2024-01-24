class ItemModel {
  String count = '';
  String title = '';
  ItemModel(this.count, this.title);


  @override
  String toString() {
    return title;
  }
}