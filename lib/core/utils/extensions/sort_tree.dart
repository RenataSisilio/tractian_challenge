import '../typedefs/tree_node.dart';

extension Sort on List<TreeNode> {
  void sortByChildNumber() => sort((a, b) => b.children.length.compareTo(a.children.length));
}
