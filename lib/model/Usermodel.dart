
import 'package:json_annotation/json_annotation.dart';
part 'usermodel.g.dart';

@JsonSerializable()
class Usermodel {
  @JsonKey(name: 'id')
  String? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'email')
  String? email;
  @JsonKey(name: 'prpfileImage')
  String? prpfileImage;
  @JsonKey(name: 'phonenumber')
  String? phonenumber;

  Usermodel({this.id, this.name, this.email, this.prpfileImage, this.phonenumber});

  factory Usermodel.fromJson(Map<String, dynamic> json) => _$UsermodelFromJson(json);

  static List<Usermodel> fromList(List<Map<String, dynamic>> list) {
    return list.map(Usermodel.fromJson).toList();
  }

  Map<String, dynamic> toJson() => _$UsermodelToJson(this);
}