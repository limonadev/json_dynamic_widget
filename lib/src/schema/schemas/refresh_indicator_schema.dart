import 'package:json_theme/json_theme_schemas.dart';

class RefreshIndicatorSchema {
  static const id =
      'https://peifferinnovations.com/json_dynamic_widget/schemas/refresh_indicator';

  static final schema = {
    r'$schema': 'http://json-schema.org/draft-06/schema#',
    r'$id': '$id',
    'type': 'object',
    'title': 'RefreshIndicatorBuilder',
    'additionalProperties': false,
    'required': [
      'onRefresh',
    ],
    'properties': {
      'backgroundColor': SchemaHelper.objectSchema(ColorSchema.id),
      'color': SchemaHelper.objectSchema(ColorSchema.id),
      'displacement': SchemaHelper.numberSchema,
      'onRefresh': SchemaHelper.stringSchema,
      'notificationPredicate': SchemaHelper.stringSchema,
      'semanticsLabel': SchemaHelper.stringSchema,
      'semanticsValue': SchemaHelper.stringSchema,
      'strokeWidth': SchemaHelper.numberSchema,
    }
  };
}
