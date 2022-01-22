class DateUtil {
  static String mmdd(DateTime? date) {
    return '${date?.month}/${date?.day}';
  }
  static String mmddhhMM(DateTime? date) {
    return '${date?.month}/${date?.day} ${date?.hour}:${date?.minute}';
  }
}
