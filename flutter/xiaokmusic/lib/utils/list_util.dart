class ListUtil{

  bool in_array(String value , List list){
    for (var item in list) {
      if(item == value){
        return true;
      }
    }
    return false;
  }

  bool in_map_list(String value , String key,List list){
    for (var item in list) {
      if(item[key] == value){
        return true;
      }
    }
    return false;
  }

}