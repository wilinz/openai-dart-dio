import 'dart:convert';
import 'dart:typed_data';

import 'package:json_annotation/json_annotation.dart';
import 'package:openai_dart_dio/src/model/chat/function_call.dart';

part 'chat_message.g.dart';

class ChatMessageRole {
  ChatMessageRole._();

  static const String system = "system";
  static const String user = "user";
  static const String assistant = "assistant";
  static const String tool = "tool";
}

class MessageContentType {
  MessageContentType._();

  static const String text = "text";
  static const String imageUrl = "image_url";
}

@JsonSerializable(explicitToJson: true)
class ToolCalls {
  @JsonKey(name: 'id', includeIfNull: false)
  final String id;

  @JsonKey(name: 'type', includeIfNull: false)
  final String type;

  @JsonKey(name: 'function', includeIfNull: false)
  final FunctionCall function;

  ToolCalls({required this.id, required this.type, required this.function});

  factory ToolCalls.fromJson(Map<String, dynamic> json) =>
      _$ToolCallsFromJson(json);

  Map<String, dynamic> toJson() => _$ToolCallsToJson(this);

  @override
  String toString() => 'ToolCalls{id: $id, type: $type, function: $function}';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ToolCalls &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          type == other.type &&
          function == other.function;

  @override
  int get hashCode => id.hashCode ^ type.hashCode ^ function.hashCode;
}

@JsonSerializable(explicitToJson: true)
class ChatMessage {
  @JsonKey(name: 'role', includeIfNull: false)
  final String role;

  /// List<MessageContent> or String
  @JsonKey(name: 'content', includeIfNull: false)
  final dynamic content;

  String? get contentAsString => content as String?;

  List<MessageContent>? get contentAsMessageContentList =>
      content as List<MessageContent>?;

  @JsonKey(name: 'name', includeIfNull: false)
  final String? name;

  /// Assistant message
  @JsonKey(name: 'tool_calls', includeIfNull: false)
  final List<ToolCalls>? toolCalls;

  /// Tool message
  @JsonKey(name: 'tool_call_id', includeIfNull: false)
  final String? toolCallId;

  ChatMessage(
      {required this.role,
      required this.content,
      this.name,
      this.toolCalls,
      this.toolCallId});

  factory ChatMessage.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageFromJson(json);

  Map<String, dynamic> toJson() => _$ChatMessageToJson(this);

  @override
  String toString() => 'ChatMessage{role: $role, content: $content}';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChatMessage &&
          runtimeType == other.runtimeType &&
          role == other.role &&
          content == other.content;

  @override
  int get hashCode => role.hashCode ^ content.hashCode;
}

@JsonSerializable(explicitToJson: true)
class MessageContent {
  /// text or image_url use MessageContentType
  @JsonKey(name: 'type', includeIfNull: false)
  final String type;
  @JsonKey(name: 'text', includeIfNull: false)
  final String? text;
  @JsonKey(name: 'image_url', includeIfNull: false)
  final ImageInfo? imageUrl;

  MessageContent({required this.type, this.text, this.imageUrl});

  factory MessageContent.fromJson(Map<String, dynamic> json) =>
      _$MessageContentFromJson(json);

  Map<String, dynamic> toJson() => _$MessageContentToJson(this);

  @override
  String toString() =>
      'MessageContent{type: $type, text: $text, imageUrl: $imageUrl}';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MessageContent &&
          runtimeType == other.runtimeType &&
          type == other.type &&
          text == other.text &&
          imageUrl == other.imageUrl;

  @override
  int get hashCode => type.hashCode ^ text.hashCode ^ imageUrl.hashCode;
}

@JsonSerializable(explicitToJson: true)
class ImageInfo {
  @JsonKey(name: 'url', includeIfNull: false)
  String url;

  ImageInfo(this.url);

  factory ImageInfo.fromBase64(String base64) {
    return ImageInfo("data:image/jpeg;base64,$base64");
  }

  factory ImageInfo.fromBytes(List<int> bytes) {
    final b64 = base64Encode(Uint8List.fromList(bytes));
    return ImageInfo("data:image/jpeg;base64,$b64");
  }

  static Future<ImageInfo> fromStream(Stream<List<int>> stream) async {
    String base64String = await stream.transform(Base64Encoder()).join();
    return ImageInfo("data:image/jpeg;base64,$base64String");
  }

  factory ImageInfo.fromJson(Map<String, dynamic> json) =>
      _$ImageInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ImageInfoToJson(this);

  @override
  String toString() => 'ImageInfo{url: $url}';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImageInfo &&
          runtimeType == other.runtimeType &&
          url == other.url;

  @override
  int get hashCode => url.hashCode;
}