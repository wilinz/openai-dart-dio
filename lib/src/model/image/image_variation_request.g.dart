// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_variation_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageVariationRequest _$ImageVariationRequestFromJson(
        Map<String, dynamic> json) =>
    ImageVariationRequest(
      model: json['model'] as String?,
      n: (json['n'] as num?)?.toInt(),
      responseFormat: json['response_format'] as String?,
      size: json['size'] as String?,
      user: json['user'] as String?,
    );

Map<String, dynamic> _$ImageVariationRequestToJson(
    ImageVariationRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('model', instance.model);
  writeNotNull('n', instance.n);
  writeNotNull('response_format', instance.responseFormat);
  writeNotNull('size', instance.size);
  writeNotNull('user', instance.user);
  return val;
}
