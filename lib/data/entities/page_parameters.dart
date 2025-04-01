import 'package:json_annotation/json_annotation.dart';

part 'page_parameters.g.dart';

@JsonSerializable(explicitToJson: true)
class Page {
  @JsonKey(name: "size")
  int size;
  @JsonKey(name: "number")
  int number;
  @JsonKey(name: "total_count")
  int totalCount;
  @JsonKey(name: "order_by")
  String? orderBy;
  @JsonKey(name: "desc")
  bool desc;

  Page({
    this.size = 0,
    this.number = 1,
    this.totalCount = 0,
    this.orderBy,
    this.desc = false,
  }) {
    number = (number) < 1 ? 1 : number;
    size = (size) < 1 ? 10 : size;
  }

  factory Page.fromJson(Map<String, dynamic> json) => _$PageFromJson(json);

  Map<String, dynamic> toJson() => _$PageToJson(this);
}
