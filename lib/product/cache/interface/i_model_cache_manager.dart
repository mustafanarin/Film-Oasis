abstract class IModelCacheManager<T> {
  Future<void> toggleFavorite(T model);
  Future<List<T>?> getFavorites();
}
