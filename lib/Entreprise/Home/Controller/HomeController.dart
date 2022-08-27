import 'package:get/get.dart';

class HomeController extends GetxController{

  var listOfCandidat = [].obs;

  void changeFav(int idCandidate , int isFav){


  }
  void addToList(var list){
    listOfCandidat.clear();
    listOfCandidat.add(list);

  }


}