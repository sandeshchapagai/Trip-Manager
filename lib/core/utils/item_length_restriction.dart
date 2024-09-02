bool restrictItemLength({required var actualLength, var targetLength = 5}) =>
    int.parse("${actualLength ?? 0}") >= targetLength;
