class HandleEnum {
  // Enumの値を文字列として扱えるようにする
  static enumToString(value) {
    if (value == null) {
      return "none";
    }
    return value.toString().split('.')[1];
  }

  /*
  static CategoryType convertCategory(String str) {
    return CategoryType.values.firstWhere((item) {
      return enumToString(item) == str;
    }, orElse: () => CategoryType.none);
  }
  */
}
