import 'package:get/get.dart';

import '../../models/item_model.dart';

class THomeScreenController extends GetxController {
  RxList<ItemModel> dashboardCounts = RxList([
    ItemModel('34', "Totoal Students"),
    ItemModel('2', "Current Students"),
    ItemModel('25', "Totoal Requests"),
    ItemModel('2', "New Requests"),
  ]);
  
}
