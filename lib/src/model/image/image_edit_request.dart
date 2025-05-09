import 'package:equatable_annotations/equatable_annotations.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'image_edit_request.g.dart';

@CopyWith()
@generateProps
@JsonSerializable(explicitToJson: false)
class ImageEditRequest  with EquatableMixin {
  @JsonKey(
    name: 'image',
    includeToJson: false,
    includeFromJson: false,
  )
  final MultipartFile? image;
  @JsonKey(name: 'prompt', includeIfNull: false)
  final String prompt;
  @JsonKey(
    name: 'mask',
    includeToJson: false,
    includeFromJson: false,
  )
  final MultipartFile? mask;
  @JsonKey(name: 'model', includeIfNull: false)
  final String? model;
  @JsonKey(name: 'n', includeIfNull: false)
  final int? n;
  @JsonKey(name: 'size', includeIfNull: false)
  final String? size;
  @JsonKey(name: 'response_format', includeIfNull: false)
  final String? responseFormat;
  @JsonKey(name: 'user', includeIfNull: false)
  final String? user;

  ImageEditRequest({
    this.image,
    required this.prompt,
    this.mask,
    this.model,
    this.n,
    this.size,
    this.responseFormat,
    this.user,
  });

  Map<String, dynamic> toMap() => _$ImageEditRequestToJson(this)
    ..['image'] = image
    ..['mask'] = mask;

  @override
  List<Object?> get props => _$props;
}
