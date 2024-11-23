abstract class IThemeLanguageCacheManager<T> {
  Future<T> load();
  Future<void> save(T value);
}
