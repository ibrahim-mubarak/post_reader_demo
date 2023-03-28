import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';

class ToOneJsonConverterTemplate {
  /// typeName, className, converterName, converterType, fromJsonBody, toJsonBody
  final FieldElement field;

  ToOneJsonConverterTemplate(this.field);

  DartType get typeName =>
      (field.type as ParameterizedType).typeArguments.first;

  String? get className => typeName.element!.name;

  String get converterName => '${className}RelToOneConverter';

  String get converterType =>
      'JsonConverter<ToOne<$className>, Map<String, dynamic>>';

  String get fromJsonBody => '''ToOne<$className>(
      target: json == null ? null : $className.fromJson(json),
      targetId: json?['id'] as int?,
    )''';

  String get toJsonBody => 'rel.target?.toJson()';

  String build() {
    return '''
    ToOne<$className> _\$toOne${className}FromJson(Map<String, dynamic>? json) =>
        $fromJsonBody;

    Map<String, dynamic>? _\$toOne${className}ToJson(ToOne<$className> rel) =>
        $toJsonBody;
''';
  }
}
