class Routes {
  static Future<String> get initialRoute async {
    return login;
  }

  static const addProduct = '/add-product';
  static const detailProduct = '/detail-product';
  static const login = '/login';
  static const home = '/home';
  static const products = '/products';
}
