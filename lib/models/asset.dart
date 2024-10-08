import 'named_entity.dart';

final class Asset extends NamedEntity {
  Asset({
    required super.id,
    required super.name,
    super.parentId,
    this.sensorId,
    this.sensorType,
    this.status,
    this.gatewayId,
  });

  final String? sensorId;
  final String? sensorType;
  final String? status;
  final String? gatewayId;

  bool get isComponent => sensorType != null;

  bool get isEnergySensor => sensorType == 'energy';

  bool get hasAlert => status == 'alert';
}
