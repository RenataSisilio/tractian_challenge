import '../../models/asset.dart';
import '../errors/mapping_errors.dart';

extension Mapping on Asset {
  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'locationId': locationId,
        'parentId': parentId,
        'sensorId': sensorId,
        'sensorType': sensorType,
        'status': status,
        'gatewayId': gatewayId,
      };
}

extension AssetMapping on Map<String, dynamic> {
  Asset toAsset() => switch (this) {
        {
          "id": String id,
          "name": String name,
        } =>
          Asset(
            id: id,
            name: name,
            sensorType: this["sensorType"],
            locationId: this["locationId"],
            parentId: this["parentId"],
            status: this["status"],
            sensorId: this["sensorId"],
            gatewayId: this["gatewayId"],
          ),
        _ => throw InvalidDataFormatError(
            data: this,
            expectedFormat: '{"id": String, "name": String}',
          ),
      };
}
