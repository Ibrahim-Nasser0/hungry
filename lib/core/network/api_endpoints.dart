class ApiEndpoints {
  //Auth & Profile End Points
  static const String login = '/login';
  static const String register = '/register';
  static const String logout = '/logout';
  static const String getProfile = '/profile';
  static const String updateProfile = '/update-profile';

  //Category End Points
  static const String fetchAllCategory = '/categories';

  //Products End Points
  static const String fetchProductByID = '/products/1';
  static const String fetchProductByCategory = '/products';
  static const String fetchProductSearch = '/products';

  //Favorite End Points
  static const String toggleFavorites = '/toggle-favorite';
  static const String fetchUserFav = '/favorites';

  //Product Option End Points
  static const String fetchToppings = '/toppings';
  static const String fetchSideOption = '/side-options';

  //Order End Points
  static const String saveOrder = '/orders';
  static const String fetchOrders = '/orders';
  static const String fetchOrdersDetailsByID = '/orders/4';

  //Cart End Points
  static const String addToCart = '/cart/add';
  static const String fetchCart = '/cart';
  static const String deleteItemFromCart = '/cart/remove/24';
}
