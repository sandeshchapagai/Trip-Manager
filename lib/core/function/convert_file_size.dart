class ConvertFileSize {
  static num toMB({required int fileSize}) {
    num sizeInMb = fileSize / (1024 * 1024);
    return sizeInMb;
  }
}
