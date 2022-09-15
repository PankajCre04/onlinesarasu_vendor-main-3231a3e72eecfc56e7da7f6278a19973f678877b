import 'dart:io';

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';
import 'package:sooooperbusiness/model/StoreResponse.dart';
import 'package:sooooperbusiness/model/StoreTypeResponse.dart';
import 'package:sooooperbusiness/model/allresponse/addrestaurantresponse.dart';
import 'package:sooooperbusiness/model/allresponse/allrestaurantresponse.dart';
import 'package:sooooperbusiness/model/allresponse/categoryresponse.dart';
import 'package:sooooperbusiness/model/AddStoreResponse.dart';
import 'package:sooooperbusiness/model/allresponse/updaterestaurantstatusrestaurantresponse.dart';
import 'package:sooooperbusiness/model/ecom_store_model.dart';
import 'package:sooooperbusiness/model/graphDataResponse.dart';
import 'package:sooooperbusiness/model/kycResponce.dart';
import 'package:sooooperbusiness/api/api_routes.dart';
import 'package:sooooperbusiness/model/more/inventory/addcategoryresponse.dart';
import 'package:sooooperbusiness/model/more/inventory/importcategoryresponse.dart';
import 'package:sooooperbusiness/model/more/inventory/productCategoryResponse.dart';
import 'package:sooooperbusiness/model/allresponse/ownerloginresponse.dart';
import 'package:sooooperbusiness/model/more/inventory/getaddonresponse.dart';
import 'package:sooooperbusiness/model/more/inventory/getcategoryresponse.dart';
import 'package:sooooperbusiness/model/more/inventory/addeditaddoncategoryitemresponse.dart';
import 'package:sooooperbusiness/model/more/inventory/addeditaddoncategoryresponse.dart';
import 'package:sooooperbusiness/model/more/inventory/addimageresponse.dart';
import 'package:sooooperbusiness/commons/constant.dart';
import 'package:sooooperbusiness/model/more/inventory/addproductresponse.dart';
import 'package:sooooperbusiness/model/more/inventory/deleteresponse.dart';
import 'package:sooooperbusiness/model/more/inventory/editaddonresponse.dart';
import 'package:sooooperbusiness/model/more/inventory/add_variant_response.dart';
import 'package:sooooperbusiness/model/more/inventory/getitemresponse.dart';
import 'package:sooooperbusiness/model/more/inventory/importItemsresponse.dart';
import 'package:sooooperbusiness/model/more/inventory/updatecategorystatusresponse.dart';
import 'package:sooooperbusiness/model/more/inventory/updateitemstatusresponse.dart';
import 'package:sooooperbusiness/model/more/inventory/variantResponse.dart';
import 'package:sooooperbusiness/model/more/offers/addpromocoderesponse.dart';
import 'package:sooooperbusiness/model/more/offers/getpromocoderesponse.dart';
import 'package:sooooperbusiness/model/order/get_store_order_response.dart';
import 'package:sooooperbusiness/model/order/getrestaurantorderresponse.dart';
import 'package:sooooperbusiness/model/order/modifyrestaurantorderstatusresponse.dart';
import 'package:sooooperbusiness/model/pos/itemsearchresponse.dart';
import 'package:sooooperbusiness/model/profileResponse.dart';
import 'package:sooooperbusiness/model/registrationResponse.dart';
import 'package:sooooperbusiness/model/schedule_response.dart';
import 'package:sooooperbusiness/model/send_email_response.dart';
import 'package:sooooperbusiness/model/settings_reponse.dart';
import 'package:sooooperbusiness/model/storeCategoryModel.dart';
import 'package:sooooperbusiness/model/storeRealCategoryResponse.dart';
import 'package:sooooperbusiness/model/store_stats_response.dart';

import '../model/store_category_response.dart';
import '../model/zone_response.dart';

part 'api_client.g.dart';

//@RestApi(baseUrl: "https://ancient-taiga-65737.herokuapp.com/v1/")
// @RestApi(baseUrl: "http://server.ssoftwares.in:3000/v1")
// @RestApi(baseUrl: "https://admin.wedun.in")
@RestApi(baseUrl: "https://onlinesarasu.ssdemo.xyz")
// @RestApi(baseUrl: "http://10.0.2.2:3000/v1")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String? baseUrl}) {
    dio.options = BaseOptions(receiveTimeout: 5000 * 2, connectTimeout: 10000, headers: {
      "Accept": "application/json",
    }); //"Authorization" :"Bearer ${Constant.AccessToken}",});
    dio..interceptors.addAll([PrettyDioLogger(requestBody: true, requestHeader: true, responseBody: true)]);
    return _ApiClient(dio, baseUrl: baseUrl);
  }

  @POST(ApiRoutes.login_Owner)
  @FormUrlEncoded()
  Future<RegistrationResponse> loginOwner(@Field("email") String mobile, @Field("password") String password);

  @POST(ApiRoutes.sendForgotPasswordEmail)
  @FormUrlEncoded()
  Future<SendEmailResponse> sendForgotPasswordEmail(
    @Field("email") String mobile,
  );

  @POST(ApiRoutes.setNewPassword)
  @FormUrlEncoded()
  Future<SendEmailResponse> setNewPassword(
    @Field("otp") String mobile,
    @Field('password') String password,
    @Field("password_confirmation") String confirmPassword,
  );

  @POST(ApiRoutes.login_Owner)
  @FormUrlEncoded()
  Future<Ownerloginresponse> loginOwnerByPhone(@Field("mobile") String mobile, @Field("passwordLess") bool passwordLess);

  @MultiPart()
  @POST(ApiRoutes.register_Owner)
  Future<Ownerloginresponse> registerOwner(
      @Part(name: "name") String name,
      @Part(name: "phone") String phone,
      @Part(name: "email") String email,
      @Part(name: "password") String password,
      @Part(name: "business_type") String business_type,
      @Part(name: "latitude") String latitude,
      @Part(name: "longitude") String longitude,
      @Part(name: "cf1") String cf1,
      @Part(name: "cf2") String cf2,
      @Part(name: "cf3") String cf3,
      @Part(name: "bank_name") String bank_name,
      @Part(name: "ac_no") String ac_no,
      @Part(name: "ifsc_code") String ifsc_code,
      @Part(name: "address") String address,
      @Part(name: "pan_no") String pan_no,
      @Part(name: "aadhar_card_img") File aadhar_card_img,
      @Part(name: "pan_card_img") File pan_card_img,
      @Part(name: "address_proof_img") File address_proof_img,
      @Part(name: "cancel_cheque_img") File cancel_cheque_img,
      @Part(name: "gst_certificate_img") File gst_certificate_img,
      @Part(name: "profile_img") File profile_img);

  @MultiPart()
  @POST(ApiRoutes.addStore)
  Future<AddStoreResponse> addStore(
    @Header("Content-Type") String contentType,
    @Part(name: "admin_id") String adminId,
    @Part(name: "store_categories[]") List<String> storeCategories,
    @Part(name: "service_category_id") String serviceCategoryId,
    @Part(name: "name") String name,
    @Part(name: "description") String description,
    @Part(name: "image") File image,
    @Part(name: "latitude") String lat,
    @Part(name: "longitude") String long,
    @Part(name: "address") String address,
    @Part(name: "delivery_range") String deliveryRange,
    @Part(name: "mobile") String mobile,
    @Part(name: "email") String email,
    @Part(name: "zone[]") List<String> selectedZoneID,
  );

  @MultiPart()
  @POST(ApiRoutes.editStore)
  Future<dynamic> editStore(
    @Path("storeId") String storeId,
    @Part(name: "_method") String method,
    @Part(name: "admin_id") String adminId,
    @Part(name: "store_categories[]") List<String> storeCategories,
    @Part(name: "service_category_id") String serviceCategoryId,
    @Part(name: "name") String name,
    @Part(name: "description") String description,
    @Part(name: "image") File image,
    @Part(name: "latitude") String lat,
    @Part(name: "longitude") String long,
    @Part(name: "address") String address,
    @Part(name: "delivery_range") String deliveryRange,
    @Part(name: "mobile") String mobile,
    @Part(name: "email") String email,
    @Part(name: "zone[]") List<String> selectedZoneID,
  );

  @MultiPart()
  @POST(ApiRoutes.addStoreScheduleTime)
  Future<ScheduleResponse> addStoreSchedulTime(
    @Part(name: "store_id") String storeId,
    @Part(name: "day[]") List<String> dayList,
    @Part(name: "open[]") List<String> openTimeList,
    @Part(name: "close[]") List<String> closeTimeList,
  );

  @MultiPart()
  @PATCH(ApiRoutes.editRestaurant)
  Future<Addrestaurantresponse> EditRestaurant(
    @Path("restaurantId") String restaurantId,
    @Part(name: "_ownerId") String ownerId,
    @Part(name: "name") String name,
    @Part(name: "description") String description,
    @Part(name: "avgDeliveryTime") String avgDeliveryTime,
    @Part(name: "aprx_price_for_two") String aprx_price_for_two,
    @Part(name: "full_address") String full_address,
    @Part(name: "pin_code") String pin_code,
    @Part(name: "landmark") String landmark,
    // @Part(name: "coordinates[]") String latitude,
    // @Part(name: "coordinates[]") String longitude,
    @Part(name: "coordinates[]") List<String> coordinates,
    @Part(name: "is_featured") String is_featured,
    @Part(name: "veg_only") String veg_only,
    @Part(name: "min_order_price") String min_order_price,
    @Part(name: "delivery_radius") String delivery_radius,
    @Part(name: "delivery_charge_type") String delivery_charge_type,
    @Part(name: "fixed_delivery_charge") String fixed_delivery_charge,
    @Part(name: "base_delivery_charge") String base_delivery_charge,
    @Part(name: "base_delivery_distance") String base_delivery_distance,
    @Part(name: "extra_delivery_charge") String extra_delivery_charge,
    @Part(name: "extra_delivery_distance") String extra_delivery_distance,
    @Part(name: "dine_in_enabled") String dine_in_enabled,
    @Part(name: "take_away_enabled") String take_away_enabled,
    @Part(name: "delivery_enabled") String delivery_enabled,
    @Part(name: "open_time") String open_time,
    @Part(name: "closing_time") String closing_time,
    @Part(name: "gallery_image") List<File> gallery_image,
    @Part(name: "category") List<String> category,
    @Part(name: "image") File image,
    @Part(name: "restaurant_phone") String restaurant_phone,
    @Part(name: "restaurant_phone_secondary") String restaurant_phone_secondary,
  );

  @DELETE(ApiRoutes.deleteRestaurant)
  Future<Ownerloginresponse> deleteRestaurant(@Path("restaurantId") String restaurantId);

  @GET(ApiRoutes.categoryStore)
  Future<StoreCategoryResponse> getStoreCategory();

  @GET(ApiRoutes.categoryStoreReal)
  Future<StoreRealCategoryResponse> getStoreRealCategory();

  @GET(ApiRoutes.typeServiceStore)
  Future<StoreServiceTypeResponse> getStoreServiceType();

  @GET(ApiRoutes.getAllStore)
  Future<StoreResponse> getAllStore();

  @GET(ApiRoutes.getEcomStore)
  Future<EcomStoreModel> getEcomStore();

  //@Path("ownerId") String ownerId,
  @GET(ApiRoutes.getSetting)
  Future<SettingsResponse> getSettings();

  // @POST(ApiRoutes.addCategory)
  // @MultiPart()
  // Future<AddCategoryResponse> AddCategories(
  //     @Part(name: "name") String name,
  //     @Part(name: "is_hidden") String is_hidden,
  //     @Part(name: "restaurant_id") String restaurant_id,
  //     @Part(name: "parent") String parent);

  @GET(ApiRoutes.getCategory)
  Future<ProductCategoryResponse> GetProductCategories(
    @Path("storeId") String storeId,
  );

  @GET(ApiRoutes.getProductVariant)
  Future<VariantResponse> GetProductVariant(
    @Path("storeId") String storeId,
  );

  // @GET(ApiRoutes.getCategory)
  // Future<GetCategoryResponse> GetAllCategories(
  //     @Query("restaurant_id") String restId, @Query("sortBy") String desc,
  //     @Query("limit") String limit);

  @POST(ApiRoutes.ImportCategory)
  @MultiPart()
  Future<ImportCategoryResponse> ImportCategories(
    @Part(name: "restaurant_id") String name,
    @Part(name: "file") File image,
  );

  @POST(ApiRoutes.ImportItems)
  @MultiPart()
  Future<ImportItemsResponse> ImportItems(
    @Part(name: "restaurant_id") String name,
    @Part(name: "file") File image,
  );

  @POST(ApiRoutes.AddItem)
  @MultiPart()
  Future<AddProductResponse> AddProductWithoutImage(
    @Part(name: "store_id") String StoreId,
    @Part(name: "product_type") String productType,
    @Part(name: "name") String name,
    @Part(name: "description") String description,
    // @Part(name: "image") File productImage,
    @Part(name: "unit") String productUnit,
    @Part(name: "price") String productPrice,
    @Part(name: "discount_price") String productDiscountPrice,
    @Part(name: "category_id") String categoryId,
    @Part(name: "sku") String proudctQuantity,
    @Part(name: "product_tags") String productTag,
    @Part(name: "active") String isActive,
    @Part(name: "opening_time") String openTime,
    @Part(name: "closing_time") String closingTime,
  );

  @POST(ApiRoutes.AddProduct)
  @MultiPart()
  Future<AddProductResponse> AddProduct(
    @Part(name: "store_id") String storeId,
    @Part(name: "product_type") String productType,
    @Part(name: "name") String name,
    @Part(name: "description") String description,
    @Part(name: "image") File productImage,
    @Part(name: "unit") String productUnit,
    @Part(name: "price") String productPrice,
    @Part(name: "discount_price") String productDiscountPrice,
    @Part(name: "category_id") String categoryId,
    @Part(name: "sku") String proudctQuantity,
    @Part(name: "product_tags") String productTag,
    @Part(name: "active") String isActive,
    @Part(name: "opening_time") String openTime,
    @Part(name: "closing_time") String closingTime,
    @Part(name: "coupons[]") List<String> coupons,
  );

  @POST(ApiRoutes.getCategory)
  @MultiPart()
  Future<AddProductCategoryResponse> AddProductCategory(
    @Path("storeId") String storeId,
    @Part(name: "name") String productCategoryName,
    // @Part(name: "image") File productCategoryImage,
    @Part(name: "store_id") String store_id,
    @Part(name: "parent") String parentId,
  );
  @GET(ApiRoutes.AddItem)
  Future<GetProductResponse> GetItem(
    @Path("storeId") String restId,
  );

  @GET(ApiRoutes.getStoreOrder)
  Future<GetStoreOrderResponse> GetRestaurantOrder(
    @Path("storeId") String storeId,
    @Path("orderStatus") String orderStatus,
    @Query("sortBy") String desc,
    @Query("page") int page,
    @Query("limit") int limit,
  );

  @GET(ApiRoutes.getStoreOrderOngoing)
  Future<GetStoreOrderResponse> getRestaurantOrderOngoing(
    @Path("storeId") String storeId,
    @Path("orderStatus") String orderStatus,
    @Query("sortBy") String desc,
    @Query("page") int page,
    @Query("limit") int limit,
  );

  @GET(ApiRoutes.getStoreOrderPending)
  Future<GetStoreOrderResponse> getRestaurantOrderPending(
    @Path("storeId") String storeId,
    @Path("orderStatus") String orderStatus,
    @Query("sortBy") String desc,
    @Query("page") int page,
    @Query("limit") int limit,
  );
  @GET(ApiRoutes.getStoreOrderCancelled)
  Future<GetStoreOrderResponse> getRestaurantOrderCancelled(
    @Path("storeId") String storeId,
    @Path("orderStatus") String orderStatus,
    @Query("sortBy") String desc,
    @Query("page") int page,
    @Query("limit") int limit,
  );
  @GET(ApiRoutes.getStoreOrderDelivered)
  Future<GetStoreOrderResponse> getRestaurantOrderDelivered(
    @Path("storeId") String storeId,
    @Path("orderStatus") String orderStatus,
    @Query("sortBy") String desc,
    @Query("page") int page,
    @Query("limit") int limit,
  );
  @GET(ApiRoutes.getZone)
  Future<GetZoneResponse> GetZone(
    @Path("lat") double lat,
    @Path("long") double long,
  );

  @POST(ApiRoutes.storeOrderStatus)
  @FormUrlEncoded()
  Future<ModifyRestaurantOrderStatusResponse> ModifyStoreOrderStatus(
    @Path("orderId") String orderId,
    @Field("status") String status,
    @Field("preparation_time") String preparationTime,
  );

  @GET(ApiRoutes.AddItem)
  Future<GetProductResponse> GetItemByCategory(
    @Query("restaurant_id") String restId,
    @Query("item_categories") String categoryId,
    @Query("sortBy") String desc,
    @Query("page") int page,
  );

  @PATCH(ApiRoutes.updateItemStatus)
  @FormUrlEncoded()
  Future<UpdateItemStatusResponse> UpdateItemStatus(
    @Path("itemId") String itemId,
    @Field("is_hidden") String is_hidden,
  );

  @PATCH(ApiRoutes.updateCategoryStatus)
  @FormUrlEncoded()
  Future<UpdateCategoryStatusResponse> UpdateCategoryStatus(
    @Path("categoryId") String categoryId,
    @Field("is_hidden") String is_hidden,
  );

  @POST(ApiRoutes.editRestaurant)
  @FormUrlEncoded()
  Future<Addrestaurantresponse> UpdateStoreStatus(
    @Path("storeId") String storeId,
    @Field("_method") String method,
    @Field("is_open") String is_open,
  );

  @POST(ApiRoutes.editProduct)
  @FormUrlEncoded()
  @FormUrlEncoded()
  Future<AddProductResponse> EditProductWithoutImage(
    @Path("productId") String productId,
    @Part(name: "_method") String method,
    @Part(name: "store_id") String StoreId,
    @Part(name: "product_type") String productType,
    @Part(name: "name") String name,
    @Part(name: "description") String description,
    // @Part(name: "image") File productImage,
    @Part(name: "unit") String productUnit,
    @Part(name: "price") String productPrice,
    @Part(name: "discount_price") String productDiscountPrice,
    @Part(name: "category_id") String categoryId,
    @Part(name: "sku") String proudctQuantity,
    @Part(name: "product_tags") String productTag,
    @Part(name: "active") String isActive,
    @Part(name: "opening_time") String openTime,
    @Part(name: "closing_time") String closingTime,
  );

  @POST(ApiRoutes.editProduct)
  @FormUrlEncoded()
  @FormUrlEncoded()
  Future<AddProductResponse> EditProduct(
    @Path("productId") String productId,
    @Part(name: "_method") String method,
    @Part(name: "store_id") String StoreId,
    @Part(name: "product_type") String productType,
    @Part(name: "name") String name,
    @Part(name: "description") String description,
    @Part(name: "image") File productImage,
    @Part(name: "unit") String productUnit,
    @Part(name: "price") String productPrice,
    @Part(name: "discount_price") String productDiscountPrice,
    @Part(name: "category_id") String categoryId,
    @Part(name: "sku") String proudctQuantity,
    @Part(name: "product_tags") String productTag,
    @Part(name: "active") String isActive,
    @Part(name: "opening_time") String openTime,
    @Part(name: "closing_time") String closingTime,
  );

  @POST(ApiRoutes.editProduct)
  @FormUrlEncoded()
  Future<AddProductResponse> EditProductStatus(
    @Path("productId") String productId,
    @Part(name: "_method") String method,
    @Part(name: "active") String isActive,
  );

  @POST(ApiRoutes.editProduct)
  @FormUrlEncoded()
  Future<AddProductResponse> EditProductSKU(
    @Path("productId") String productId,
    @Part(name: "_method") String method,
    @Part(name: "sku") String SKU,
  );

  @POST(ApiRoutes.editProductCategory)
  @FormUrlEncoded()
  Future<AddProductCategoryResponse> EditProductCategory(
    @Path("productCategoryId") String productCategoryId,
    @Part(name: "_method") String method,
    @Part(name: "name") String productCategoryName,
    // @Part(name: "image") File productCategoryImage,
    @Part(name: "store_id") String store_id,
    @Part(name: "parent") String parentId,
  );

  // @PATCH(ApiRoutes.updateCategoryStatus)
  // @FormUrlEncoded()
  // Future<AddCategoryResponse> EditCategories(
  //   @Path("categoryId") String categoryId,
  //   @Field("name") String name,
  //   @Field("is_hidden") String is_hidden,
  // );

  @DELETE(ApiRoutes.DeleteItem)
  Future<DeleteResponse> DeleteItem(@Path("itemId") String itemId);

  @DELETE(ApiRoutes.DeleteCategory)
  Future<DeleteResponse> DeleteCategory(@Path("categoryId") String categoryId);

  @GET(ApiRoutes.getPromoCode)
  Future<GetPromoCodeResponse> GetPromoCode(
    @Path("storeId") String storeId,
  );

  @GET(ApiRoutes.getEcomPromoCode)
  Future<GetPromoCodeResponse> GetEcomPromoCode();

  @POST(ApiRoutes.addOffer)
  @MultiPart()
  Future<AddPromoCodeResponse> AddOffer(
    @Part(name: "store_id") String storeId,
    @Part(name: "image") File couponImage,
    @Part(name: "code") String couponCode,
    @Part(name: "description") String couponDescription,
    @Part(name: "max_use_per_user") String maxUsePerUser,
    @Part(name: "min_cart_value") String minCartValue,
    @Part(name: "start_date") String couponStartDate,
    @Part(name: "end_date") String couponEndDate,
    @Part(name: "discount_type") String couponDiscountType,
    @Part(name: "discount_value") String couponDiscountValue,
    @Part(name: "max_discount_value") String couponMaxDiscountValue,
    @Part(name: "active") String active,
  );

  @DELETE(ApiRoutes.deleteOffer)
  Future<DeleteResponse> DeleteOffer(@Path("offerId") String offerId);

  @POST(ApiRoutes.editOffer)
  @MultiPart()
  Future<AddPromoCodeResponse> EditOffer(
    @Path("offerId") String offerId,
    @Part(name: "_method") String method,
    @Part(name: "store_id") String storeId,
    @Part(name: "image") File couponImage,
    @Part(name: "code") String couponCode,
    @Part(name: "description") String couponDescription,
    @Part(name: "max_use_per_user") String maxUsePerUser,
    @Part(name: "min_cart_value") String minCartValue,
    @Part(name: "start_date") String couponStartDate,
    @Part(name: "end_date") String couponEndDate,
    @Part(name: "discount_type") String couponDiscountType,
    @Part(name: "discount_value") String couponDiscountValue,
    @Part(name: "max_discount_value") String couponMaxDiscountValue,
    @Part(name: "active") String active,
  );

  @GET(ApiRoutes.getAddon)
  Future<GetAddonCategoryResponse> GetAddon(
    @Path("restId") String restId,
  );

  @POST(ApiRoutes.addVariant)
  @MultiPart()
  Future<AddVariantResponse> AddVariant(
    @Part(name: "product_id") String productId,
    @Part(name: "name") String variantName,
    @Part(name: "price") String variantPrice,
    @Part(name: "discount_price") String variantDiscountPrice,
    @Part(name: "sku") String proudctQuantity,
    @Part(name: "image") File variantImage,
  );

  @POST(ApiRoutes.addVariant)
  @MultiPart()
  Future<AddVariantResponse> AddVariantWithoutImage(
    @Part(name: "product_id") String productId,
    @Part(name: "name") String variantName,
    @Part(name: "price") String variantPrice,
    @Part(name: "discount_price") String variantDiscountPrice,
    @Part(name: "sku") String proudctQuantity,
  );

  @POST(ApiRoutes.editVariant)
  @MultiPart()
  Future<AddVariantResponse> EditVariant(
    @Path("variantId") String variantId,
    @Part(name: "_method") String method,
    @Part(name: "product_id") String productId,
    @Part(name: "name") String variantName,
    @Part(name: "price") String variantPrice,
    @Part(name: "discount_price") String variantDiscountPrice,
    @Part(name: "sku") String proudctQuantity,
    @Part(name: "image") File variantImage,
  );

  @POST(ApiRoutes.editVariant)
  @MultiPart()
  Future<AddVariantResponse> EditVariantWithoutImage(
    @Path("variantId") String variantId,
    @Part(name: "_method") String method,
    @Part(name: "product_id") String productId,
    @Part(name: "name") String variantName,
    @Part(name: "price") String variantPrice,
    @Part(name: "discount_price") String variantDiscountPrice,
    @Part(name: "sku") String proudctQuantity,
  );

  @POST(ApiRoutes.editVariant)
  @MultiPart()
  Future<AddVariantResponse> EditVariantStatus(
    @Path("variantId") String variantId,
    @Part(name: "_method") String method,
    @Part(name: "active") String active,
  );

  @POST(ApiRoutes.addAddonCategoryItem)
  @FormUrlEncoded()
  Future<AddEditAddonCategoryItemResponse> AddAddonCategoryItem(
    @Field("name") String name,
    @Field("price") String price,
    @Field("_categoryId") String categoryId,
  );

  @PATCH(ApiRoutes.editAddonCategoryItem)
  @FormUrlEncoded()
  Future<EditAddonResponse> EditAddonCategoryItem(
    @Path("categoryItemId") String categoryItemId,
    @Field("name") String name,
    @Field("price") String price,
    @Field("_categoryId") String categoryId,
  );

  @DELETE(ApiRoutes.deleteAddonCategory)
  Future<DeleteResponse> DeleteAddonCategory(@Path("categoryid") String category);

  @DELETE(ApiRoutes.deleteAddonCategoryItem)
  Future<DeleteResponse> DeleteAddonCategoryItem(@Path("categoryItemId") String categoryItemId);

  @POST(ApiRoutes.updateOfferStatus)
  @MultiPart()
  Future<AddPromoCodeResponse> UpdateOfferStatus(
    @Path("offerId") String offerId,
    @Part(name: "_method") String method,
    @Part(name: "active") String isActive,
  );

  @POST(ApiRoutes.addItemImage)
  @MultiPart()
  Future<AddImageResponse> AddItemImage(
    @Part(name: "type") String type,
    @Part(name: "images") List<File> image,
  );

  @POST(ApiRoutes.deleteImage)
  @FormUrlEncoded()
  Future<DeleteResponse> DeleteImage(
    @Field("images") String image,
  );

  @POST(ApiRoutes.searchItem)
  @FormUrlEncoded()
  Future<ItemSearchResponse> searchFoodItem(
    @Field("restaurantId") String restaurantId,
    @Field("name") String searchKeyWord,
  );

  //dunzo code start form here

  @POST(ApiRoutes.register_Owner)
  @FormUrlEncoded()
  Future<RegistrationResponse> register(
    @Field("name") String name,
    @Field("mobile") String phone,
    @Field("email") String email,
    @Field("password") String password,
    @Field("fcm_token") String fcm_token,
    @Field("lat") double latitude,
    @Field("long") double longitude,
    @Field("is_ecom") int valueType,
    @Field("subscription_id") int sub_id,
    // subscription field
  );

  @GET(ApiRoutes.getProfile)
  Future<ProfileResponse> GetProfile(@Header("Authorization") String bearerToken);

  @POST(ApiRoutes.updateProfile)
  @FormUrlEncoded()
  Future<ProfileResponse> uploadBankDetails(
      // @Header("Authorization") String bearerToken,
      @Header("Accept") String json,
      @Field("bank_name") String bankName,
      @Field("account_no") String accountNumber,
      @Field("account_name") String accountName,
      @Field("ifsc_code") String ifscColde,
      @Field("branch_name") String branchName);

  @POST(ApiRoutes.uploadKyc)
  @MultiPart()
  Future<KycResponse> uploadKyc(
    @Header("Authorization") String bearerToken,
    @Part(name: "doc_type") String type,
    @Part(name: "photo") File image,
  );

  @POST(ApiRoutes.uploadFcmToken)
  @MultiPart()
  Future<dynamic> uploadFcmToken(
    @Header("Authorization") String bearerToken,
    @Part(name: "fcm_token") String FcmToken,
  );

  @POST(ApiRoutes.getGraphData)
  @FormUrlEncoded()
  Future<GraphDataResponse> getGraphData(@Field("start_date") String startDate, @Field("end_date") String endDate, @Field("type") String type, @Field("interval") String interval);

  @GET(ApiRoutes.getStoreStats)
  Future<StoreStatsResponse> getStoreStats(
    @Path("storeId") String storeId,
  );
  @GET(ApiRoutes.getEcomStoreStats)
  Future<StoreStatsResponse> getEomStoreStats(
    @Path("storeId") String storeId,
  );
}
