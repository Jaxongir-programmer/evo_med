part of 'packages_bloc.dart';

sealed class PackagesEvent {}

class GetPackagesEvent extends PackagesEvent {}

class BuyPackageEvent extends PackagesEvent {
  final int tariffId;

  BuyPackageEvent({required this.tariffId});
}

class GetUserPackagesEvent extends PackagesEvent {}
