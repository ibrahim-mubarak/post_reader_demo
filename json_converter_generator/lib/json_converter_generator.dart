library json_converter_generator;

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:build/build.dart';
import 'package:json_converter_generator/to_one_converter_template.dart';
import 'package:json_converter_generator_annotation/generate_converters.dart';
import 'package:json_converter_generator/to_many_converter_template.dart';
import 'package:source_gen/source_gen.dart';

class JsonConvertersGenerator
    extends GeneratorForAnnotation<GenerateConverters> {
  @override
  generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    if (element is! ClassElement) {
      throw InvalidGenerationSourceError(
          'The @GenerateConverters annotation can only be used on classes.',
          element: element,
          todo: 'Remove the annotation or apply it to a class.');
    }

    var generatedToManyFieldsConverter = processToManyFields(element);
    var generatedToOneFieldsConverter = processToOneFields(element);

    return "$generatedToManyFieldsConverter\n\n$generatedToOneFieldsConverter";
  }

  String processToManyFields(ClassElement element) {
    List<FieldElement> toManyFields = element.fields.where((field) {
      var parameterizedType = field.type as ParameterizedType;
      var isToMany = parameterizedType.element?.name == 'ToMany';
      return isToMany;
    }).toList();

    if (toManyFields.isEmpty) {
      // If there are no fields of type ToMany<T>, there is nothing to generate
      return '';
    }

    final converterClasses = toManyFields.map((FieldElement field) {
      return ToManyJsonConverterTemplate(field).build();
    });

    return converterClasses.join('\n');
  }

  String processToOneFields(ClassElement element) {
    List<FieldElement> toOneFields = element.fields.where((field) {
      var parameterizedType = field.type as ParameterizedType;
      var isToMany = parameterizedType.element?.name == 'ToOne';
      return isToMany;
    }).toList();

    if (toOneFields.isEmpty) {
      // If there are no fields of type ToOne<T>, there is nothing to generate
      return '';
    }

    final converterClasses = toOneFields.map((FieldElement field) {
      return ToOneJsonConverterTemplate(field).build();
    });

    return converterClasses.join('\n');
  }
}
