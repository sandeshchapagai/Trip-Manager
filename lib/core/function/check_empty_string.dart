String checkEmptyString({required String? text, required String placeHolder}) {
  return text == "" ? placeHolder : text ?? "";
}
