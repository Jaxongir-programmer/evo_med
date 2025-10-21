class TariffParams {
  final int id;

  const TariffParams({
    this.id = -1,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
    };
  }
}
