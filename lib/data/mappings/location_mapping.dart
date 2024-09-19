import '../../models/location.dart';
import '../errors/mapping_errors.dart';

extension Mapping on Location {
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'parentId': parentId,
    };
  }
}

extension LocationMapping on Map<String, dynamic> {
  Location toLocation() {
    return switch (this) {
      {
        "id": String id,
        "name": String name,
        "parentId": String? parentId,
      } =>
        Location(
          id: id,
          name: name,
          parentId: parentId,
        ),
      _ => throw InvalidDataFormatError(
          data: this,
          expectedFormat:
              '{"id": String, "name": String, "parentId": String | null}',
        ),
    };
  }
}
