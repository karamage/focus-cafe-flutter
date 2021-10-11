abstract class RemoteDatasource {
  initializeApp();
  Future<Map<String, dynamic>?> signInAnonymously();
  Future<Map<String, dynamic>?> getUser(String userId);
  Future<Map<String, dynamic>?> addUser(Map<String, dynamic> params);
  Future<Map<String, dynamic>?> updateUser(Map<String, dynamic> params);
  Future<List<Map<String, dynamic>>> getOurDones(DateTime? lastDate, int limit);
  Future<Map<String, dynamic>?> addDone(Map<String, dynamic> params);
  Future<Map<String, dynamic>?> editDone(Map<String, dynamic> params);
}
