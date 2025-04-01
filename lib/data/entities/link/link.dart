import 'package:json_annotation/json_annotation.dart';

part 'link.g.dart';

@JsonSerializable(explicitToJson: true)
class Link {
  @JsonKey(name: "url")
  String? url;
  @JsonKey(name: "label")
  String label;
  @JsonKey(name: "active")
  bool active;

  Link({
    required this.url,
    required this.label,
    required this.active,
  });

  factory Link.fromJson(Map<String, dynamic> json) => _$LinkFromJson(json);

  Map<String, dynamic> toJson() => _$LinkToJson(this);
}
