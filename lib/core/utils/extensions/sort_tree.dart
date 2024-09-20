import '../typedefs/tree_node.dart';

extension Sort on List<TreeNode> {
  List<TreeNode> get sorted {
    sort((a, b) => b.children.length.compareTo(a.children.length));
    return this;
  }
}
