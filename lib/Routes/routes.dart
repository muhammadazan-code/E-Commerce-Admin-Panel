class TRoutes {
  static const login = "/login";
  static const forgetPassword = "/forget-password";
  static const resetPassword = "/reset-password";
  static const dashboard = "/dashboard";
  static const media = "/media";

  static const banners = "/banners";
  static const createBanner = "/createBanner";
  static const editBanner = '/editBanner';

  static const product = "/product";
  static const createProduct = "/createProduct";
  static const editProduct = "/editProduct";

  static const categories = "/categories";
  static const createCategories = "/createCategories";
  static const editCategories = "/editCategories";

  static const brand = "/brand";
  static const createBrand = "/createBrand";
  static const editBrand = "/editBrand";

  static const customer = "/customer";
  static const customerDetails = "/customerDetails";
  static const createCustomer = "/createCustomer";

  static const orders = "/orders";

  static const firstScreen = "/";
  static const responsivenDesignTutorialScreen = "/responsive-design-tutorial";
  static const secondScreen = "/second-screen/";
  static const secondScreenWithUID = "/second-screen/:userId";

  static List sidebarMenuItems = [dashboard, media];
}
