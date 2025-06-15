import 'package:get/get.dart';

class HomeController extends GetxController {
  var selectedIndex = 0.obs;

final RxList<String> boxNames = <String>[
  'All',
  'Grocery',
  'Pharmacy',
  'Electronics',
  'Books',
  'Clothing',
  'Pet Supplies',
  'Toys',
  'Furniture',
  'Gifts',
].obs;


  void selectBox(int index) {
    selectedIndex.value = index;
  }
}
