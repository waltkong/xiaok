
class ValidateUtil{

  /// 验证手机号
  bool isPhone(String value){
    // 正则匹配手机号
    RegExp exp = RegExp(r'^((13[0-9])|(14[0-9])|(15[0-9])|(16[0-9])|(17[0-9])|(18[0-9])|(19[0-9]))\d{8}$');
    if (value.isEmpty) {
      return false;
    }else if (!exp.hasMatch(value)) {
      return false;
    }
    return true;

  }

  bool isUsername(String value){
    if (value.isEmpty) {
      return false;
    }else if(value.trim().length<2 || value.trim().length>18){
      return false;
    }
    return true;
  }

  /// 验证密码
  bool isPassword(String value){
    if (value.isEmpty) {
      return false;
    }else if(value.trim().length<6 || value.trim().length>18){
      return false;
    }
    return true;
  }


  /// 检查是否是邮箱格式
  bool isEmail(String input) {
    final String regexEmail = "^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*\$";
    if (input == null || input.isEmpty) return false;
    return new RegExp(regexEmail).hasMatch(input);
  }


}