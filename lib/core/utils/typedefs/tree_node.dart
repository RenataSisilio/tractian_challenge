import '../../../models/named_entity.dart';

typedef TreeNode = (NamedEntity, List);

extension NodeProperties on TreeNode {
  void addChild(TreeNode child) => this.$2.add(child);

  NamedEntity get item => this.$1;

  String get id => this.$1.id;

  String? get parentId => this.$1.parentId;

  List<TreeNode> get children => this.$2.map((e) => e as TreeNode).toList();

  bool get hasChildren => children.isNotEmpty;
}
