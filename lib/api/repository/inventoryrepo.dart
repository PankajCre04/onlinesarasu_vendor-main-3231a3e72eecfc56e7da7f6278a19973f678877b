import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sooooperbusiness/model/basemodel.dart';
import 'package:sooooperbusiness/model/more/inventory/add_variant_response.dart';
import 'package:sooooperbusiness/model/more/inventory/addcategoryresponse.dart';
import 'package:sooooperbusiness/model/more/inventory/addeditaddoncategoryitemresponse.dart';
import 'package:sooooperbusiness/model/more/inventory/addeditaddoncategoryresponse.dart';
import 'package:sooooperbusiness/model/more/inventory/addimageresponse.dart';
import 'package:sooooperbusiness/model/more/inventory/addproductresponse.dart';
import 'package:sooooperbusiness/model/more/inventory/deleteresponse.dart';
import 'package:sooooperbusiness/model/more/inventory/editaddonresponse.dart';
import 'package:sooooperbusiness/model/more/inventory/getaddonresponse.dart';
import 'package:sooooperbusiness/model/more/inventory/getcategoryresponse.dart';
import 'package:sooooperbusiness/model/more/inventory/getitemresponse.dart';
import 'package:sooooperbusiness/model/more/inventory/importItemsresponse.dart';
import 'package:sooooperbusiness/model/more/inventory/importcategoryresponse.dart';
import 'package:sooooperbusiness/model/more/inventory/productCategoryResponse.dart';
import 'package:sooooperbusiness/model/more/inventory/updatecategorystatusresponse.dart';
import 'package:sooooperbusiness/model/more/inventory/updateitemstatusresponse.dart';
import 'package:sooooperbusiness/model/more/inventory/variantResponse.dart';
import 'package:sooooperbusiness/model/servererror.dart';
import 'package:sooooperbusiness/views/dashboard/navigationscreens/More/Inventory/addcategory.dart';

import '../api_client.dart';

class InventoryRepo {
  Dio? dio;
  ApiClient? apiClient;

  InventoryRepo() {
    if (dio != null) {
      return;
    }
    if (apiClient != null) {
      return;
    }
    dio = new Dio();
    apiClient = ApiClient(dio!);
  }

  // Future<BaseModel<AddCategoryResponse>> AddCategory(
  //   String accessToken,
  //   String name,
  //   File image,
  //   String is_hidden,
  //   String restuarant_id,
  //   String parent,
  // ) async {
  //   print("addcatee");
  //   print(accessToken);
  //
  //   dio!.options.headers.addAll({"Authorization": "Bearer $accessToken"});
  //   AddCategoryResponse response;
  //
  //   try {
  //     response = await apiClient!.AddCategories(
  //       name,
  //       is_hidden,
  //       restuarant_id,
  //       parent,
  //     );
  //   } catch (error, stacktrace) {
  //     print("Exception occured: $error stackTrace: $stacktrace");
  //     return BaseModel()..setException(Servererror.fromJson(error));
  //   }
  //   return BaseModel()..data = response;
  // }

  Future<BaseModel<ImportCategoryResponse>> ImportCategory(
    String accessToken,
    String restId,
    File? file,
  ) async {
    dio!.options.headers.addAll({"Authorization": "Bearer $accessToken"});
    ImportCategoryResponse response;
    try {
      response = await apiClient!.ImportCategories(
        restId,
        file!,
      );
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return BaseModel()..setException(Servererror.fromJson(error));
    }
    return BaseModel()..data = response;
  }

  Future<BaseModel<ImportItemsResponse>> ImportItems(
    String accessToken,
    String restId,
    File? file,
  ) async {
    dio!.options.headers.addAll({"Authorization": "Bearer $accessToken"});
    ImportItemsResponse response;
    try {
      response = await apiClient!.ImportItems(
        restId,
        file!,
      );
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return BaseModel()..setException(Servererror.fromJson(error));
    }
    return BaseModel()..data = response;
  }

  Future<BaseModel<ProductCategoryResponse>> GetProductCategory(
    String accessToken,
    String restId,
    String categoryId,
  ) async {
    print("addcatee");
    print(accessToken);
    dio!.options.headers.addAll({
      "Authorization": "Bearer " + accessToken
      //"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2MGYyNmM2ZjQ0YjBmODAwMjAwZjMwZmIiLCJpYXQiOjE2MjY1MDAyMjAsImV4cCI6MTY4NjUwMDE2MCwidHlwZSI6ImFjY2VzcyJ9.xVIuSiuyhx2FkSwq7xPjsHQCt0gUtoLu6L1ouOqJkHw",
    }); //accessToken});
    ProductCategoryResponse response;

    try {
      response = await apiClient!.GetProductCategories("$restId;parent:$categoryId&searchJoin=and");
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return BaseModel()..setException(Servererror.fromJson(error));
    }
    return BaseModel()..data = response;
  }

  Future<BaseModel<VariantResponse>> GetProductVariant(
    String accessToken,
    String storeId,
  ) async {
    print("addcatee");
    print(accessToken);
    print(storeId);
    dio!.options.headers.addAll({
      "Authorization": "Bearer " + accessToken
      //"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2MGYyNmM2ZjQ0YjBmODAwMjAwZjMwZmIiLCJpYXQiOjE2MjY1MDAyMjAsImV4cCI6MTY4NjUwMDE2MCwidHlwZSI6ImFjY2VzcyJ9.xVIuSiuyhx2FkSwq7xPjsHQCt0gUtoLu6L1ouOqJkHw",
    }); //accessToken});
    VariantResponse response;

    try {
      response = await apiClient!.GetProductVariant("$storeId&searchJoin=and");
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return BaseModel()..setException(Servererror.fromJson(error));
    }
    return BaseModel()..data = response;
  }

  // Future<BaseModel<GetCategoryResponse>> getSubCategory(
  //     String accessToken, String restId, String categoryId) async {
  //   print("addcatee");
  //   print(accessToken);
  //   dio!.options.headers.addAll({
  //     "Authorization": "Bearer " + accessToken
  //     //"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2MGYyNmM2ZjQ0YjBmODAwMjAwZjMwZmIiLCJpYXQiOjE2MjY1MDAyMjAsImV4cCI6MTY4NjUwMDE2MCwidHlwZSI6ImFjY2VzcyJ9.xVIuSiuyhx2FkSwq7xPjsHQCt0gUtoLu6L1ouOqJkHw",
  //   }); //accessToken});
  //   GetCategoryResponse response;
  //
  //   try {
  //     response =
  //         await apiClient!.GetCategories(categoryId, restId, "createdAt:desc");
  //   } catch (error, stacktrace) {
  //     print("Exception occured: $error stackTrace: $stacktrace");
  //     return BaseModel()..setException(Servererror.fromJson(error));
  //   }
  //   return BaseModel()..data = response;
  // }

  // Future<BaseModel<GetCategoryResponse>> GetAllCategory(
  //   String accessToken,
  //   String restId,
  // ) async {
  //   print("addcatee");
  //   print(accessToken);
  //   dio!.options.headers.addAll({
  //     "Authorization": "Bearer " + accessToken
  //     //"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2MGYyNmM2ZjQ0YjBmODAwMjAwZjMwZmIiLCJpYXQiOjE2MjY1MDAyMjAsImV4cCI6MTY4NjUwMDE2MCwidHlwZSI6ImFjY2VzcyJ9.xVIuSiuyhx2FkSwq7xPjsHQCt0gUtoLu6L1ouOqJkHw",
  //   }); //accessToken});
  //   GetCategoryResponse response;
  //
  //   try {
  //     response =
  //         await apiClient!.GetAllCategories(restId, "createdAt:desc", "2000");
  //   } catch (error, stacktrace) {
  //     print("Exception occured: $error stackTrace: $stacktrace");
  //     return BaseModel()..setException(Servererror.fromJson(error));
  //   }
  //   return BaseModel()..data = response;
  // }

  Future<BaseModel<AddProductResponse>> AddProductWithoutImage(
    String storeId,
    String productType,
    String name,
    String description,
    // File productImage,
    String unit,
    String productPrice,
    String productDiscountPrice,
    String categoryId,
    String quantity,
    String productTag,
    String isActive,
    String openTime,
    String closingTime,
  ) async {
    print("addcatetatae");
    // dio!.options.headers.addAll({"Authorization": "Bearer $accessToken"});
    AddProductResponse response;
    try {
      response = await apiClient!
          .AddProductWithoutImage(
        storeId,
        productType.toUpperCase(),
        name,
        description,
        // productImage,
        unit,
        productPrice,
        productDiscountPrice,
        categoryId,
        quantity,
        productTag,
        isActive,
        openTime,
        closingTime,
      )
          .then((value) {
        return value;
      }).catchError((error) {
        switch (error.runtimeType) {
          case DioError:
            // Here's the sample to get the failed response error code and message
            final res = (error as DioError).response;
            print("Got error : ${res!.statusCode} -> ${res.statusMessage}");
            if (res.statusCode == 401) {
              Get.offAllNamed('/splash');
            }
            break;
          default:
            break;
        }
      });
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      print("neche error");
      print(Servererror.fromJson(error));
      return BaseModel()..setException(Servererror.fromJson(error));
    }
    print("niche response");
    print(response);
    return BaseModel()..data = response;
  }

  Future<BaseModel<AddProductResponse>> AddProduct(
    String storeId,
    String productType,
    String name,
    String description,
    File productImage,
    String unit,
    String productPrice,
    String? productDiscountPrice,
    String categoryId,
    String quantity,
    String productTag,
    String isActive,
    String openTime,
    String closingTime,
    List<String> coupons,
  ) async {
    AddProductResponse response;
    try {
      response = await apiClient!
          .AddProduct(
        storeId,
        productType.toUpperCase(),
        name,
        description,
        productImage,
        unit,
        productPrice,
        productDiscountPrice!,
        categoryId,
        quantity,
        productTag,
        isActive,
        openTime,
        closingTime,
        coupons,
      )
          .then((value) {
        print("----------------------------");
        return value;
      }).catchError((error) {
        print("yaha error hai");
        switch (error.runtimeType) {
          case DioError:
            // Here's the sample to get the failed response error code and message
            final res = (error as DioError).response;
            print("Got error : ${res!.statusCode} -> ${res.statusMessage}");
            if (res.statusCode == 401) {
              Get.offAllNamed('/splash');
            }
            break;
          default:
            break;
        }
      });
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      print("neche error");
      print(Servererror.fromJson(error));
      return BaseModel()..setException(Servererror.fromJson(error));
    }
    print("niche response");
    print(response);
    return BaseModel()..data = response;
  }

  Future<BaseModel<AddProductCategoryResponse>> AddProductCategory(
    String name,
    File productCategoryImage,
    String storeId,
    String parentId,
  ) async {
    print("addcatee");
    //dio!.options.headers.addAll({"Authorization": "Bearer $accessToken"});
    AddProductCategoryResponse response;
    try {
      response = await apiClient!
          .AddProductCategory(
        storeId,
        name,
        // productCategoryImage,
        storeId,
        parentId,
      )
          .then((value) {
        return value;
      }).catchError((error) {
        switch (error.runtimeType) {
          case DioError:
            // Here's the sample to get the failed response error code and message
            final res = (error as DioError).response;
            print("Got error : ${res!.statusCode} -> ${res.statusMessage}");
            if (res.statusCode == 401) {
              Get.offAllNamed('/splash');
            }
            break;
          default:
            break;
        }
      });
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return BaseModel()..setException(Servererror.fromJson(error));
    }
    return BaseModel()..data = response;
  }

  Future<BaseModel<GetProductResponse>> GetItem(String restId, int page) async {
    GetProductResponse response;
    try {
      response = await apiClient!.GetItem(
        restId,
      );
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return BaseModel()..setException(Servererror.fromJson(error));
    }
    return BaseModel()..data = response;
  }

  Future<BaseModel<GetProductResponse>> GetItemByCategory(String restId, String categoryId, int page) async {
    GetProductResponse response;

    try {
      response = await apiClient!.GetItemByCategory(restId, categoryId, "createdAt:desc", page);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return BaseModel()..setException(Servererror.fromJson(error));
    }
    return BaseModel()..data = response;
  }

  Future<BaseModel<UpdateItemStatusResponse>> UpdateItemStatus(
    String accessToken,
    String isHidden,
    String itemId,
  ) async {
    print("addcatee");
    print(accessToken);
    dio!.options.headers.addAll({"Authorization": "Bearer $accessToken"});
    UpdateItemStatusResponse response;

    try {
      response = await apiClient!.UpdateItemStatus(
        itemId,
        isHidden,
      );
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return BaseModel()..setException(Servererror.fromJson(error));
    }
    return BaseModel()..data = response;
  }

  Future<BaseModel<UpdateCategoryStatusResponse>> UpdateCategoryStatus(
    String accessToken,
    String isHidden,
    String categoryId,
  ) async {
    print("addcatee");
    print(accessToken);
    print(categoryId);
    dio!.options.headers.addAll({"Authorization": "Bearer $accessToken"});
    UpdateCategoryStatusResponse response;

    try {
      response = await apiClient!.UpdateCategoryStatus(
        categoryId,
        isHidden,
      );
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return BaseModel()..setException(Servererror.fromJson(error));
    }
    return BaseModel()..data = response;
  }

  Future<BaseModel<AddProductResponse>> EditProductWithoutImage(
    String productId,
    String storeId,
    String productType,
    String name,
    String description,
    // File productImage,
    String unit,
    String productPrice,
    String productDiscountPrice,
    String categoryId,
    String quantity,
    String productTag,
    String isActive,
    String openTime,
    String closeTime,
  ) async {
    print("addcatee");
    //dio!.options.headers.addAll({"Authorization": "Bearer $accessToken"});
    AddProductResponse response;
    try {
      response = await apiClient!
          .EditProductWithoutImage(
        productId,
        "PUT",
        storeId,
        productType.toUpperCase(),
        name,
        description,
        // productImage,
        unit,
        productPrice,
        productDiscountPrice,
        categoryId,
        quantity,
        productTag,
        isActive,
        openTime,
        closeTime,
      )
          .then((value) {
        print("in value");
        return value;
      }).catchError((error) {
        switch (error.runtimeType) {
          case DioError:
            // Here's the sample to get the failed response error code and message
            final res = (error as DioError).response;
            print("Got error : ${res!.statusCode} -> ${res.statusMessage}");
            if (res.statusCode == 401) {
              Get.offAllNamed('/splash');
            }
            break;
          default:
            break;
        }
      });
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return BaseModel()..setException(Servererror.fromJson(error));
    }
    return BaseModel()..data = response;
  }

  Future<BaseModel<AddProductResponse>> EditProduct(
    String productId,
    String storeId,
    String productType,
    String name,
    String description,
    File productImage,
    String unit,
    String productPrice,
    String productDiscountPrice,
    String categoryId,
    String quantity,
    String productTag,
    String isActive,
    String openTime,
    String closeTime,
  ) async {
    print("addcateeedit");
    //dio!.options.headers.addAll({"Authorization": "Bearer $accessToken"});
    AddProductResponse response;
    try {
      response = await apiClient!
          .EditProduct(
        productId,
        "PUT",
        storeId,
        productType.toUpperCase(),
        name,
        description,
        productImage,
        unit,
        productPrice,
        productDiscountPrice,
        categoryId,
        quantity,
        productTag,
        isActive,
        openTime,
        closeTime,
      )
          .then((value) {
        print("in value");
        return value;
      }).catchError((error) {
        switch (error.runtimeType) {
          case DioError:
            // Here's the sample to get the failed response error code and message
            final res = (error as DioError).response;
            print("Got error : ${res!.statusCode} -> ${res.statusMessage}");
            if (res.statusCode == 401) {
              Get.offAllNamed('/splash');
            }
            break;
          default:
            break;
        }
      });
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return BaseModel()..setException(Servererror.fromJson(error));
    }
    return BaseModel()..data = response;
  }

  Future<BaseModel<AddProductResponse>> EditProductStatus(
    String productId,
    String isActive,
  ) async {
    print("addcatee");
    //dio!.options.headers.addAll({"Authorization": "Bearer $accessToken"});
    AddProductResponse response;
    try {
      response = await apiClient!.EditProductStatus(productId, "PUT", isActive).then((value) {
        return value;
      }).catchError((error) {
        switch (error.runtimeType) {
          case DioError:
            // Here's the sample to get the failed response error code and message
            final res = (error as DioError).response;
            print("Got error : ${res!.statusCode} -> ${res.statusMessage}");
            if (res.statusCode == 401) {
              Get.offAllNamed('/splash');
            }
            break;
          default:
            break;
        }
      });
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return BaseModel()..setException(Servererror.fromJson(error));
    }
    return BaseModel()..data = response;
  }

  Future<BaseModel<AddProductResponse>> EditProductQuantity(
    String productId,
    String SKU,
  ) async {
    print("addcatee");
    //dio!.options.headers.addAll({"Authorization": "Bearer $accessToken"});
    AddProductResponse response;
    try {
      response = await apiClient!.EditProductSKU(productId, "PUT", SKU).then((value) {
        return value;
      }).catchError((error) {
        switch (error.runtimeType) {
          case DioError:
            // Here's the sample to get the failed response error code and message
            final res = (error as DioError).response;
            print("Got error : ${res!.statusCode} -> ${res.statusMessage}");
            if (res.statusCode == 401) {
              Get.offAllNamed('/splash');
            }
            break;
          default:
            break;
        }
      });
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return BaseModel()..setException(Servererror.fromJson(error));
    }
    return BaseModel()..data = response;
  }

  Future<BaseModel<AddProductCategoryResponse>> EditProductCategory(String productCategoryId, String productCategoryName, File productCategoryImage, String storeId, String parentCategoryId) async {
    print("addcatee");
    //dio!.options.headers.addAll({"Authorization": "Bearer $accessToken"});
    final response;
    try {
      response = await apiClient!
          .EditProductCategory(
        productCategoryId,
        "PUT",
        productCategoryName,
        // productCategoryImage,
        storeId,
        parentCategoryId,
      )
          .then((value) {
        print(value);

        return value;
        // return value;
      }).catchError((error) {
        switch (error.runtimeType) {
          case DioError:
            // Here's the sample to get the failed response error code and message
            final res = (error as DioError).response;
            print("Got error : ${res!.statusCode} -> ${res.statusMessage}");
            if (res.statusCode == 401) {
              Get.offAllNamed('/splash');
            }
            break;
          default:
            break;
        }
      });
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return BaseModel()..setException(Servererror.fromJson(error));
    }
    return BaseModel()..data = response;
  }

  // Future<BaseModel<AddCategoryResponse>> EditCategory(
  //   String categoryId,
  //   String accessToken,
  //   String name,
  //   File image,
  //   String is_hidden,
  //   String restuarant_id,
  //   String parent,
  // ) async {
  //   print("addcatee");
  //   print(accessToken);
  //   dio!.options.headers.addAll({"Authorization": "Bearer $accessToken"});
  //   AddCategoryResponse response;
  //
  //   try {
  //     response = await apiClient!.EditCategories(
  //       categoryId,
  //       name,
  //       //image,
  //       is_hidden,
  //       // restuarant_id,
  //       // parent,
  //     );
  //   } catch (error, stacktrace) {
  //     print("Exception occured: $error stackTrace: $stacktrace");
  //     return BaseModel()..setException(Servererror.fromJson(error));
  //   }
  //   return BaseModel()..data = response;
  // }

  Future<BaseModel<DeleteResponse>> DeleteItem(String itemId) async {
    DeleteResponse response;

    try {
      response = await apiClient!.DeleteItem(itemId);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return BaseModel()..setException(Servererror.fromJson(error));
    }
    return BaseModel()..data = response;
  }

  Future<BaseModel<DeleteResponse>> DeleteCategory(String categoryId) async {
    DeleteResponse response;

    try {
      response = await apiClient!.DeleteCategory(categoryId);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return BaseModel()..setException(Servererror.fromJson(error));
    }
    return BaseModel()..data = response;
  }

  Future<BaseModel<GetAddonCategoryResponse>> GetAddon(
    String restId,
  ) async {
    GetAddonCategoryResponse response;
    try {
      response = await apiClient!.GetAddon(restId);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return BaseModel()..setException(Servererror.fromJson(error));
    }
    return BaseModel()..data = response;
  }

  Future<BaseModel<AddVariantResponse>> AddVariant(
    String variantProductId,
    String variantName,
    String variantPrice,
    String variantDiscountPrice,
    String quantity,
    File variantImage,
  ) async {
    print("add variant");
    // AddVariantResponse response;
    final response;
    try {
      print("variant try");
      response = await apiClient!
          .AddVariant(
        variantProductId,
        variantName,
        variantPrice,
        variantDiscountPrice,
        quantity,
        variantImage,
      )
          .then((value) {
        print("variant ki value");
        print(value);
        return value;
      }).catchError((error) {
        switch (error.runtimeType) {
          case DioError:
            // Here's the sample to get the failed response error code and message
            final res = (error as DioError).response;
            print("Got error : ${res!.statusCode} -> ${res.statusMessage}");
            if (res.statusCode == 401) {
              Get.offAllNamed('/splash');
            }
            break;
          default:
            break;
        }
      });
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return BaseModel()..setException(Servererror.fromJson(error));
    }
    return BaseModel()..data = response;
  }

  Future<BaseModel<AddVariantResponse>> AddVariantWithoutImage(
    String variantProductId,
    String variantName,
    String variantPrice,
    String variantDiscountPrice,
    String quantity,
    // File variantImage,
  ) async {
    print("add variant");
    // AddVariantResponse response;
    final response;
    try {
      print("variant try");
      response = await apiClient!
          .AddVariantWithoutImage(
        variantProductId,
        variantName,
        variantPrice,
        variantDiscountPrice,
        quantity,
        // variantImage,
      )
          .then((value) {
        print("variant ki value");
        print(value);
        return value;
      }).catchError((error) {
        switch (error.runtimeType) {
          case DioError:
            // Here's the sample to get the failed response error code and message
            final res = (error as DioError).response;
            print("Got error : ${res!.statusCode} -> ${res.statusMessage}");
            if (res.statusCode == 401) {
              Get.offAllNamed('/splash');
            }
            break;
          default:
            break;
        }
      });
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return BaseModel()..setException(Servererror.fromJson(error));
    }
    return BaseModel()..data = response;
  }

  Future<BaseModel<AddVariantResponse>> EditVariant(
    String variantId,
    String variantProductId,
    String variantName,
    String variantPrice,
    String variantDiscountPrice,
    String quantity,
    File variantImage,
  ) async {
    AddVariantResponse response;

    try {
      response = await apiClient!
          .EditVariant(
        variantId,
        "PUT",
        variantProductId,
        variantName,
        variantPrice,
        variantDiscountPrice,
        quantity,
        variantImage,
        //restuarant_id,
      )
          .then((value) {
        return value;
      }).catchError((error) {
        switch (error.runtimeType) {
          case DioError:
            // Here's the sample to get the failed response error code and message
            final res = (error as DioError).response;
            print("Got error : ${res!.statusCode} -> ${res.statusMessage}");
            if (res.statusCode == 401) {
              Get.offAllNamed('/splash');
            }
            break;
          default:
            break;
        }
      });
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return BaseModel()..setException(Servererror.fromJson(error));
    }
    return BaseModel()..data = response;
  }

  Future<BaseModel<AddVariantResponse>> EditVariantWithoutImage(
    String variantId,
    String variantProductId,
    String variantName,
    String variantPrice,
    String variantDiscountPrice,
    String quantity,
  ) async {
    AddVariantResponse response;

    try {
      response = await apiClient!
          .EditVariantWithoutImage(
        variantId,
        "PUT",
        variantProductId,
        variantName,
        variantPrice,
        variantDiscountPrice,
        quantity,
        //restuarant_id,
      )
          .then((value) {
        return value;
      }).catchError((error) {
        switch (error.runtimeType) {
          case DioError:
            // Here's the sample to get the failed response error code and message
            final res = (error as DioError).response;
            print("Got error : ${res!.statusCode} -> ${res.statusMessage}");
            if (res.statusCode == 401) {
              Get.offAllNamed('/splash');
            }
            break;
          default:
            break;
        }
      });
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return BaseModel()..setException(Servererror.fromJson(error));
    }
    return BaseModel()..data = response;
  }

  Future<BaseModel<AddVariantResponse>> EditVariantStatus(String variantId, String status) async {
    AddVariantResponse response;

    try {
      response = await apiClient!
          .EditVariantStatus(variantId, "PUT", status
              //restuarant_id,
              )
          .then((value) {
        return value;
      }).catchError((error) {
        switch (error.runtimeType) {
          case DioError:
            // Here's the sample to get the failed response error code and message
            final res = (error as DioError).response;
            print("Got error : ${res!.statusCode} -> ${res.statusMessage}");
            if (res.statusCode == 401) {
              Get.offAllNamed('/splash');
            }
            break;
          default:
            break;
        }
      });
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return BaseModel()..setException(Servererror.fromJson(error));
    }
    return BaseModel()..data = response;
  }

  Future<BaseModel<AddEditAddonCategoryItemResponse>> AddAddonCategoryItem(
    String name,
    String price,
    String categoryId,
  ) async {
    AddEditAddonCategoryItemResponse response;
    try {
      response = await apiClient!.AddAddonCategoryItem(
        name,
        price,
        categoryId,
      );
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return BaseModel()..setException(Servererror.fromJson(error));
    }
    return BaseModel()..data = response;
  }

  Future<BaseModel<EditAddonResponse>> EditAddonCategoryItem(String name, String price, String categoryItemId, String id) async {
    EditAddonResponse response;
    try {
      response = await apiClient!.EditAddonCategoryItem(
        id,
        name,
        price,
        categoryItemId,
      );
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return BaseModel()..setException(Servererror.fromJson(error));
    }
    return BaseModel()..data = response;
  }

  Future<BaseModel<DeleteResponse>> DeleteAddonCategory(String categoryId) async {
    DeleteResponse response;

    try {
      response = await apiClient!.DeleteAddonCategory(categoryId);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return BaseModel()..setException(Servererror.fromJson(error));
    }
    return BaseModel()..data = response;
  }

  Future<BaseModel<DeleteResponse>> DeleteAddonCategoryItem(String categoryItemId) async {
    DeleteResponse response;

    try {
      response = await apiClient!.DeleteAddonCategoryItem(categoryItemId);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return BaseModel()..setException(Servererror.fromJson(error));
    }
    return BaseModel()..data = response;
  }

  Future<BaseModel<AddImageResponse>> AddItemImage(
    String type,
    List<File> images,
  ) async {
    print("addcatee");
    //dio!.options.headers.addAll({"Authorization": "Bearer $accessToken"});
    AddImageResponse response;
    try {
      response = await apiClient!.AddItemImage(
        type,
        images,
      );
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return BaseModel()..setException(Servererror.fromJson(error));
    }
    return BaseModel()..data = response;
  }

  Future<BaseModel<DeleteResponse>> DeleteImage(String image) async {
    DeleteResponse response;

    try {
      response = await apiClient!.DeleteImage(image);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return BaseModel()..setException(Servererror.fromJson(error));
    }
    return BaseModel()..data = response;
  }
}
