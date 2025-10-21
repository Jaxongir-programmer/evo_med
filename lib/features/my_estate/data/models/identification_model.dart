import 'package:json_annotation/json_annotation.dart';
import 'package:evo_med/features/my_estate/domain/entities/identification_entity.dart';

part 'identification_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, createToJson: false)
class IdentificationModel {
  final String identifier;
  final String firstName;
  final String lastName;
  final String middleName;
  final String birthDate;
  final String gender;
  final String permanentAddress;

  const IdentificationModel({
    this.identifier = '',
    this.firstName = '',
    this.lastName = '',
    this.middleName = '',
    this.birthDate = '',
    this.gender = '',
    this.permanentAddress = '',
  });

  factory IdentificationModel.fromJson(Map<String, dynamic> json) => _$IdentificationModelFromJson(json);

  IdentificationEntity toEntity() {
    return IdentificationEntity(
      identifier: identifier,
      firstName: firstName,
      lastName: lastName,
      middleName: middleName,
      birthDate: birthDate,
      gender: gender,
      permanentAddress: permanentAddress,
    );
  }
}
