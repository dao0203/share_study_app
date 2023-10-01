String limitTextTenChars(String text) {
  if (text.length > 10) {
    return '${text.substring(0, 10)}...';
  }
  return text;
}
