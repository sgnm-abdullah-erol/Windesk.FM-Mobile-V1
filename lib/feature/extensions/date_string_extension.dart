class DateExtension {
  splitString(String date) {
    if (date == '' || date.length < 24) {
      return null;
    }
    return date.substring(0, 24);
  }
}
