import 'package:json_annotation/json_annotation.dart';

part 'image_generation_request.g.dart';

@JsonSerializable(explicitToJson: true)
class ImageGenerationRequest {
  @JsonKey(name: 'prompt', includeIfNull: false)
  final String prompt;

  @JsonKey(name: 'model', includeIfNull: false)
  final String? model;

  @JsonKey(name: 'n', includeIfNull: false)
  final int? n;

  @JsonKey(name: 'quality', includeIfNull: false)
  final String? quality;

  @JsonKey(name: 'response_format', includeIfNull: false)
  final String? responseFormat;

  @JsonKey(name: 'size', includeIfNull: false)
  final String? size;

  @JsonKey(name: 'style', includeIfNull: false)
  final String? style;

  @JsonKey(name: 'user', includeIfNull: false)
  final String? user;

  ImageGenerationRequest({
    required this.prompt,
    this.model,
    this.n,
    this.quality,
    this.responseFormat,
    this.size,
    this.style,
    this.user,
  });

  factory ImageGenerationRequest.fromJson(Map<String, dynamic> json) =>
      _$ImageGenerationRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ImageGenerationRequestToJson(this);
}
