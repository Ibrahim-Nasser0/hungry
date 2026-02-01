class ApiEndpoints {
  //Auth & Profile End Points
  static const String login = '/login';
  static const String register = '/register';
  static const String logout = '/logout';
  static const String getProfile = '/profile';
  static const String updateProfile = '/update-profile';

  //Category End Points
  static const String getAllCategory = '/categories';

  //Products End Points
  static const String getProductByID = '/products/1';
  static const String getProductByCategory = '/products';
  static const String getProductSearch = '/products';

  //Favorite End Points
  static const String addOrRemoveFav = '/toggle-favorite';
  static const String getUserFav = '/favorites';

  //Product Option End Points
  static const String toppings = '/toppings';
  static const String sideOption = '/side-options';

  //Order End Points
  static const String saveOrder = '/orders';
  static const String getOrders = '/orders';
  static const String getOrdersDetailsByID = '/orders/4';

  //Cart End Points
  static const String addToCart = '/cart/add';
  static const String getCart = '/cart';
  static const String delItemFromCart = '/cart/remove/24';
}
