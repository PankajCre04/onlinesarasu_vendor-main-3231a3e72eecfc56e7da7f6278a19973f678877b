// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ApiClient implements ApiClient {
  _ApiClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://onlinesarasu.ssdemo.xyz';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<RegistrationResponse> loginOwner(mobile, password) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {'email': mobile, 'password': password};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<RegistrationResponse>(Options(
                method: 'POST',
                headers: <String, dynamic>{},
                extra: _extra,
                contentType: 'application/x-www-form-urlencoded')
            .compose(_dio.options, '/api/vendor/login',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = RegistrationResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<SendEmailResponse> sendForgotPasswordEmail(mobile) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {'email': mobile};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<SendEmailResponse>(Options(
                method: 'POST',
                headers: <String, dynamic>{},
                extra: _extra,
                contentType: 'application/x-www-form-urlencoded')
            .compose(_dio.options, '/api/vendor/password/reset',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = SendEmailResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<SendEmailResponse> setNewPassword(
      mobile, password, confirmPassword) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {
      'otp': mobile,
      'password': password,
      'password_confirmation': confirmPassword
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<SendEmailResponse>(Options(
                method: 'POST',
                headers: <String, dynamic>{},
                extra: _extra,
                contentType: 'application/x-www-form-urlencoded')
            .compose(_dio.options, '/api/vendor/password/change',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = SendEmailResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<Ownerloginresponse> loginOwnerByPhone(mobile, passwordLess) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {'mobile': mobile, 'passwordLess': passwordLess};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Ownerloginresponse>(Options(
                method: 'POST',
                headers: <String, dynamic>{},
                extra: _extra,
                contentType: 'application/x-www-form-urlencoded')
            .compose(_dio.options, '/api/vendor/login',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Ownerloginresponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<Ownerloginresponse> registerOwner(
      name,
      phone,
      email,
      password,
      business_type,
      latitude,
      longitude,
      cf1,
      cf2,
      cf3,
      bank_name,
      ac_no,
      ifsc_code,
      address,
      pan_no,
      aadhar_card_img,
      pan_card_img,
      address_proof_img,
      cancel_cheque_img,
      gst_certificate_img,
      profile_img) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = FormData();
    _data.fields.add(MapEntry('name', name));
    _data.fields.add(MapEntry('phone', phone));
    _data.fields.add(MapEntry('email', email));
    _data.fields.add(MapEntry('password', password));
    _data.fields.add(MapEntry('business_type', business_type));
    _data.fields.add(MapEntry('latitude', latitude));
    _data.fields.add(MapEntry('longitude', longitude));
    _data.fields.add(MapEntry('cf1', cf1));
    _data.fields.add(MapEntry('cf2', cf2));
    _data.fields.add(MapEntry('cf3', cf3));
    _data.fields.add(MapEntry('bank_name', bank_name));
    _data.fields.add(MapEntry('ac_no', ac_no));
    _data.fields.add(MapEntry('ifsc_code', ifsc_code));
    _data.fields.add(MapEntry('address', address));
    _data.fields.add(MapEntry('pan_no', pan_no));
    _data.files.add(MapEntry(
        'aadhar_card_img',
        MultipartFile.fromFileSync(aadhar_card_img.path,
            filename:
                aadhar_card_img.path.split(Platform.pathSeparator).last)));
    _data.files.add(MapEntry(
        'pan_card_img',
        MultipartFile.fromFileSync(pan_card_img.path,
            filename: pan_card_img.path.split(Platform.pathSeparator).last)));
    _data.files.add(MapEntry(
        'address_proof_img',
        MultipartFile.fromFileSync(address_proof_img.path,
            filename:
                address_proof_img.path.split(Platform.pathSeparator).last)));
    _data.files.add(MapEntry(
        'cancel_cheque_img',
        MultipartFile.fromFileSync(cancel_cheque_img.path,
            filename:
                cancel_cheque_img.path.split(Platform.pathSeparator).last)));
    _data.files.add(MapEntry(
        'gst_certificate_img',
        MultipartFile.fromFileSync(gst_certificate_img.path,
            filename:
                gst_certificate_img.path.split(Platform.pathSeparator).last)));
    _data.files.add(MapEntry(
        'profile_img',
        MultipartFile.fromFileSync(profile_img.path,
            filename: profile_img.path.split(Platform.pathSeparator).last)));
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Ownerloginresponse>(
            Options(method: 'POST', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/api/vendor/register',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Ownerloginresponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<AddStoreResponse> addStore(
      contentType,
      adminId,
      storeCategories,
      serviceCategoryId,
      name,
      description,
      image,
      lat,
      long,
      address,
      deliveryRange,
      mobile,
      email,
      selectedZoneID) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = FormData();
    _data.fields.add(MapEntry('admin_id', adminId));
    storeCategories.forEach((i) {
      _data.fields.add(MapEntry('store_categories[]', i));
    });
    _data.fields.add(MapEntry('service_category_id', serviceCategoryId));
    _data.fields.add(MapEntry('name', name));
    _data.fields.add(MapEntry('description', description));
    _data.files.add(MapEntry(
        'image',
        MultipartFile.fromFileSync(image.path,
            filename: image.path.split(Platform.pathSeparator).last)));
    _data.fields.add(MapEntry('latitude', lat));
    _data.fields.add(MapEntry('longitude', long));
    _data.fields.add(MapEntry('address', address));
    _data.fields.add(MapEntry('delivery_range', deliveryRange));
    _data.fields.add(MapEntry('mobile', mobile));
    _data.fields.add(MapEntry('email', email));
    selectedZoneID.forEach((i) {
      _data.fields.add(MapEntry('zone[]', i));
    });
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<AddStoreResponse>(Options(
                method: 'POST',
                headers: <String, dynamic>{r'Content-Type': contentType},
                extra: _extra,
                contentType: contentType)
            .compose(_dio.options, '/api/stores',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AddStoreResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<dynamic> editStore(
      storeId,
      method,
      adminId,
      storeCategories,
      serviceCategoryId,
      name,
      description,
      image,
      lat,
      long,
      address,
      deliveryRange,
      mobile,
      email,
      selectedZoneID) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = FormData();
    _data.fields.add(MapEntry('_method', method));
    _data.fields.add(MapEntry('admin_id', adminId));
    storeCategories.forEach((i) {
      _data.fields.add(MapEntry('store_categories[]', i));
    });
    _data.fields.add(MapEntry('service_category_id', serviceCategoryId));
    _data.fields.add(MapEntry('name', name));
    _data.fields.add(MapEntry('description', description));
    _data.files.add(MapEntry(
        'image',
        MultipartFile.fromFileSync(image.path,
            filename: image.path.split(Platform.pathSeparator).last)));
    _data.fields.add(MapEntry('latitude', lat));
    _data.fields.add(MapEntry('longitude', long));
    _data.fields.add(MapEntry('address', address));
    _data.fields.add(MapEntry('delivery_range', deliveryRange));
    _data.fields.add(MapEntry('mobile', mobile));
    _data.fields.add(MapEntry('email', email));
    selectedZoneID.forEach((i) {
      _data.fields.add(MapEntry('zone[]', i));
    });
    final _result = await _dio.fetch(_setStreamType<dynamic>(
        Options(method: 'POST', headers: <String, dynamic>{}, extra: _extra)
            .compose(_dio.options, '/api/stores/$storeId',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data;
    return value;
  }

  @override
  Future<ScheduleResponse> addStoreSchedulTime(
      storeId, dayList, openTimeList, closeTimeList) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = FormData();
    _data.fields.add(MapEntry('store_id', storeId));
    dayList.forEach((i) {
      _data.fields.add(MapEntry('day[]', i));
    });
    openTimeList.forEach((i) {
      _data.fields.add(MapEntry('open[]', i));
    });
    closeTimeList.forEach((i) {
      _data.fields.add(MapEntry('close[]', i));
    });
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ScheduleResponse>(
            Options(method: 'POST', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/api/store_timings',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ScheduleResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<Addrestaurantresponse> EditRestaurant(
      restaurantId,
      ownerId,
      name,
      description,
      avgDeliveryTime,
      aprx_price_for_two,
      full_address,
      pin_code,
      landmark,
      coordinates,
      is_featured,
      veg_only,
      min_order_price,
      delivery_radius,
      delivery_charge_type,
      fixed_delivery_charge,
      base_delivery_charge,
      base_delivery_distance,
      extra_delivery_charge,
      extra_delivery_distance,
      dine_in_enabled,
      take_away_enabled,
      delivery_enabled,
      open_time,
      closing_time,
      gallery_image,
      category,
      image,
      restaurant_phone,
      restaurant_phone_secondary) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = FormData();
    _data.fields.add(MapEntry('_ownerId', ownerId));
    _data.fields.add(MapEntry('name', name));
    _data.fields.add(MapEntry('description', description));
    _data.fields.add(MapEntry('avgDeliveryTime', avgDeliveryTime));
    _data.fields.add(MapEntry('aprx_price_for_two', aprx_price_for_two));
    _data.fields.add(MapEntry('full_address', full_address));
    _data.fields.add(MapEntry('pin_code', pin_code));
    _data.fields.add(MapEntry('landmark', landmark));
    coordinates.forEach((i) {
      _data.fields.add(MapEntry('coordinates[]', i));
    });
    _data.fields.add(MapEntry('is_featured', is_featured));
    _data.fields.add(MapEntry('veg_only', veg_only));
    _data.fields.add(MapEntry('min_order_price', min_order_price));
    _data.fields.add(MapEntry('delivery_radius', delivery_radius));
    _data.fields.add(MapEntry('delivery_charge_type', delivery_charge_type));
    _data.fields.add(MapEntry('fixed_delivery_charge', fixed_delivery_charge));
    _data.fields.add(MapEntry('base_delivery_charge', base_delivery_charge));
    _data.fields
        .add(MapEntry('base_delivery_distance', base_delivery_distance));
    _data.fields.add(MapEntry('extra_delivery_charge', extra_delivery_charge));
    _data.fields
        .add(MapEntry('extra_delivery_distance', extra_delivery_distance));
    _data.fields.add(MapEntry('dine_in_enabled', dine_in_enabled));
    _data.fields.add(MapEntry('take_away_enabled', take_away_enabled));
    _data.fields.add(MapEntry('delivery_enabled', delivery_enabled));
    _data.fields.add(MapEntry('open_time', open_time));
    _data.fields.add(MapEntry('closing_time', closing_time));
    _data.files.addAll(gallery_image.map((i) => MapEntry(
        'gallery_image',
        MultipartFile.fromFileSync(
          i.path,
          filename: i.path.split(Platform.pathSeparator).last,
        ))));
    category.forEach((i) {
      _data.fields.add(MapEntry('category', i));
    });
    _data.files.add(MapEntry(
        'image',
        MultipartFile.fromFileSync(image.path,
            filename: image.path.split(Platform.pathSeparator).last)));
    _data.fields.add(MapEntry('restaurant_phone', restaurant_phone));
    _data.fields.add(
        MapEntry('restaurant_phone_secondary', restaurant_phone_secondary));
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Addrestaurantresponse>(Options(
                method: 'PATCH', headers: <String, dynamic>{}, extra: _extra)
            .compose(_dio.options, '/api/stores/{storeId}',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Addrestaurantresponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<Ownerloginresponse> deleteRestaurant(restaurantId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Ownerloginresponse>(Options(
                method: 'DELETE', headers: <String, dynamic>{}, extra: _extra)
            .compose(_dio.options, '/restaurants/$restaurantId',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Ownerloginresponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<StoreCategoryResponse> getStoreCategory() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<StoreCategoryResponse>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options,
                    '/api/service_categories?search=service_type_id:1',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = StoreCategoryResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<StoreRealCategoryResponse> getStoreRealCategory() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<StoreRealCategoryResponse>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/api/store_categories?type=vendor',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = StoreRealCategoryResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<StoreServiceTypeResponse> getStoreServiceType() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<StoreServiceTypeResponse>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/api/service_types',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = StoreServiceTypeResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<StoreResponse> getAllStore() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<StoreResponse>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/api/stores?type=vendor',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = StoreResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<EcomStoreModel> getEcomStore() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<EcomStoreModel>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/api/get_ecommer_store',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = EcomStoreModel.fromJson(_result.data!);
    return value;
  }

  @override
  Future<SettingsResponse> getSettings() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<SettingsResponse>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/api/settings',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = SettingsResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ProductCategoryResponse> GetProductCategories(storeId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ProductCategoryResponse>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(
                    _dio.options, '/api/categories?search=store_id:$storeId',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ProductCategoryResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<VariantResponse> GetProductVariant(storeId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<VariantResponse>(Options(
                method: 'GET', headers: <String, dynamic>{}, extra: _extra)
            .compose(
                _dio.options, '/api/product_variants?search=store_id:$storeId',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = VariantResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ImportCategoryResponse> ImportCategories(name, image) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = FormData();
    _data.fields.add(MapEntry('restaurant_id', name));
    _data.files.add(MapEntry(
        'file',
        MultipartFile.fromFileSync(image.path,
            filename: image.path.split(Platform.pathSeparator).last)));
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ImportCategoryResponse>(
            Options(method: 'POST', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/restaurant/category/import',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ImportCategoryResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ImportItemsResponse> ImportItems(name, image) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = FormData();
    _data.fields.add(MapEntry('restaurant_id', name));
    _data.files.add(MapEntry(
        'file',
        MultipartFile.fromFileSync(image.path,
            filename: image.path.split(Platform.pathSeparator).last)));
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ImportItemsResponse>(
            Options(method: 'POST', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/restaurant/items/import',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ImportItemsResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<AddProductResponse> AddProductWithoutImage(
      StoreId,
      productType,
      name,
      description,
      productUnit,
      productPrice,
      productDiscountPrice,
      categoryId,
      proudctQuantity,
      productTag,
      isActive,
      openTime,
      closingTime) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = FormData();
    _data.fields.add(MapEntry('store_id', StoreId));
    _data.fields.add(MapEntry('product_type', productType));
    _data.fields.add(MapEntry('name', name));
    _data.fields.add(MapEntry('description', description));
    _data.fields.add(MapEntry('unit', productUnit));
    _data.fields.add(MapEntry('price', productPrice));
    _data.fields.add(MapEntry('discount_price', productDiscountPrice));
    _data.fields.add(MapEntry('category_id', categoryId));
    _data.fields.add(MapEntry('sku', proudctQuantity));
    _data.fields.add(MapEntry('product_tags', productTag));
    _data.fields.add(MapEntry('active', isActive));
    _data.fields.add(MapEntry('opening_time', openTime));
    _data.fields.add(MapEntry('closing_time', closingTime));
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<AddProductResponse>(
            Options(method: 'POST', headers: <String, dynamic>{}, extra: _extra)
                .compose(
                    _dio.options, '/api/products?search=store_id:{storeId}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AddProductResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<AddProductResponse> AddProduct(
      storeId,
      productType,
      name,
      description,
      productImage,
      productUnit,
      productPrice,
      productDiscountPrice,
      categoryId,
      proudctQuantity,
      productTag,
      isActive,
      openTime,
      closingTime,
      coupons) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = FormData();
    _data.fields.add(MapEntry('store_id', storeId));
    _data.fields.add(MapEntry('product_type', productType));
    _data.fields.add(MapEntry('name', name));
    _data.fields.add(MapEntry('description', description));
    _data.files.add(MapEntry(
        'image',
        MultipartFile.fromFileSync(productImage.path,
            filename: productImage.path.split(Platform.pathSeparator).last)));
    _data.fields.add(MapEntry('unit', productUnit));
    _data.fields.add(MapEntry('price', productPrice));
    _data.fields.add(MapEntry('discount_price', productDiscountPrice));
    _data.fields.add(MapEntry('category_id', categoryId));
    _data.fields.add(MapEntry('sku', proudctQuantity));
    _data.fields.add(MapEntry('product_tags', productTag));
    _data.fields.add(MapEntry('active', isActive));
    _data.fields.add(MapEntry('opening_time', openTime));
    _data.fields.add(MapEntry('closing_time', closingTime));
    coupons.forEach((i) {
      _data.fields.add(MapEntry('coupons[]', i));
    });
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<AddProductResponse>(
            Options(method: 'POST', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/api/products',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AddProductResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<AddProductCategoryResponse> AddProductCategory(
      storeId, productCategoryName, store_id, parentId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = FormData();
    _data.fields.add(MapEntry('name', productCategoryName));
    _data.fields.add(MapEntry('store_id', store_id));
    _data.fields.add(MapEntry('parent', parentId));
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<AddProductCategoryResponse>(
            Options(method: 'POST', headers: <String, dynamic>{}, extra: _extra)
                .compose(
                    _dio.options, '/api/categories?search=store_id:$storeId',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AddProductCategoryResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<GetProductResponse> GetItem(restId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GetProductResponse>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/api/products?search=store_id:$restId',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GetProductResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<GetStoreOrderResponse> GetRestaurantOrder(
      storeId, orderStatus, desc, page, limit) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'sortBy': desc,
      r'page': page,
      r'limit': limit
    };
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<
        GetStoreOrderResponse>(Options(
            method: 'GET', headers: <String, dynamic>{}, extra: _extra)
        .compose(_dio.options,
            '/api/orders?store_id=$storeId&search_status=$orderStatus&order=ongoin',
            queryParameters: queryParameters, data: _data)
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GetStoreOrderResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<GetStoreOrderResponse> getRestaurantOrderOngoing(
      storeId, orderStatus, desc, page, limit) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'sortBy': desc,
      r'page': page,
      r'limit': limit
    };
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GetStoreOrderResponse>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(
                    _dio.options, '/api/orders?order=ongoing&store_id=$storeId',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GetStoreOrderResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<GetStoreOrderResponse> getRestaurantOrderPending(
      storeId, orderStatus, desc, page, limit) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'sortBy': desc,
      r'page': page,
      r'limit': limit
    };
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GetStoreOrderResponse>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(
                    _dio.options, '/api/orders?order=pending&store_id=$storeId',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GetStoreOrderResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<GetStoreOrderResponse> getRestaurantOrderCancelled(
      storeId, orderStatus, desc, page, limit) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'sortBy': desc,
      r'page': page,
      r'limit': limit
    };
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GetStoreOrderResponse>(Options(
                method: 'GET', headers: <String, dynamic>{}, extra: _extra)
            .compose(
                _dio.options, '/api/orders?order=cancelled&store_id=$storeId',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GetStoreOrderResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<GetStoreOrderResponse> getRestaurantOrderDelivered(
      storeId, orderStatus, desc, page, limit) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'sortBy': desc,
      r'page': page,
      r'limit': limit
    };
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GetStoreOrderResponse>(Options(
                method: 'GET', headers: <String, dynamic>{}, extra: _extra)
            .compose(
                _dio.options, '/api/orders?order=delivered&store_id=$storeId',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GetStoreOrderResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<GetZoneResponse> GetZone(lat, long) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GetZoneResponse>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/api/zones?lat=$lat&long=$long',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GetZoneResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ModifyRestaurantOrderStatusResponse> ModifyStoreOrderStatus(
      orderId, status, preparationTime) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {'status': status, 'preparation_time': preparationTime};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ModifyRestaurantOrderStatusResponse>(Options(
                method: 'POST',
                headers: <String, dynamic>{},
                extra: _extra,
                contentType: 'application/x-www-form-urlencoded')
            .compose(_dio.options, '/api/orders/$orderId/changestatus',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ModifyRestaurantOrderStatusResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<GetProductResponse> GetItemByCategory(
      restId, categoryId, desc, page) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'restaurant_id': restId,
      r'item_categories': categoryId,
      r'sortBy': desc,
      r'page': page
    };
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GetProductResponse>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(
                    _dio.options, '/api/products?search=store_id:{storeId}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GetProductResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<UpdateItemStatusResponse> UpdateItemStatus(itemId, is_hidden) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {'is_hidden': is_hidden};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<UpdateItemStatusResponse>(Options(
                method: 'PATCH',
                headers: <String, dynamic>{},
                extra: _extra,
                contentType: 'application/x-www-form-urlencoded')
            .compose(_dio.options, '/restaurant/items/id/$itemId',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = UpdateItemStatusResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<UpdateCategoryStatusResponse> UpdateCategoryStatus(
      categoryId, is_hidden) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {'is_hidden': is_hidden};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<UpdateCategoryStatusResponse>(Options(
                method: 'PATCH',
                headers: <String, dynamic>{},
                extra: _extra,
                contentType: 'application/x-www-form-urlencoded')
            .compose(_dio.options, '/restaurant/category/id/$categoryId',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = UpdateCategoryStatusResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<Addrestaurantresponse> UpdateStoreStatus(
      storeId, method, is_open) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {'_method': method, 'is_open': is_open};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Addrestaurantresponse>(Options(
                method: 'POST',
                headers: <String, dynamic>{},
                extra: _extra,
                contentType: 'application/x-www-form-urlencoded')
            .compose(_dio.options, '/api/stores/$storeId',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Addrestaurantresponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<AddProductResponse> EditProductWithoutImage(
      productId,
      method,
      StoreId,
      productType,
      name,
      description,
      productUnit,
      productPrice,
      productDiscountPrice,
      categoryId,
      proudctQuantity,
      productTag,
      isActive,
      openTime,
      closingTime) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = FormData();
    _data.fields.add(MapEntry('_method', method));
    _data.fields.add(MapEntry('store_id', StoreId));
    _data.fields.add(MapEntry('product_type', productType));
    _data.fields.add(MapEntry('name', name));
    _data.fields.add(MapEntry('description', description));
    _data.fields.add(MapEntry('unit', productUnit));
    _data.fields.add(MapEntry('price', productPrice));
    _data.fields.add(MapEntry('discount_price', productDiscountPrice));
    _data.fields.add(MapEntry('category_id', categoryId));
    _data.fields.add(MapEntry('sku', proudctQuantity));
    _data.fields.add(MapEntry('product_tags', productTag));
    _data.fields.add(MapEntry('active', isActive));
    _data.fields.add(MapEntry('opening_time', openTime));
    _data.fields.add(MapEntry('closing_time', closingTime));
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<AddProductResponse>(Options(
                method: 'POST',
                headers: <String, dynamic>{},
                extra: _extra,
                contentType: 'application/x-www-form-urlencoded')
            .compose(_dio.options, '/api/products/$productId',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AddProductResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<AddProductResponse> EditProduct(
      productId,
      method,
      StoreId,
      productType,
      name,
      description,
      productImage,
      productUnit,
      productPrice,
      productDiscountPrice,
      categoryId,
      proudctQuantity,
      productTag,
      isActive,
      openTime,
      closingTime) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = FormData();
    _data.fields.add(MapEntry('_method', method));
    _data.fields.add(MapEntry('store_id', StoreId));
    _data.fields.add(MapEntry('product_type', productType));
    _data.fields.add(MapEntry('name', name));
    _data.fields.add(MapEntry('description', description));
    _data.files.add(MapEntry(
        'image',
        MultipartFile.fromFileSync(productImage.path,
            filename: productImage.path.split(Platform.pathSeparator).last)));
    _data.fields.add(MapEntry('unit', productUnit));
    _data.fields.add(MapEntry('price', productPrice));
    _data.fields.add(MapEntry('discount_price', productDiscountPrice));
    _data.fields.add(MapEntry('category_id', categoryId));
    _data.fields.add(MapEntry('sku', proudctQuantity));
    _data.fields.add(MapEntry('product_tags', productTag));
    _data.fields.add(MapEntry('active', isActive));
    _data.fields.add(MapEntry('opening_time', openTime));
    _data.fields.add(MapEntry('closing_time', closingTime));
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<AddProductResponse>(Options(
                method: 'POST',
                headers: <String, dynamic>{},
                extra: _extra,
                contentType: 'application/x-www-form-urlencoded')
            .compose(_dio.options, '/api/products/$productId',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AddProductResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<AddProductResponse> EditProductStatus(
      productId, method, isActive) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = FormData();
    _data.fields.add(MapEntry('_method', method));
    _data.fields.add(MapEntry('active', isActive));
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<AddProductResponse>(Options(
                method: 'POST',
                headers: <String, dynamic>{},
                extra: _extra,
                contentType: 'application/x-www-form-urlencoded')
            .compose(_dio.options, '/api/products/$productId',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AddProductResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<AddProductResponse> EditProductSKU(productId, method, SKU) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = FormData();
    _data.fields.add(MapEntry('_method', method));
    _data.fields.add(MapEntry('sku', SKU));
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<AddProductResponse>(Options(
                method: 'POST',
                headers: <String, dynamic>{},
                extra: _extra,
                contentType: 'application/x-www-form-urlencoded')
            .compose(_dio.options, '/api/products/$productId',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AddProductResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<AddProductCategoryResponse> EditProductCategory(productCategoryId,
      method, productCategoryName, store_id, parentId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = FormData();
    _data.fields.add(MapEntry('_method', method));
    _data.fields.add(MapEntry('name', productCategoryName));
    _data.fields.add(MapEntry('store_id', store_id));
    _data.fields.add(MapEntry('parent', parentId));
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<AddProductCategoryResponse>(Options(
                method: 'POST',
                headers: <String, dynamic>{},
                extra: _extra,
                contentType: 'application/x-www-form-urlencoded')
            .compose(_dio.options, '/api/categories/$productCategoryId',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AddProductCategoryResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<DeleteResponse> DeleteItem(itemId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<DeleteResponse>(Options(
                method: 'DELETE', headers: <String, dynamic>{}, extra: _extra)
            .compose(_dio.options, '/restaurant/items/id/$itemId',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = DeleteResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<DeleteResponse> DeleteCategory(categoryId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<DeleteResponse>(Options(
                method: 'DELETE', headers: <String, dynamic>{}, extra: _extra)
            .compose(_dio.options, '/restaurant/category/id/$categoryId',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = DeleteResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<GetPromoCodeResponse> GetPromoCode(storeId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GetPromoCodeResponse>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/api/coupons?search=store_id:$storeId',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GetPromoCodeResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<GetPromoCodeResponse> GetEcomPromoCode() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GetPromoCodeResponse>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/api/get_ecommerce_coupon',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GetPromoCodeResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<AddPromoCodeResponse> AddOffer(
      storeId,
      couponImage,
      couponCode,
      couponDescription,
      maxUsePerUser,
      minCartValue,
      couponStartDate,
      couponEndDate,
      couponDiscountType,
      couponDiscountValue,
      couponMaxDiscountValue,
      active) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = FormData();
    _data.fields.add(MapEntry('store_id', storeId));
    _data.files.add(MapEntry(
        'image',
        MultipartFile.fromFileSync(couponImage.path,
            filename: couponImage.path.split(Platform.pathSeparator).last)));
    _data.fields.add(MapEntry('code', couponCode));
    _data.fields.add(MapEntry('description', couponDescription));
    _data.fields.add(MapEntry('max_use_per_user', maxUsePerUser));
    _data.fields.add(MapEntry('min_cart_value', minCartValue));
    _data.fields.add(MapEntry('start_date', couponStartDate));
    _data.fields.add(MapEntry('end_date', couponEndDate));
    _data.fields.add(MapEntry('discount_type', couponDiscountType));
    _data.fields.add(MapEntry('discount_value', couponDiscountValue));
    _data.fields.add(MapEntry('max_discount_value', couponMaxDiscountValue));
    _data.fields.add(MapEntry('active', active));
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<AddPromoCodeResponse>(
            Options(method: 'POST', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/api/coupons',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AddPromoCodeResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<DeleteResponse> DeleteOffer(offerId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<DeleteResponse>(Options(
                method: 'DELETE', headers: <String, dynamic>{}, extra: _extra)
            .compose(_dio.options, '/restaurant/promo/id/$offerId',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = DeleteResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<AddPromoCodeResponse> EditOffer(
      offerId,
      method,
      storeId,
      couponImage,
      couponCode,
      couponDescription,
      maxUsePerUser,
      minCartValue,
      couponStartDate,
      couponEndDate,
      couponDiscountType,
      couponDiscountValue,
      couponMaxDiscountValue,
      active) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = FormData();
    _data.fields.add(MapEntry('_method', method));
    _data.fields.add(MapEntry('store_id', storeId));
    _data.files.add(MapEntry(
        'image',
        MultipartFile.fromFileSync(couponImage.path,
            filename: couponImage.path.split(Platform.pathSeparator).last)));
    _data.fields.add(MapEntry('code', couponCode));
    _data.fields.add(MapEntry('description', couponDescription));
    _data.fields.add(MapEntry('max_use_per_user', maxUsePerUser));
    _data.fields.add(MapEntry('min_cart_value', minCartValue));
    _data.fields.add(MapEntry('start_date', couponStartDate));
    _data.fields.add(MapEntry('end_date', couponEndDate));
    _data.fields.add(MapEntry('discount_type', couponDiscountType));
    _data.fields.add(MapEntry('discount_value', couponDiscountValue));
    _data.fields.add(MapEntry('max_discount_value', couponMaxDiscountValue));
    _data.fields.add(MapEntry('active', active));
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<AddPromoCodeResponse>(
            Options(method: 'POST', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/api/coupons/$offerId',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AddPromoCodeResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<GetAddonCategoryResponse> GetAddon(restId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GetAddonCategoryResponse>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/restaurants/id/addon_details/$restId',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GetAddonCategoryResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<AddVariantResponse> AddVariant(productId, variantName, variantPrice,
      variantDiscountPrice, proudctQuantity, variantImage) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = FormData();
    _data.fields.add(MapEntry('product_id', productId));
    _data.fields.add(MapEntry('name', variantName));
    _data.fields.add(MapEntry('price', variantPrice));
    _data.fields.add(MapEntry('discount_price', variantDiscountPrice));
    _data.fields.add(MapEntry('sku', proudctQuantity));
    _data.files.add(MapEntry(
        'image',
        MultipartFile.fromFileSync(variantImage.path,
            filename: variantImage.path.split(Platform.pathSeparator).last)));
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<AddVariantResponse>(
            Options(method: 'POST', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/api/product_variants',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AddVariantResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<AddVariantResponse> AddVariantWithoutImage(productId, variantName,
      variantPrice, variantDiscountPrice, proudctQuantity) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = FormData();
    _data.fields.add(MapEntry('product_id', productId));
    _data.fields.add(MapEntry('name', variantName));
    _data.fields.add(MapEntry('price', variantPrice));
    _data.fields.add(MapEntry('discount_price', variantDiscountPrice));
    _data.fields.add(MapEntry('sku', proudctQuantity));
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<AddVariantResponse>(
            Options(method: 'POST', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/api/product_variants',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AddVariantResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<AddVariantResponse> EditVariant(
      variantId,
      method,
      productId,
      variantName,
      variantPrice,
      variantDiscountPrice,
      proudctQuantity,
      variantImage) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = FormData();
    _data.fields.add(MapEntry('_method', method));
    _data.fields.add(MapEntry('product_id', productId));
    _data.fields.add(MapEntry('name', variantName));
    _data.fields.add(MapEntry('price', variantPrice));
    _data.fields.add(MapEntry('discount_price', variantDiscountPrice));
    _data.fields.add(MapEntry('sku', proudctQuantity));
    _data.files.add(MapEntry(
        'image',
        MultipartFile.fromFileSync(variantImage.path,
            filename: variantImage.path.split(Platform.pathSeparator).last)));
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<AddVariantResponse>(
            Options(method: 'POST', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/api/product_variants/$variantId',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AddVariantResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<AddVariantResponse> EditVariantWithoutImage(
      variantId,
      method,
      productId,
      variantName,
      variantPrice,
      variantDiscountPrice,
      proudctQuantity) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = FormData();
    _data.fields.add(MapEntry('_method', method));
    _data.fields.add(MapEntry('product_id', productId));
    _data.fields.add(MapEntry('name', variantName));
    _data.fields.add(MapEntry('price', variantPrice));
    _data.fields.add(MapEntry('discount_price', variantDiscountPrice));
    _data.fields.add(MapEntry('sku', proudctQuantity));
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<AddVariantResponse>(
            Options(method: 'POST', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/api/product_variants/$variantId',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AddVariantResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<AddVariantResponse> EditVariantStatus(
      variantId, method, active) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = FormData();
    _data.fields.add(MapEntry('_method', method));
    _data.fields.add(MapEntry('active', active));
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<AddVariantResponse>(
            Options(method: 'POST', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/api/product_variants/$variantId',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AddVariantResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<AddEditAddonCategoryItemResponse> AddAddonCategoryItem(
      name, price, categoryId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {'name': name, 'price': price, '_categoryId': categoryId};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<AddEditAddonCategoryItemResponse>(Options(
                method: 'POST',
                headers: <String, dynamic>{},
                extra: _extra,
                contentType: 'application/x-www-form-urlencoded')
            .compose(_dio.options, '/restaurant/addon/item',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AddEditAddonCategoryItemResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<EditAddonResponse> EditAddonCategoryItem(
      categoryItemId, name, price, categoryId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {'name': name, 'price': price, '_categoryId': categoryId};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<EditAddonResponse>(Options(
                method: 'PATCH',
                headers: <String, dynamic>{},
                extra: _extra,
                contentType: 'application/x-www-form-urlencoded')
            .compose(_dio.options, '/restaurant/addon/item/id/$categoryItemId',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = EditAddonResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<DeleteResponse> DeleteAddonCategory(category) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<DeleteResponse>(Options(
                method: 'DELETE', headers: <String, dynamic>{}, extra: _extra)
            .compose(_dio.options, '/restaurant/addon/category/id/$category',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = DeleteResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<DeleteResponse> DeleteAddonCategoryItem(categoryItemId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<DeleteResponse>(Options(
                method: 'DELETE', headers: <String, dynamic>{}, extra: _extra)
            .compose(_dio.options, '/restaurant/addon/item/id/$categoryItemId',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = DeleteResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<AddPromoCodeResponse> UpdateOfferStatus(
      offerId, method, isActive) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = FormData();
    _data.fields.add(MapEntry('_method', method));
    _data.fields.add(MapEntry('active', isActive));
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<AddPromoCodeResponse>(
            Options(method: 'POST', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/api/coupons/$offerId',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AddPromoCodeResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<AddImageResponse> AddItemImage(type, image) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = FormData();
    _data.fields.add(MapEntry('type', type));
    _data.files.addAll(image.map((i) => MapEntry(
        'images',
        MultipartFile.fromFileSync(
          i.path,
          filename: i.path.split(Platform.pathSeparator).last,
        ))));
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<AddImageResponse>(
            Options(method: 'POST', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/image/upload',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = AddImageResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<DeleteResponse> DeleteImage(image) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {'images': image};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<DeleteResponse>(Options(
                method: 'POST',
                headers: <String, dynamic>{},
                extra: _extra,
                contentType: 'application/x-www-form-urlencoded')
            .compose(_dio.options, '/image/delete',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = DeleteResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ItemSearchResponse> searchFoodItem(restaurantId, searchKeyWord) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {'restaurantId': restaurantId, 'name': searchKeyWord};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ItemSearchResponse>(Options(
                method: 'POST',
                headers: <String, dynamic>{},
                extra: _extra,
                contentType: 'application/x-www-form-urlencoded')
            .compose(_dio.options, '/restaurant/items/search',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ItemSearchResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<RegistrationResponse> register(name, phone, email, password, fcm_token,
      latitude, longitude, valueType, sub_id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {
      'name': name,
      'mobile': phone,
      'email': email,
      'password': password,
      'fcm_token': fcm_token,
      'lat': latitude,
      'long': longitude,
      'is_ecom': valueType,
      'subscription_id': sub_id
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<RegistrationResponse>(Options(
                method: 'POST',
                headers: <String, dynamic>{},
                extra: _extra,
                contentType: 'application/x-www-form-urlencoded')
            .compose(_dio.options, '/api/vendor/register',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = RegistrationResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ProfileResponse> GetProfile(bearerToken) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ProfileResponse>(Options(
                method: 'GET',
                headers: <String, dynamic>{r'Authorization': bearerToken},
                extra: _extra)
            .compose(_dio.options, '/api/vendor/profile',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ProfileResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ProfileResponse> uploadBankDetails(
      json, bankName, accountNumber, accountName, ifscColde, branchName) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {
      'bank_name': bankName,
      'account_no': accountNumber,
      'account_name': accountName,
      'ifsc_code': ifscColde,
      'branch_name': branchName
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ProfileResponse>(Options(
                method: 'POST',
                headers: <String, dynamic>{r'Accept': json},
                extra: _extra,
                contentType: 'application/x-www-form-urlencoded')
            .compose(_dio.options, '/api/vendor/update',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ProfileResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<KycResponse> uploadKyc(bearerToken, type, image) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = FormData();
    _data.fields.add(MapEntry('doc_type', type));
    _data.files.add(MapEntry(
        'photo',
        MultipartFile.fromFileSync(image.path,
            filename: image.path.split(Platform.pathSeparator).last)));
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<KycResponse>(Options(
                method: 'POST',
                headers: <String, dynamic>{r'Authorization': bearerToken},
                extra: _extra)
            .compose(_dio.options, '/api/vendor/kyc',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = KycResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<dynamic> uploadFcmToken(bearerToken, FcmToken) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = FormData();
    _data.fields.add(MapEntry('fcm_token', FcmToken));
    final _result = await _dio.fetch(_setStreamType<dynamic>(Options(
            method: 'POST',
            headers: <String, dynamic>{r'Authorization': bearerToken},
            extra: _extra)
        .compose(_dio.options, '/api/vendor/update',
            queryParameters: queryParameters, data: _data)
        .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = _result.data;
    return value;
  }

  @override
  Future<GraphDataResponse> getGraphData(
      startDate, endDate, type, interval) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {
      'start_date': startDate,
      'end_date': endDate,
      'type': type,
      'interval': interval
    };
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GraphDataResponse>(Options(
                method: 'POST',
                headers: <String, dynamic>{},
                extra: _extra,
                contentType: 'application/x-www-form-urlencoded')
            .compose(_dio.options, '/api/vendor/reports',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GraphDataResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<StoreStatsResponse> getStoreStats(storeId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<StoreStatsResponse>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/api/stores/$storeId/stats',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = StoreStatsResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<StoreStatsResponse> getEomStoreStats(storeId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<StoreStatsResponse>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/api/stores/$storeId/ecom_stats',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = StoreStatsResponse.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
