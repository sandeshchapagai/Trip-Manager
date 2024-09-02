import '../../data/models/app_static/app_static_model.dart';
import '../function/splits.dart';

({AppStaticModel? model, List<AppStaticModel> list})? handleSelectedItem({
  String value = "",
  String? id,
}) {
  return value.isNotEmpty
      ? (
          model: AppStaticModel(heading: value, subHeading: id ?? value),
          list: Splits.convertCommaCharacterToList(value: value)
              .map((e) => AppStaticModel(heading: e, subHeading: e))
              .toList()
        )
      : (model: null, list: []);
}
