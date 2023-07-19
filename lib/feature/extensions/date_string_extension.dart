class DateExtension {
  splitString(String date) {
    if (date == '' || date.length < 24) {
      return null;
    }
    return date.substring(0, 24);
  }
}

extension DateStringExtension on String {
  String splitString(String date) {
    if (date == '' || date.length < 24) {
      return '';
    } else {
      var splitted = date.split(' ');
      return '${splitted[2]} ${splitted[3]} ${splitted[4]}';
    }
  }
}
