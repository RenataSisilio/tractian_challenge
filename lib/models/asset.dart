import 'named_entity.dart';

final class Asset extends NamedEntity {
  Asset({
    required super.id,
    required super.name,
    this.locationId,
    this.parentId,
    this.sensorId,
    this.sensorType,
    this.status,
    this.gatewayId,
  });

  final String? locationId;
  final String? parentId;
  final String? sensorId;
  final String? sensorType;
  final String? status;
  final String? gatewayId;
}
