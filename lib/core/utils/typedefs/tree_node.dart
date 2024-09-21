import '../../../models/asset.dart';
import '../../../models/named_entity.dart';

typedef TreeNode = (NamedEntity, List);

extension NodeProperties on TreeNode {
  void addChild(TreeNode child) => this.$2.add(child);

  NamedEntity get item => this.$1;

  String get id => this.$1.id;

  String? get parentId => this.$1.parentId;

  List<TreeNode> get children => this.$2.map((e) => e as TreeNode).toList();

  /// Whether this node has children or not.
  bool get hasChildren => children.isNotEmpty;

  List<NamedEntity> get energyChildren =>
      _anyChild((e) => e is Asset && e.isEnergySensor);

  List<NamedEntity> get alertChildren =>
      _anyChild((e) => e is Asset && e.hasAlert);

  List<NamedEntity> searchByName(String text) =>
      _anyChild((e) => e.name.toLowerCase().contains(text.toLowerCase()));

  List<NamedEntity> _anyChild(bool Function(NamedEntity) condition) {
    if (condition(item)) {
      return [item];
    }
    final result = <NamedEntity>[];
    for (var child in children) {
      final childResult = child._anyChild(condition);
      if (childResult.isNotEmpty) {
        if (!result.contains(item)) {
          result.add(item);
        }
        result.addAll(childResult);
      }
    }
    return result;
  }
}
