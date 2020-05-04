class BinarySearchTree {
  final Node root;

  BinarySearchTree(String value) : root = Node(value);

  List<String> get sortedData => root.nodes;

  void insert(String input) => root.insert(int.tryParse(input) ?? 0);
}

class Node {
  final String data;

  Node left, right;

  Node(this.data);

  int get _value => int.tryParse(data) ?? 0;

  List<String> get nodes => [
        if (left != null) ...left.nodes,
        data,
        if (right != null) ...right.nodes,
      ];

  void insert(int input) => input <= _value
      ? left == null ? left = Node("$input") : left.insert(input)
      : right == null ? right = Node("$input") : right.insert(input);
}
