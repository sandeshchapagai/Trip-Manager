const baseJsonPath = 'assets/json/';
final kCircularLoaderJson = _getBasePath('CircularLoader.json');
final kHorizontalLoaderJson = _getBasePath('HorizontalLoader.json');
final kBoxNotFoundJson = _getBasePath('BoxNotFound.json');

String _getBasePath(String name) => baseJsonPath + name;
