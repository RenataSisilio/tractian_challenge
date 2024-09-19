class Asset {
  Asset({
    required this.id,
    required this.name,
    this.locationId,
    this.parentId,
    this.sensorId,
    this.sensorType,
    this.status,
    this.gatewayId,
  });

  final String id;
  final String name;
  final String? locationId;
  final String? parentId;
  final String? sensorId;
  final String? sensorType;
  final String? status;
  final String? gatewayId;
}
