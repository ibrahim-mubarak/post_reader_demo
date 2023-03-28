// 1
import 'package:build/build.dart';
import 'package:json_converter_generator/json_converter_generator.dart';
// 2
import 'package:source_gen/source_gen.dart';

// 3

// 4
Builder generateConverters(BuilderOptions options) =>
    SharedPartBuilder([JsonConvertersGenerator()], 'json_converter_generator');
