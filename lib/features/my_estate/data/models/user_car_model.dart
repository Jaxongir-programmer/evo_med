import 'package:json_annotation/json_annotation.dart';
import 'package:evo_med/features/my_estate/domain/entities/user_car_entity.dart';

part 'user_car_model.g.dart';

@JsonSerializable(createToJson: false, fieldRename: FieldRename.snake)
class UserCarModel {
  final int id;
  final String model;
  final String color;
  final int manufacturingYear;
  final String autoType;
  final String bodyNumber;
  final String engineNumber;
  final String shassiNumber;
  final String regNumber;
  final String regDate;
  final String division;
  final String owner;
  final String ownerAddress;

  const UserCarModel({
    this.id = 0,
    this.model = '',
    this.color = '',
    this.manufacturingYear = 0,
    this.autoType = '',
    this.bodyNumber = '',
    this.engineNumber = '',
    this.shassiNumber = '',
    this.regNumber = '',
    this.regDate = '',
    this.division = '',
    this.owner = '',
    this.ownerAddress = '',
  });

  factory UserCarModel.fromJson(Map<String, dynamic> json) => _$UserCarModelFromJson(json);

  UserCarEntity toEntity() {
    return UserCarEntity(
      id: id,
      model: model,
      color: color,
      manufacturingYear: manufacturingYear,
      autoType: autoType,
      bodyNumber: bodyNumber,
      engineNumber: engineNumber,
      shassiNumber: shassiNumber,
      regNumber: regNumber,
      regDate: regDate,
      division: division,
      owner: owner,
      ownerAddress: ownerAddress,
    );
  }
}
