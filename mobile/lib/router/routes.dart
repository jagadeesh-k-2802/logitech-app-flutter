/// List of all routes in the application
/// by default it is name of route
/// if ends with 'Path' it is a path not a name
class Routes {
  static const splash = "splash";
  static const chooseApplication = 'choose-applicaiton';
  static const customerAuth = "customerAuth";
  static const driverAuth = "driverAuth";
  static const forgotPassword = "forgot-password";
  static const changePassword = "change-password";
  static const customerHome = "customer-home";
  static const customerOrders = "customer-orders";
  static customerOrderDetailPath(String id) => "/customer-order-detail/$id";
  static const placeOrder = "place-order";
  static const orderConfirmed = "order-confirmation";
  static ratingPath(String user, String order) => "/rating/$user/$order";
  static driverProfilePath(String id) => "/driver-profile/$id";
  static const driverHome = "driver-home";
  static orderAcceptDetailPath(String id) => "/order-accept/$id";
  static orderManageDetailPath(String id) => "/order-manage/$id";
  static const driverOrders = "driver-orders";
  static const customerNotification = "customer-notifications";
  static const driverNotification = "driver-notifications";
  static const customerAccount = 'customer-account';
  static const driverAccount = 'driver-account';
  static const customerProfile = 'customer-profile';
  static const driverProfile = 'driver-profile';
}
