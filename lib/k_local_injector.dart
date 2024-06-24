library k_local_injector;

class LocalInjector {
  static final LocalInjector _instance = LocalInjector._internal();

  factory LocalInjector() {
    return _instance;
  }

  LocalInjector._internal();

  final _dependencies = <Type, Object>{};
  void register<T extends Object>(T instance) {
    _dependencies[T] = instance;
  }

  T get<T extends Object>() {
    final instance = _dependencies[T];
    if (instance == null) {
      throw Exception("No instance registered for type ${T.toString()}");
    }
    return instance as T;
  }
}
