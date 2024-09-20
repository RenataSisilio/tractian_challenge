import '../../models/asset.dart';
import '../errors/mapping_errors.dart';

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
            parentId: this["parentId"] ?? this["locationId"],
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
