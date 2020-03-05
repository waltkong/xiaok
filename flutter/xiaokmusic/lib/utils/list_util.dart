class ListUtil{

  bool in_array(String value , List list){
    for (var item in list) {
      if(item == value){
        return true;
      }
    }
    return false;
  }

}