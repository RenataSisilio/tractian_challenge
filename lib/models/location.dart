final class Location {
  Location({
    required this.id,
    required this.name,
    this.parentId,
  });

  final String id;
  final String name;
  final String? parentId;
}
