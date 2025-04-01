import 'package:client/global.dart';
import 'package:json_annotation/json_annotation.dart';

part 'country.g.dart';

@JsonSerializable(explicitToJson: true)
class CountryResponse {
  @JsonKey(name: "success")
  bool success;
  @JsonKey(name: "data")
  Country data;

  CountryResponse({required this.success, required this.data});

  factory CountryResponse.fromJson(Map<String, dynamic> json) =>
      _$CountryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CountryResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Country {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "image")
  String? image;
  @JsonKey(name: 'blur_hash')
  String? blurHash;

  Country({required this.id, this.title, this.image, this.blurHash});

  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);

  Map<String, dynamic> toJson() => _$CountryToJson(this);

  String get imageUrl {
    if (image == null) {
      return '${Env.apiUrl}/img/temp.jpg';
    }
    return '${MyAppUrl.countryImage}/$image';
  }

  String get imageUrlMini {
    if (image == null) {
      return '${Env.apiUrl}/img/temp.jpg';
    }
    return '${MyAppUrl.countryImageMini}/$image';
  }
}
