class ApiRoutes {
  static const String login_Owner = "/api/vendor/login";
  static const String register_Owner = "/api/vendor/register";
  static const String addStore = "/api/stores";
  static const String getAllStore = "/api/stores?type=vendor";
  static const String getEcomStore = "/api/get_ecommer_store";
  static const String deleteRestaurant = "/restaurants/{restaurantId}";
  static const String categoryRestaurant = "/restaurants/categories/all";
  static const String addCategory = "/restaurant/category";
  static const String getCategory = "/api/categories?search=store_id:{storeId}";
  static const String getProductVariant = "/api/product_variants?search=store_id:{storeId}";
  static const String ImportCategory = "/restaurant/category/import";
  static const String ImportItems = "/restaurant/items/import";
  static const String AddItem = "/api/products?search=store_id:{storeId}";
  static const String AddProduct = "/api/products";
  static const String restaurantOrder = "/restaurant/orders";
  static const String storeOrderStatus = "/api/orders/{orderId}/changestatus";
  static const String updateItemStatus = "/restaurant/items/id/{itemId}";
  static const String updateCategoryStatus = "/restaurant/category/id/{categoryId}";
  static const String editRestaurant = "/api/stores/{storeId}";
  static const String editProduct = "/api/products/{productId}";
  static const String editStore = "/api/stores/{storeId}";
  static const String editProductCategory = "/api/categories/{productCategoryId}";
  static const String DeleteItem = "/restaurant/items/id/{itemId}";
  static const String DeleteCategory = "/restaurant/category/id/{categoryId}";
  static const String getPromoCode = "/api/coupons?search=store_id:{storeId}";
  static const String getEcomPromoCode = "/api/get_ecommerce_coupon";
  static const String addOffer = "/api/coupons";
  static const String deleteOffer = "/restaurant/promo/id/{offerId}";
  static const String editOffer = "/api/coupons/{offerId}";
  static const String updateOfferStatus = "/api/coupons/{offerId}";
  static const String getAddon = "/restaurants/id/addon_details/{restId}";
  static const String addAddonCategory = "/restaurant/addon/category";
  static const String editVariant = "/api/product_variants/{variantId}";
  static const String deleteAddonCategory = "/restaurant/addon/category/id/{categoryid}";
  static const String addAddonCategoryItem = "/restaurant/addon/item";
  static const String editAddonCategoryItem = "/restaurant/addon/item/id/{categoryItemId}";
  static const String deleteAddonCategoryItem = "/restaurant/addon/item/id/{categoryItemId}";
  static const String addItemImage = "/image/upload";
  static const String deleteImage = "/image/delete";
  static const String searchItem = "/restaurant/items/search";
  static const String getProfile = "/api/vendor/profile";
  static const String updateProfile = "/api/vendor/update";
  static const String uploadKyc = "/api/vendor/kyc";
  static const String categoryStore = "/api/service_categories?search=service_type_id:1";
  static const String categoryStoreReal = "/api/store_categories?type=vendor";
  static const String typeServiceStore = "/api/service_types";
  static const String addVariant = "/api/product_variants";
  static const String addStoreScheduleTime = "/api/store_timings";
  static const String getStoreOrder = "/api/orders?store_id={storeId}&search_status={orderStatus}&order=ongoin";
  static const String getStoreOrderOngoing = "/api/orders?order=ongoing&store_id={storeId}";
  static const String getStoreOrderPending = "/api/orders?order=pending&store_id={storeId}";
  static const String getStoreOrderCancelled = "/api/orders?order=cancelled&store_id={storeId}";
  static const String getStoreOrderDelivered = "/api/orders?order=delivered&store_id={storeId}";
  static const String uploadFcmToken = "/api/vendor/update";
  static const String getGraphData = "/api/vendor/reports";
  static const String getSetting = "/api/settings";
  static const String getStoreStats = "/api/stores/{storeId}/stats";
  static const String getEcomStoreStats = "/api/stores/{storeId}/ecom_stats";
  static const String sendForgotPasswordEmail = "/api/vendor/password/reset";
  static const String setNewPassword = "/api/vendor/password/change";
  static const String getZone = "/api/zones?lat={lat}&long={long}";
  // static const String subscriptionListApi = "";
}
