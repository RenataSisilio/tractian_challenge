abstract interface class ClientInterface {
  /// Retrieves information from ```endpoint```.
  ///
  /// Returns ideally a ```Map<String, dynamic>``` when ```id != null```
  /// or a ```List<Map<String, dynamic>>``` when ```id == null```.
  Future<List<dynamic>> getAll(String endpoint, {String? id});
}
