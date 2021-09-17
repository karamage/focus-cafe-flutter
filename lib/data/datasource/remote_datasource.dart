abstract class RemoteDatasource {
  initializeApp();
  Future<Map<String, dynamic>?> signInAnonymously();
  Future<Map<String, dynamic>?> getUser(String userId);
  Future<Map<String, dynamic>?> addUser(Map<String, dynamic> params);
  Future<List<Map<String, dynamic>>> getOurDones(DateTime lastDate, int limit);
}
