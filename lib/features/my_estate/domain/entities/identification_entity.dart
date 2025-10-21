import 'package:equatable/equatable.dart';

class IdentificationEntity extends Equatable {
  final String identifier;
  final String firstName;
  final String lastName;
  final String middleName;
  final String birthDate;
  final String gender;
  final String permanentAddress;

  const IdentificationEntity({
    this.identifier = '',
    this.firstName = '',
    this.lastName = '',
    this.middleName = '',
    this.birthDate = '',
    this.gender = '',
    this.permanentAddress = '',
  });

  @override
  List<Object?> get props => [
        identifier,
        firstName,
        lastName,
        middleName,
        birthDate,
        gender,
        permanentAddress,
      ];
}
