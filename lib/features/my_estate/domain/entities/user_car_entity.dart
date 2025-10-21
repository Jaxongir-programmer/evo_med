import 'package:equatable/equatable.dart';

class UserCarEntity extends Equatable {

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

  const UserCarEntity({
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

  @override
  List<Object?> get props => [
        id,
        model,
        color,
        manufacturingYear,
        autoType,
        bodyNumber,
        engineNumber,
        shassiNumber,
        regNumber,
        regDate,
        division,
        owner,
        ownerAddress,
      ];

}