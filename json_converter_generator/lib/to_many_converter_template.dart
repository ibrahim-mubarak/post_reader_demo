import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';

class ToManyJsonConverterTemplate {
  /// typeName, className, converterName, converterType, fromJsonBody, toJsonBody
  final FieldElement field;

  ToManyJsonConverterTemplate(this.field);

  DartType get typeName =>
      (field.type as ParameterizedType).typeArguments.first;

  String? get className => typeName.element!.name;

  String get fromJsonBody =>
      'ToMany<$className>(items: json.map((e) => $className.fromJson(e)).toList())';

  String get toJsonBody => 'rel.map(($className obj) => obj.toJson()).toList()';

  String build() {
    return '''
    ToMany<$className> _\$ToMany${className}FromJson(List<Map<String, dynamic>> json) =>
        $fromJsonBody;

    List<Map<String, dynamic>> _\$ToMany${className}ToJson(ToMany<$className> rel) =>
        $toJsonBody;
''';
  }
}
