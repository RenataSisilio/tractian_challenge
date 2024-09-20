import 'named_entity.dart';

final class Location extends NamedEntity {
  Location({
    required super.id,
    required super.name,
    super.parentId,
  });
}
