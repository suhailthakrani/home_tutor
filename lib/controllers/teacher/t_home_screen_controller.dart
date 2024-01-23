import 'package:get/get.dart';

class THomeScreenController extends GetxController {
  RxList<ItemModel> dashboardCounts = RxList([
    ItemModel('34', "Totoal Students"),
    ItemModel('2', "Current Students"),
    ItemModel('25', "Totoal Requests"),
    ItemModel('2', "New Requests"),
  ]);
  
}


class ItemModel {
  String count = '';
  String title = '';
  ItemModel(this.count, this.title);
}