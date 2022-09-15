import 'dart:async';
import 'dart:io';

import 'package:date_format/date_format.dart';
import 'package:dio/dio.dart' as di;
// import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:sooooperbusiness/api/repository/inventoryrepo.dart';
import 'package:sooooperbusiness/commons/constant.dart';
import 'package:sooooperbusiness/commons/sessionmanager.dart';
import 'package:sooooperbusiness/commons/utils.dart';
import 'package:sooooperbusiness/controllers/maincontroller.dart';
import 'package:sooooperbusiness/controllers/offercontroller.dart';
import 'package:sooooperbusiness/model/more/inventory/category.dart';
import 'package:file_picker/file_picker.dart';
import 'package:sooooperbusiness/model/more/inventory/getcategoryresponse.dart';
import 'package:sooooperbusiness/model/more/inventory/getitemresponse.dart';
import 'package:sooooperbusiness/model/more/inventory/product.dart';
import 'package:sooooperbusiness/model/more/inventory/productCategory.dart';
import 'package:sooooperbusiness/model/more/inventory/productCategoryResponse.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sooooperbusiness/model/more/inventory/variantResponse.dart';
import 'package:sooooperbusiness/views/dashboard/navigationscreens/More/Inventory/tabs/subcategory.dart';

class InventoryController extends GetxController {
  RxList<bool> acceptOrders = List.filled(10000, false).obs;
  RxString accessToken = "".obs;
  File? Image = null;
  File? file;
  File? file2;
  RxString idType = "Image".obs;
  RxBool ImageSelected = false.obs;
  AppState? state;
  ImagePicker picker = ImagePicker();
  RxBool? isLoading = true.obs;
  RxList<String>? item = <String>[].obs;
  // RxList<String>? parentList = <String>[].obs;
  TextEditingController parentController = TextEditingController();
  RxBool? isHidden = false.obs;

  //TextEditingController restaurant_idController = TextEditingController();
  // TextEditingController nameController = TextEditingController();
  TextEditingController categoryNameController = TextEditingController();
  final addcategoryformKey = GlobalKey<FormState>();
  final additemformkey = GlobalKey<FormState>();

  List<MultiSelectItem> categoryselectionlist = [];
  // List<Category> allParentCategory = [];
  RxList<ProductCategory> allProductCategory = [ProductCategory()].obs;

  RxList<ProductCategory> allProductCategoryTemp = [ProductCategory()].obs;

  RxString selectedProductCategory = "".obs;
  List<String> productType = ["simple", "variable", "customizable"];
  RxString selectedProductType = "".obs;
  List<String> productTags = ["veg", "non-veg", "other"];
  RxString selectedProductTag = "".obs;
  List<String> productUnits = ["gram", "kg", "liter", "piece"];
  RxString selectedProductUnit = "".obs;
  Rx<File> selectedProductImage = File("").obs;
  RxBool isProductImageSelected = false.obs;
  Rx<ProductCategory> selectedProductParentCategory = ProductCategory().obs;
  // List<MultiSelectItem> allcategoryselectionlist = [];
  RxList? selectedCategory = [].obs;
  RxList? selectedCategory2 = [].obs;
  RxList? imageEditData = [].obs;
  RxString parentName = "Chinese".obs;
  RxList<String> parentid = [""].obs;
  RxList<String> selectedAddOnsID = [""].obs;
  RxString? parent2 = "Chinese".obs;
  RxString? parentId = "none".obs;
  RxString? parentId2 = "none".obs;
  InventoryRepo Categories = InventoryRepo();
  RxBool FileSelected1 = false.obs;
  RxBool FileSelected2 = false.obs;
  TextEditingController productNameController = TextEditingController();
  TextEditingController productDescriptionController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();
  TextEditingController productSalePriceController = TextEditingController();
  TextEditingController productQuantityController = TextEditingController();
  RxBool isActive = false.obs;
  Rx<GetProductResponse> itemData = GetProductResponse().obs;
  Rx<ProductCategoryResponse> productCategoryData = ProductCategoryResponse().obs;
  Rx<ProductCategoryResponse> allcategoryData = ProductCategoryResponse().obs;
  Rx<ProductCategoryResponse> productSubCategoryData = ProductCategoryResponse().obs;
  RxList<ProductCategory> subCategoryDataList = [ProductCategory()].obs;
  OfferController offerController = Get.put(OfferController());

  Rx<VariantResponse> variantData = VariantResponse().obs;
  RxMap<String, dynamic> subCategoryData = {"": []}.obs;

  //GetItemResponse? itemData;
  MainController mainController = Get.find();
  RxList? selectedGalleryImage = [].obs;
  RxList? selectedGalleryEditImage = [].obs;

  RxString categoryId = "".obs;
  RxInt sec = 0.obs;
  ScrollController itemScrollController = new ScrollController();
  int itemNextPage = 1;
  RxString cat = "".obs;
  RxBool isPageLoading = false.obs;
  final RxList<Product> itemList = [Product()].obs;
  final RxList<Product> tempItemList = [Product()].obs;
  RxBool showDrop = false.obs;

  List<String> isHiddenList = [
    "true",
    "false",
  ];

  RxString selectedParentSubcategory = "".obs;
  RxString selectedSubCategory = "".obs;
  Rx<File> selectedCategoryImage = File("").obs;
  RxBool isCategoryImageSelected = false.obs;
  RxBool isLoadingSubCategory = true.obs;
  RxList? selectedAddon = [].obs;

  TextEditingController selectedOpenTimeController = TextEditingController();
  TextEditingController selectedCloseTimeController = TextEditingController();
  TimeOfDay selectedTime = TimeOfDay(hour: 00, minute: 00);

  // RxList itemSubCategoryList = [].obs;

  @override
  Future<void> onInit() async {
    SessionManager.getAccessToken().then((value) {
      print(value);
      // if(value == null){
      //   accessToken.value = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2MGUyYmI5M2QxNjY1NDAwMjAzYmM5OTYiLCJpYXQiOjE2MjY0MzYwMzIsImV4cCI6MTY4NjQzNTk3MiwidHlwZSI6ImFjY2VzcyJ9.ItdcYc2hABPj9aYSVz0ziQYN7QKGhPLkuKFqxmZpIsQ";
      //   GetCategory(accessToken.value);
      // }else{
      //   accessToken.value = value;
      //   //GetCategory(accessToken.value);
      //   GetCategory("eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2MGUyYmI5M2QxNjY1NDAwMjAzYmM5OTYiLCJpYXQiOjE2MjY0MzYwMzIsImV4cCI6MTY4NjQzNTk3MiwidHlwZSI6ImFjY2VzcyJ9.ItdcYc2hABPj9aYSVz0ziQYN7QKGhPLkuKFqxmZpIsQ");
      // }
      accessToken.value = value!;
    });
    super.onInit();
    print("getacccc");
    print(accessToken);
    itemScrollController.addListener(() {
      if (itemScrollController.position.pixels == itemScrollController.position.maxScrollExtent) {
        // if (itemData.value.data!.page != itemData.value.data!.totalPages) {
        itemNextPage++;
        print("Scrolled");
        GetItem(cat.value, itemNextPage);
        // }
      }
    });
    GetVariant();
    GetItem("All", 1);
  }

  void runFilter(String enteredKeyword) {
    tempItemList.clear();
    update();
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      tempItemList.value.addAll(itemList.value);
      update();
    } else {
      tempItemList.value = itemList.where((item) => item.name!.toLowerCase().contains(enteredKeyword.toLowerCase())).toList();
      print(tempItemList.value);
      update();
      // we use the toLowerCase() method to make it case-insensitive
    }
    update();

    // Refresh the UI
  }

  void runFilterCategory(String enteredKeyword) {
    allProductCategoryTemp.clear();
    update();
    if (enteredKeyword.isEmpty) {
      print("in if");
      // if the search field is empty or only contains white-space, we'll display all users
      allProductCategoryTemp.value.addAll(allProductCategory.value);
      update();
    } else {
      allProductCategoryTemp.value = allProductCategory.where((item) => item.name!.toLowerCase().contains(enteredKeyword.toLowerCase())).toList();
      update();
      // we use the toLowerCase() method to make it case-insensitive
    }
    update();

    // Refresh the UI
  }

  // void getSubCategoryBYCategory(String categoryId) {
  //   isLoadingSubCategory.value = true;
  //   Categories.getSubCategory(accessToken.value,
  //           mainController.selectedStore.value.id.toString(), categoryId)
  //       .then((value) {
  //     subCategoryData[categoryId] = value.data!.data!.results;
  //     print("Data Subcategory" + subCategoryData[categoryId].toString());
  //     isLoadingSubCategory.value = false;
  //     update();
  //   });
  // }

  Future<void> pickGalleryImages() async {
    final selected = await picker.pickMultiImage(maxHeight: 1000, maxWidth: 1000);
    if (selected == null) {
      state == AppState.free;
      return;
    } else if (selected.length == 0) {
      state == AppState.free;
      return;
    } else {
      for (int i = 0; i < selected.length; i++) {
        selectedGalleryImage!.add(File(selected.elementAt(i).path));
      }
      state = AppState.free;
      update();
    }
  }

  Future<void> pickGalleryImagesEdit() async {
    selectedGalleryEditImage!.clear();
    final selected = await picker.pickMultiImage(maxHeight: 1000, maxWidth: 1000);
    if (selected == null) {
      state == AppState.free;
      return;
    } else if (selected.length == 0) {
      state == AppState.free;
      return;
    } else {
      for (int i = 0; i < selected.length; i++) {
        print("assing");
        selectedGalleryEditImage!.add(File(selected.elementAt(i).path));
      }
      update();
      AddItemImage();
      state = AppState.free;
    }
  }

  Future<void> filepicker(String state) async {
    print("file picker");
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
    );
    if (result == null) return;
    if (result != null) {
      if (state == "category") {
        FileSelected1.value = true;
        file = File(result.files.single.path!);
      } else {
        FileSelected2.value = true;
        file2 = File(result.files.single.path!);
      }
    } else {
      // User canceled the picker
    }
  }

  Future<File> pickImage() async {
    final selected = await picker.getImage(source: ImageSource.gallery);
    if (selected == null) return File("");
    if (idType.value == "Image") {
      selectedProductImage.value = File(selected.path);
      isProductImageSelected.value = true;
      isCategoryImageSelected.value = true;
      state = AppState.picked;
      update();
      return _cropImage(selectedProductImage.value);
    } else {
      return File("");
    }
  }

  Future<File> getImage({required String url}) async {
    /// Get Image from server
    final di.Response<List<int>> res = await di.Dio().get<List<int>>(
      url,
      options: di.Options(
        responseType: di.ResponseType.bytes,
      ),
    );

    /// Get App local storage
    final Directory appDir = await getApplicationDocumentsDirectory();

    /// Generate Image Name
    final String imageName = url.split('/').last;

    /// Create Empty File in app dir & fill with new image
    final File file = File(join(appDir.path, imageName));

    file.writeAsBytesSync(res.data as List<int>);

    return file;
  }

  Future<File> _cropImage(File image) async {
    File? croppedFile = (await ImageCropper().cropImage(
      sourcePath: image.path,
      aspectRatioPresets: Platform.isAndroid
          ? [CropAspectRatioPreset.square, CropAspectRatioPreset.ratio3x2, CropAspectRatioPreset.original, CropAspectRatioPreset.ratio4x3, CropAspectRatioPreset.ratio16x9]
          : [
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.square,
              CropAspectRatioPreset.ratio3x2,
              CropAspectRatioPreset.ratio4x3,
              CropAspectRatioPreset.ratio5x3,
              CropAspectRatioPreset.ratio5x4,
              CropAspectRatioPreset.ratio7x5,
              CropAspectRatioPreset.ratio16x9
            ],
      androidUiSettings: AndroidUiSettings(toolbarTitle: 'Cropper', toolbarColor: Constant.secondaryColor, toolbarWidgetColor: Colors.white, initAspectRatio: CropAspectRatioPreset.ratio16x9, lockAspectRatio: true),
      iosUiSettings: IOSUiSettings(
        title: 'Cropper',
      ),
    ));
    if (croppedFile != null) {
      if (idType.value == "Image") {
        selectedProductImage.value = croppedFile;
      }
      state = AppState.cropped;
      update();
    }
    return croppedFile!;
  }

  GetProductCategory(String accesstoken) async {
    isLoading!.value = true;
    //Utility.showLoadingDialog();
    print(accesstoken);
    print("getCategoryshadddd");

    Categories.GetProductCategory(accesstoken, Constant.isEcom == "0" ? mainController.selectedStore.value.id.toString() : mainController.adminStore.value.id.toString(), "0").then((value) {
      print("get only parent category");
      Utility.hideLoadingDialog();
      print(value);
      print(value.data!.message);
      if (value.data!.message == "Retrieved Successfully") {
        var result = value.data!.data!;
        productCategoryData.value = value.data!;
        //var result = Category();
        print("getCategoryshdfa");
        print(result.length);
        item!.clear();
        // parentList!.clear();
        allProductCategory.value = productCategoryData.value.data!;
        allProductCategoryTemp.value = productCategoryData.value.data!;
        print("Product ==== >>>>>>${allProductCategory.value} =====>>>>>${productCategoryData.value.data!.toString()}");
        print("all Category List" + allProductCategory.join(","));
        allProductCategory.forEach((element) async {
          // Categories.getSubCategory(
          //     accesstoken,
          //     mainController.selectedStore.value.id.toString(),
          //     element.id!)
          //     .then((value) {
          //   subCategoryData[element.id!] = value.data!.data!.results;
          //   print("Data Subcategory" + subCategoryData[element.id!].toString());
          //   update();
          // });
        });
        update();
        // categoryselectionlist = productCategoryData.value.data!.results!
        //     .map((item) => MultiSelectItem<Category>(item, item.name!))
        //     .toList();
        update();

        // for (var i = 0; i < result.length; i++) {
        //   showDrop.value = true;
        //
        //   print(result[i].name.toString());
        //   item!.add(result[i].name.toString());
        //   parentList!.add(result[i].id.toString());
        //   //item!.value = result[i].name;//.toString() as List<String>;
        // }
        print(item!);
        print("addcaat");
        isLoading!.value = false;
        // Utility.showToastSuccess("Success", value.data!.message);
        // Get.to(InventoryPage());
        update();
        return true;
      } else {
        //Utility.showToastError(value.error!.message, "Registration Failed");
        return false;
      }
    }).catchError((error) {
      Utility.hideLoadingDialog();
      print(error);
      printInfo(info: "Error From Controllers");
    });
  }

  Future<bool> GetProductSubCategory(String parentCategoryId) async {
    isLoading!.value = true;
    productSubCategoryData.value = ProductCategoryResponse();
    subCategoryDataList.value.clear();

    //Utility.showLoadingDialog();

    print(accessToken.value);
    print("getCategoryshadddd");

    final value = await Categories.GetProductCategory(
      accessToken.value,
      Constant.isEcom == "0" ? mainController.selectedStore.value.id.toString() : mainController.adminStore.value.id.toString(),
      parentCategoryId,
    ).catchError((error) {
      Utility.hideLoadingDialog();
      print("in error");
      print(error);
      printInfo(info: "Error From Controllers");
      return false;
    });

    print("get only parent category");
    Utility.hideLoadingDialog();
    print(value);
    print(value.data!.message);
    if (value.data!.message == "Retrieved Successfully") {
      var result = value.data!.data!;
      productSubCategoryData.value = value.data!;
      subCategoryDataList.value = value.data!.data!;
      //var result = Category();
      print("getCategoryshdfa");
      print(result.length);
      item!.clear();
      // parentList!.clear();
      update();
      print(item!);
      print("addcaat");
      isLoading!.value = false;
      return true;
    } else {
      return false;
    }
  }

  GetVariant() async {
    isLoading!.value = true;

    print(accessToken.value);
    print("getCategoryshadddd");
    String ownerId = "";
    SessionManager.getEcomStroeId().then((value) {
      ownerId = value!;
      print("--> --> ${mainController.selectedStore.value.id.toString()} ");
      Categories.GetProductVariant(
        accessToken.value,
        Constant.isEcom == "0" ? mainController.selectedStore.value.id.toString() : ownerId.toString(),
      ).then((value) {
        Utility.hideLoadingDialog();
        print(value);
        print(value.data!.message);
        if (value.data!.message == "Retrieved Successfully") {
          var result = value.data!.data!;
          variantData.value = value.data!;

          update();

          isLoading!.value = false;

          return true;
        } else {
          //Utility.showToastError(value.error!.message, "Registration Failed");
          return false;
        }
      }).catchError((error) {
        Utility.hideLoadingDialog();
        print(error);
        printInfo(info: "Error From Controllers");
      });
    });
    //
  }

  // GetCategory(String accesstoken) async {
  //   isLoading!.value = true;
  //
  //   print(item!);
  //   //Utility.showLoadingDialog();
  //
  //   print(accesstoken);
  //   print("getCategorysha");
  //
  //   Categories.GetCategory(
  //     accesstoken,
  //     mainController.selectedStore.value.id.toString(),
  //   ).then((value) {
  //     print("get only parent category");
  //     Utility.hideLoadingDialog();
  //     print(value);
  //     print(value.data!.message);
  //     if (value.data!.message == "Categories fetched successfully") {
  //       var result = value.data!.data!.results;
  //       categoryData.value = value.data!;
  //       //var result = Category();
  //       print("getCategorysha");
  //       print(result!.length);
  //       item!.clear();
  //       parentList!.clear();
  //       allParentCategory = categoryData.value.data!.results!;
  //       print("all Category List" + allParentCategory.join(","));
  //       allParentCategory.forEach((element) async {
  //         Categories.getSubCategory(
  //                 accesstoken,
  //                 mainController.selectedStore.value.id.toString(),
  //                 element.id!)
  //             .then((value) {
  //           subCategoryData[element.id!] = value.data!.data!.results;
  //           print("Data Subcategory" + subCategoryData[element.id!].toString());
  //           update();
  //         });
  //       });
  //       update();
  //       categoryselectionlist = categoryData.value.data!.results!
  //           .map((item) => MultiSelectItem<Category>(item, item.name!))
  //           .toList();
  //       update();
  //
  //       for (var i = 0; i < result.length; i++) {
  //         showDrop.value = true;
  //
  //         print(result[i].name.toString());
  //         item!.add(result[i].name.toString());
  //         parentList!.add(result[i].id.toString());
  //         //item!.value = result[i].name;//.toString() as List<String>;
  //       }
  //       print(item!);
  //       print("addcaat");
  //       isLoading!.value = false;
  //       Utility.showToastSuccess("Success", value.data!.message);
  //
  //       // Get.to(InventoryPage());
  //       return true;
  //     } else {
  //       //Utility.showToastError(value.error!.message, "Registration Failed");
  //       return false;
  //     }
  //   }).catchError((error) {
  //     Utility.hideLoadingDialog();
  //     print(error);
  //     printInfo(info: "Error From Controllers");
  //   });
  // }

  // GetAllCategory(String accesstoken) async {
  //   isLoading!.value = true;
  //
  //   print(item!);
  //
  //   //Utility.showLoadingDialog();
  //
  //   print(accesstoken);
  //   print("getCategorysha");
  //
  //   await Categories.GetAllCategory(
  //     accesstoken,
  //     mainController.selectedStore.value.id.toString(),
  //   ).then((value) {
  //     Utility.hideLoadingDialog();
  //     print(value);
  //     print(value.data!.message);
  //     if (value.data!.message == "Categories fetched successfully") {
  //       var result = value.data!.data!.results;
  //       allcategoryData.value = value.data!;
  //       //var result = Category();
  //       print("getCategorysha");
  //       print(result!.length);
  //       item!.clear();
  //       parentList!.clear();
  //       allcategoryselectionlist = allcategoryData.value.data!.results!
  //           .map((item) => MultiSelectItem<Category>(item, item.name!))
  //           .toList();
  //       update();
  //
  //       for (var i = 0; i < result.length; i++) {
  //         showDrop.value = true;
  //
  //         print(result[i].name.toString());
  //         item!.add(result[i].name.toString());
  //         parentList!.add(result[i].id.toString());
  //
  //         //item!.value = result[i].name;//.toString() as List<String>;
  //       }
  //       print(item!);
  //       print("addcaat");
  //       isLoading!.value = false;
  //       //Utility.showToastSuccess("Success", value.data!.message);
  //
  //       // Get.to(InventoryPage());
  //       return true;
  //     } else {
  //       Utility.showToastError(value.error!.message, "Registration Failed");
  //       return false;
  //     }
  //   }).catchError((error) {
  //     Utility.hideLoadingDialog();
  //     print(error);
  //     printInfo(info: "Error From Controllers");
  //   });
  // }

  // AddCategory(String isHidden, String parent) {
  //   Utility.showLoadingDialog();
  //   if (parent == "null") {
  //     parentController.text = "";
  //   } else {
  //     parentController.text = parent;
  //   }
  //   print(parentController.text);
  //   print('space');
  //   Categories.AddCategory(
  //           accessToken.value,
  //           //"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2MGYyNmM2ZjQ0YjBmODAwMjAwZjMwZmIiLCJpYXQiOjE2MjY1MDAyMjAsImV4cCI6MTY4NjUwMDE2MCwidHlwZSI6ImFjY2VzcyJ9.xVIuSiuyhx2FkSwq7xPjsHQCt0gUtoLu6L1ouOqJkHw",
  //           nameController.value.text,
  //           File(""),
  //           isHidden,
  //           // restaurant_idController.value.text,
  //           mainController.selectedStore.value.id.toString(),
  //           // parent,
  //           parentController.value.text)
  //       .then((value) {
  //     Utility.hideLoadingDialog();
  //     print("success");
  //     print(value);
  //     print("add cat");
  //     if (value.data != null) {
  //       print("mess");
  //       Utility.showToastSuccess("Success", value.data!.message);
  //       GetCategory(accessToken.value);
  //       Get.back();
  //       Get.back();
  //
  //       //Get.to(InventoryPage());
  //       return true;
  //     } else {
  //       Utility.showToastError(value.error!.message, "Registration Failed");
  //       return false;
  //     }
  //
  //     printInfo(info: "Data from Auth Controller");
  //   }).catchError((error) {
  //     Utility.hideLoadingDialog();
  //     print(error);
  //     printInfo(info: "Error From Controllers");
  //   });
  // }

  ImportCategory() {
    Utility.showLoadingDialog();
    Categories.ImportCategory(accessToken.value, Constant.isEcom == "0" ? mainController.selectedStore.value.id.toString() : mainController.adminStore.value.id.toString(), file).then((value) {
      Utility.hideLoadingDialog();
      if (value.data != null) {
        print("mess");
        // Utility.showToastSuccess("Success", value.data!.message);
        file = null;
        FileSelected1.value = false;
        //Get.back();

        //Get.to(InventoryPage());
        return true;
      } else {
        Utility.showToastError(value.error!.message, "Failed");
        return false;
      }

      printInfo(info: "Data from Auth Controller");
    }).catchError((error) {
      Utility.hideLoadingDialog();
      Utility.showToastError("API error", "Registration Failed");
      print(error);
      printInfo(info: "Error From Controllers");
    });
  }

  ImportItems() {
    Utility.showLoadingDialog();
    Categories.ImportItems(accessToken.value, Constant.isEcom == "0" ? mainController.selectedStore.value.id.toString() : mainController.adminStore.value.id.toString(), file2).then((value) {
      Utility.hideLoadingDialog();
      if (value.data != null) {
        print("mess");
        // Utility.showToastSuccess("Success", value.data!.message);
        file2 = null;
        FileSelected1.value = false;
        //Get.back();

        //Get.to(InventoryPage());
        return true;
      } else {
        Utility.showToastError(value.error!.message, "Registration Failed");
        return false;
      }

      printInfo(info: "Data from Auth Controller");
    }).catchError((error) {
      Utility.hideLoadingDialog();
      Utility.showToastError("API error", "Registration Failed");
      print(error);
      printInfo(info: "Error From Controllers");
    });
  }

  AddProductWithoutImage() {
    Utility.showLoadingDialog();
    // List<File> gallerySelection = List.empty(growable: true);
    // if (selectedGalleryImage!.isNotEmpty) {
    //   for (int i = 0; i < selectedGalleryImage!.length; i++) {
    //     if (selectedGalleryImage!.elementAt(i) != null) {
    //       gallerySelection.add(selectedGalleryImage!.elementAt(i));
    //     }
    //   }
    // }
    // parentid.clear();
    // parentid.add(selectedParentSubcategory.value);
    // parentid.add(selectedSubCategory.value);
    // selectedAddOnsID.clear();
    // if (selectedAddon!.isNotEmpty) {
    //   selectedAddon!.forEach((element) {
    //     selectedAddOnsID.add(element);
    //   });
    // }
    update();

    Categories.AddProductWithoutImage(
      //accessToken.value,
      Constant.isEcom == "0" ? mainController.selectedStore.value.id.toString() : mainController.adminStore.value.id.toString(),
      selectedProductType.value,
      productNameController.value.text,
      productDescriptionController.value.text,
      // selectedProductImage.value,
      selectedProductUnit.value,
      productPriceController.value.text,
      productSalePriceController.value.text,
      selectedProductCategory.value,
      productQuantityController.value.text,
      selectedProductTag.value,
      (isActive.value) ? "1" : "0",
      selectedOpenTimeController.text,
      selectedCloseTimeController.text,
    ).then((value) {
      print(value);
      Utility.hideLoadingDialog();
      print("succc");
      print(value);
      print("addcaat");
      print(value);
      if (value.data != null) {
        print("mess");
        Get.back();
        // Utility.showToastSuccess("Success", value.data!.message);
        productNameController.text = "";
        productDescriptionController.text = "";
        productPriceController.text = "";
        productSalePriceController.text = "";
        selectedProductType.value = "";
        // selectedProductImage.value = File("");
        selectedProductUnit.value = "";
        selectedProductCategory.value = "";
        productQuantityController.text = "";
        selectedProductTag.value = "";
        isActive.value = false;
        itemList.add(value.data!.data!);
        tempItemList.add(value.data!.data!);
        // GetItem("All", 1);

        //Get.to(InventoryPage());
        return true;
      } else {
        Utility.showToastError(value.error!.message, " Failed");
        return false;
      }

      printInfo(info: "Data from Auth Controller");
    }).catchError((error) {
      Utility.hideLoadingDialog();
      print("below is type");
      print(error.runtimeType);

      print("errorr");
      print((error.toString()));
      printInfo(info: "Error From Controllers");
    });
  }

  AddProduct() {
    Utility.showLoadingDialog();
    update();
    print("-->@->");
    print("${mainController.selectedStore.value.id.toString()}");
    print("${mainController.adminStore.value.id.toString()}");
    Categories.AddProduct(
            //accessToken.value,
            Constant.isEcom == "0" ? mainController.selectedStore.value.id.toString() : mainController.adminStore.value.id.toString(),
            selectedProductType.value,
            productNameController.value.text,
            productDescriptionController.value.text,
            selectedProductImage.value,
            selectedProductUnit.value,
            productPriceController.value.text,
            productSalePriceController.value.text,
            selectedProductCategory.value,
            productQuantityController.value.text,
            selectedProductTag.value,
            (isActive.value) ? "1" : "0",
            selectedOpenTimeController.text,
            selectedCloseTimeController.text,
            offerController.selectedCoupons!)
        .then((value) {
      print(value);
      Utility.hideLoadingDialog();
      print("succc");
      print(value);
      print("addcaat");
      print(value);
      if (value.data != null) {
        print("mess");
        Get.back();
        Get.back();
        // Utility.showToastSuccess("Success", value.data!.message);
        productNameController.text = "";
        productDescriptionController.text = "";
        productPriceController.text = "";
        // productSalePriceController.text = "";
        selectedProductType.value = "";
        selectedProductImage.value = File("");
        selectedProductUnit.value = "";
        selectedProductCategory.value = "";
        productQuantityController.text = "";
        selectedProductTag.value = "";
        isActive.value = false;
        itemList.add(value.data!.data!);
        // GetItem("All", 1);

        //Get.to(InventoryPage());
        return true;
      } else {
        Utility.showToastError(value.error!.message, " Failed");
        return false;
      }

      printInfo(info: "Data from Auth Controller");
    }).catchError((error) {
      Utility.hideLoadingDialog();
      print("below is type");
      print(error.runtimeType);

      print("errorr");
      print((error.toString()));
      printInfo(info: "Error From Controllers");
    });
  }

  AddProductCategory() {
    Utility.showLoadingDialog();
    update();
    Categories.AddProductCategory(
            //accessToken.value,
            categoryNameController.value.text,
            selectedCategoryImage.value,
            Constant.isEcom == "0" ? mainController.selectedStore.value.id.toString() : mainController.adminStore.value.id.toString(),
            (selectedProductParentCategory.value.id == null) ? "0" : selectedProductParentCategory.value.id.toString())
        .then((value) {
      Utility.hideLoadingDialog();
      print("succc");
      print(value.data!.data!.toJson());
      print("addcaat");
      if (value.data != null) {
        print("mess");
        Get.back();
        Get.back();
        // Utility.showToastSuccess("Success", value.data!.message);
        if (mainController.selectedStore.value.id.toString() != "0" || mainController.adminStore.value.id.toString() != "0") {
          allProductCategory.add(value.data!.data!);
          print("SaveButton4");
          print(allProductCategory[1].toJson());
          allProductCategoryTemp.add(value.data!.data!);
          GetProductCategory(accessToken.value);
        } else {
          print("in aadd");
          Get.back();
          subCategoryDataList.add(value.data!.data!);
          // GetProductSubCategory(mainController.selectedStore.value.id.toString()).then((value) {
          //   print("after tehn");
          //   print(value);
          //   if(value){
          //     // Get.back();
          //     Get.to(Subcategory());
          //   }
          // });
          // GetProductSubCategory(mainController.selectedStore.value.id.toString());
        }
        // Get.back();
        //Get.to(InventoryPage());
        return true;
      } else {
        Utility.showToastError(value.error!.message, " Failed");
        return false;
      }

      printInfo(info: "Data from Auth Controller");
    }).catchError((error) {
      Utility.hideLoadingDialog();
      print("errorr");
      print(error);
      printInfo(info: "Error From Controllers");
    });
  }

  GetItem(String category, int page) async {
    print(page);
    // Utility.showLoadingDialog();
    isLoading!.value = true;
    if (item!.length == 0) {
      sec.value = 4;
    } else {
      sec.value = 0;
    }

    // if(page == 1){
    //
    //   itemList.clear()
    //   print("getgg");
    //   isPageLoading.value = false;
    // }

    if (page != 1) {
      isPageLoading.value = true;
    }
    Timer(Duration(seconds: sec.value), () async {
      for (var i = 0; i < item!.length; i++) {
        if (item![i] == category) {
          // categoryId.value = parentList![i];
        }
      }
      print(categoryId.value);
      print("getget");
      print(category);
      print(mainController.selectedStore.value.id.toString());
      if (category == "All") {
        print("getget");
        await Categories.GetItem(Constant.isEcom == "0" ? mainController.selectedStore.value.id.toString() : mainController.adminStore.value.id.toString(), page).then((value) {
          Utility.hideLoadingDialog();
          print(value);
          print(value.data!.message);
          if (value.data!.message == "Retrieved Successfully") {
            itemData.value = value.data!;
            if (page == 1) {
              itemList.clear();
              tempItemList.clear();
              isPageLoading.value = false;
            }
            itemList.addAll(value.data!.data!.data!);
            tempItemList.addAll(value.data!.data!.data!);

            print(itemList.length);

            var result = value.data!.data!;
            //var result = Category();
            print("debugging");
            // print(result[0].name);
            isLoading!.value = false;
            //Utility.showToastSuccess("Success", value.data!.message);

            // Get.to(InventoryPage());
            return value;
          } else {
            Utility.showToastError(value.error!.message, "Registration Failed");
            return false;
          }
        }).catchError((error) {
          Utility.hideLoadingDialog();
          print(error);
          printInfo(info: "Error From Controllers");
        });
      } else {
        Categories.GetItemByCategory(Constant.isEcom == "0" ? mainController.selectedStore.value.id.toString() : mainController.adminStore.value.id.toString(), categoryId.value, page).then((value) {
          Utility.hideLoadingDialog();
          print(value);
          print(value.data!.message);
          if (value.data!.message == "Items fetched successfully") {
            print("assiggn");
            itemData.value = value.data!;
            print(itemData.toString());
            if (page == 1) {
              itemList.clear();
              tempItemList.clear();
              print("getgg");
              isPageLoading.value = false;
            }
            print("checkoo");
            itemList.addAll(value.data!.data!.data!);
            tempItemList.addAll(value.data!.data!.data!);

            var result = value.data!.data!.data!;
            //var result = Category();
            print(result.length);

            print(result[1].name);
            isLoading!.value = false;
            // Utility.showToastSuccess("Success", value.data!.message);

            // Get.to(InventoryPage());
            return value;
          } else {
            Utility.showToastError(value.error!.message, "Registration Failed");
            return false;
          }
        }).catchError((error) {
          Utility.hideLoadingDialog();
          print(error);
          printInfo(info: "Error From Controllers");
        });
      }
    });
  }

  Future<String> selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null) {
      print(formatDate(DateTime(2019, 08, 1, picked.hour, picked.minute), [hh, ':', nn, " ", am]).toString());
      return formatDate(DateTime(2019, 08, 1, picked.hour, picked.minute), [hh, ':', nn, " ", am]).toString();
    } else {
      return "";
    }
  }

  DeleteItem(String itemId, String category) {
    //Utility.showLoadingDialog();

    print(parentController.text);
    print('space');
    Categories.DeleteItem(
      //"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2MGYyNmM2ZjQ0YjBmODAwMjAwZjMwZmIiLCJpYXQiOjE2MjY1MDAyMjAsImV4cCI6MTY4NjUwMDE2MCwidHlwZSI6ImFjY2VzcyJ9.xVIuSiuyhx2FkSwq7xPjsHQCt0gUtoLu6L1ouOqJkHw",
      // restaurant_idController.value.text,
      itemId,
    ).then((value) {
      // Utility.hideLoadingDialog();
      print("succc");
      print(value);
      print("addcaat");
      if (value.data!.message == "Items deleted successfully") {
        print("mess");
        GetItem(category, 1);

        return true;
      } else {
        Utility.showToastError(value.error!.message, "Registration Failed");
        return false;
      }

      printInfo(info: "Data from Auth Controller");
    }).catchError((error) {
      Utility.hideLoadingDialog();
      print(error);
      printInfo(info: "Error From Controllers");
    });
  }

  DeleteCategory(String categoryId) {
    //Utility.showLoadingDialog();

    print(parentController.text);
    print('space');
    Categories.DeleteCategory(
      categoryId,
    ).then((value) {
      // Utility.hideLoadingDialog();
      print("succc");
      print(value);
      print("addcaat");
      if (value.data!.message == "Category deleted successfully") {
        print("mess");
        GetProductCategory(accessToken.value);

        return true;
      } else {
        Utility.showToastError(value.error!.message, "Registration Failed");
        return false;
      }

      printInfo(info: "Data from Auth Controller");
    }).catchError((error) {
      Utility.hideLoadingDialog();
      print(error);
      printInfo(info: "Error From Controllers");
    });
  }

  UpdateCategoryStatus(String isHidden, String categoryId) {
    //Utility.showLoadingDialog();

    print(parentController.text);
    print('space');
    print(categoryId);
    Categories.UpdateCategoryStatus(
      accessToken.value,
      isHidden,
      categoryId,
    ).then((value) {
      print("succc");
      print(value);
      print("addcaat");
      if (value.data != null) {
        print("mess");
        // Utility.showToastSuccess("Success", value.data!.message);
        GetProductCategory(accessToken.value);
        // GetAllCategory(accessToken.value);

        //Get.to(InventoryPage());
        return true;
      } else {
        Utility.showToastError(value.error!.message, "Registration Failed");
        return false;
      }

      printInfo(info: "Data from Auth Controller");
    }).catchError((error) {
      Utility.hideLoadingDialog();
      print(error);
      printInfo(info: "Error From Controllers");
    });
  }

  void EditProductWithoutImage(String productId, int index) {
    print("edit product function");
    print(productId);
    Utility.showLoadingDialog();
    update();
    Categories.EditProductWithoutImage(
      productId,
      //accessToken.value,
      Constant.isEcom == "0" ? mainController.selectedStore.value.id.toString() : mainController.adminStore.value.id.toString(),
      selectedProductType.value,
      productNameController.value.text,
      productDescriptionController.value.text,
      // selectedProductImage.value,
      selectedProductUnit.value,
      productPriceController.value.text,
      productSalePriceController.value.text,
      selectedProductCategory.value,
      productQuantityController.value.text,
      selectedProductTag.value,
      (isActive.value) ? "1" : "0",
      selectedOpenTimeController.text,
      selectedCloseTimeController.text,
    ).then((value) {
      Utility.hideLoadingDialog();
      print("succc");
      print(value);
      print("addcaat");
      if (value.data != null) {
        print("mess");
        Get.back();
        // Utility.showToastSuccess("Success", value.data!.message);
        productNameController.text = "";
        productDescriptionController.text = "";
        productPriceController.text = "";
        productSalePriceController.text = "";
        selectedProductType.value = "";
        selectedProductImage.value = File("");
        selectedProductUnit.value = "";
        selectedProductCategory.value = "";
        productQuantityController.text = "";
        selectedProductTag.value = "";
        isActive.value = false;
        // if(itemList.contains(value.data!.data!.id)){
        //   itemList.
        // }
        itemList[index] = value.data!.data!;
        tempItemList[index] = value.data!.data!;

        return true;
      } else {
        Utility.showToastError(value.error!.message, " Failed");
        return false;
      }

      printInfo(info: "Data from Auth Controller");
    }).catchError((error) {
      Utility.hideLoadingDialog();
      print("errorr");
      print(error);
      printInfo(info: "Error From Controllers");
    });
  }

  void EditProduct(String productId, int index) {
    print("edit product function");
    print(productId);
    Utility.showLoadingDialog();
    update();
    Categories.EditProduct(
      productId,
      //accessToken.value,
      Constant.isEcom == "0" ? mainController.selectedStore.value.id.toString() : mainController.adminStore.value.id.toString(),
      selectedProductType.value,
      productNameController.value.text,
      productDescriptionController.value.text,
      selectedProductImage.value = File(""),
      selectedProductUnit.value,
      productPriceController.value.text,
      productSalePriceController.value.text,
      selectedProductCategory.value,
      productQuantityController.value.text,
      selectedProductTag.value,
      (isActive.value) ? "1" : "0",
      selectedOpenTimeController.text,
      selectedCloseTimeController.text,
    ).then((value) {
      Utility.hideLoadingDialog();
      print("succc");
      print(value);
      print("addcaat");
      if (value.data != null) {
        print("mess");
        Get.back();
        // Utility.showToastSuccess("Success", value.data!.message);
        productNameController.text = "";
        productDescriptionController.text = "";
        productPriceController.text = "";
        productSalePriceController.text = "";
        selectedProductType.value = "";
        selectedProductImage.value = File("");
        selectedProductUnit.value = "";
        selectedProductCategory.value = "";
        productQuantityController.text = "";
        selectedProductTag.value = "";
        isActive.value = false;
        // if(itemList.contains(value.data!.data!.id)){
        //   itemList.
        // }
        itemList[index] = value.data!.data!;
        // GetItem("All", 1);

        // Get.back();

        //Get.to(InventoryPage());
        return true;
      } else {
        Utility.showToastError(value.error!.message, " Failed");
        return false;
      }

      printInfo(info: "Data from Auth Controller");
    }).catchError((error) {
      Utility.hideLoadingDialog();
      print("errorr");
      print(error);
      printInfo(info: "Error From Controllers");
    });
  }

  void EditProductStatus(String productId, bool status) {
    Utility.showLoadingDialog();
    // List<File> gallerySelection = List.empty(growable: true);
    // if (selectedGalleryImage!.isNotEmpty) {
    //   for (int i = 0; i < selectedGalleryImage!.length; i++) {
    //     if (selectedGalleryImage!.elementAt(i) != null) {
    //       gallerySelection.add(selectedGalleryImage!.elementAt(i));
    //     }
    //   }
    // }
    // if (parentid2.length <= 0) {
    //   parentid2.value = ["0"];
    // }
    // print("MMM");
    // parentid.clear();
    // parentid.add(selectedParentSubcategory.value);
    // print("MM");
    // parentid.add(selectedSubCategory.value);
    // print("MMM1");
    // selectedAddOnsID.clear();
    // print("MM2");
    // if (selectedAddon!.isNotEmpty) {
    //   selectedAddon!.forEach((element) {
    //     print("M/4M");
    //     print(element);
    //     if (element != null) {
    //       selectedAddOnsID.add(element);
    //     }
    //
    //     print("M/4M");
    //   });
    // }
    update();
    Categories.EditProductStatus(
      productId,
      (status) ? "1" : "0",
    ).then((value) {
      Utility.hideLoadingDialog();
      print("succc");
      print(value);
      print("addcaat");
      if (value.data != null) {
        print("mess");
        // Get.back();
        // Utility.showToastSuccess("Success", value.data!.message);
        productNameController.text = "";
        productDescriptionController.text = "";
        productPriceController.text = "";
        productSalePriceController.text = "";
        selectedProductType.value = "";
        selectedProductImage.value = File("");
        selectedProductUnit.value = "";
        selectedProductCategory.value = "";
        productQuantityController.text = "";
        selectedProductTag.value = "";
        isActive.value = false;
        GetItem("All", 1);

        // Get.back();

        //Get.to(InventoryPage());
        return true;
      } else {
        Utility.showToastError(value.error!.message, " Failed");
        return false;
      }

      printInfo(info: "Data from Auth Controller");
    }).catchError((error) {
      Utility.hideLoadingDialog();
      print("errorr");
      print(error);
      printInfo(info: "Error From Controllers");
    });
  }

  void EditProductQuantity(String productId, String SKU) {
    Utility.showLoadingDialog();
    update();
    Categories.EditProductQuantity(
      productId,
      //accessToken.value,
      SKU,
    ).then((value) {
      Utility.hideLoadingDialog();
      print(value);
      print(" before QuentityAdded ");
      if (value.data != null) {
        print("QuentityAdded");
        // Get.back();
        // Utility.showToastSuccess("Success", value.data!.message);
        productNameController.text = "";
        productDescriptionController.text = "";
        productPriceController.text = "";
        // productSalePriceController.text = "";
        selectedProductType.value = "";
        selectedProductImage.value = File("");
        selectedProductUnit.value = "";
        selectedProductCategory.value = "";
        productQuantityController.text = "";
        selectedProductTag.value = "";
        isActive.value = false;
        GetItem("All", 1);
        return true;
      } else {
        Utility.showToastError(value.error!.message, " Failed");
        return false;
      }
      printInfo(info: "Data from Auth Controller");
    }).catchError((error) {
      Utility.hideLoadingDialog();
      print("errorr");
      print(error);
      printInfo(info: "Error From Controllers");
    });
  }

  EditProductCategory(String productCategoryId, index) {
    Utility.showLoadingDialog();
    update();
    Categories.EditProductCategory(
      productCategoryId,
      // accessToken.value,
      categoryNameController.value.text,
      selectedCategoryImage.value,
      Constant.isEcom == "0" ? mainController.selectedStore.value.id.toString() : mainController.adminStore.value.id.toString(),
      (selectedProductParentCategory.value.id == null) ? "0" : selectedProductParentCategory.value.id.toString(),
    ).then((value) {
      Utility.hideLoadingDialog();
      print(value);
      if (value.data != null) {
        Get.back();
        Utility.showToastSuccess("Success", value.data!.message);
        if (productCategoryId != "0") {
          Get.back();
          allProductCategory[index] = value.data!.data!;
          GetProductCategory(accessToken.value);
        } else {
          Get.back();
          // Get.back();
          // GetProductSubCategory(productCategoryId);
        }
        // Get.back();

        //Get.to(InventoryPage());
        return true;
      } else {
        Utility.showToastError(value.error!.message, " Failed");
        return false;
      }

      printInfo(info: "Data from Auth Controller");
    }).catchError((error) {
      Utility.hideLoadingDialog();
      print("errorr");
      print(error);
      printInfo(info: "Error From Controllers");
    });
  }

  // editCategory(String isHidden, String parent, String CategoryId) {
  //   Utility.showLoadingDialog();
  //   if (parent == "null") {
  //     parentController.text = "";
  //   } else {
  //     parentController.text = parent;
  //   }
  //   print(parentController.text);
  //   print('space');
  //   Categories.EditCategory(
  //           CategoryId,
  //           accessToken.value,
  //           //"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2MGYyNmM2ZjQ0YjBmODAwMjAwZjMwZmIiLCJpYXQiOjE2MjY1MDAyMjAsImV4cCI6MTY4NjUwMDE2MCwidHlwZSI6ImFjY2VzcyJ9.xVIuSiuyhx2FkSwq7xPjsHQCt0gUtoLu6L1ouOqJkHw",
  //           nameController.value.text,
  //           Image!,
  //           isHidden,
  //           // restaurant_idController.value.text,
  //           mainController.selectedStore.value.id.toString(),
  //           // parent,
  //           parentController.value.text)
  //       .then((value) {
  //     Utility.hideLoadingDialog();
  //     print("succc");
  //     print(value);
  //     print("addcaat");
  //     if (value.data != null) {
  //       print("mess");
  //       GetProductCategory(accessToken.value);
  //       // GetAllCategory(accessToken.value);
  //       Utility.showToastSuccess("Success", value.data!.message);
  //       GetProductCategory(accessToken.value);
  //       Get.back();
  //       Get.back();
  //
  //       //Get.to(InventoryPage());
  //       return true;
  //     } else {
  //       Utility.showToastError(value.error!.message, "Registration Failed");
  //       return false;
  //     }
  //
  //     printInfo(info: "Data from Auth Controller");
  //   }).catchError((error) {
  //     Utility.hideLoadingDialog();
  //     print(error);
  //     printInfo(info: "Error From Controllers");
  //   });
  // }

  AddItemImage() {
    imageEditData!.clear();
    Utility.showLoadingDialog();
    List<File> gallerySelection = List.empty(growable: true);
    if (selectedGalleryEditImage!.isNotEmpty) {
      for (int i = 0; i < selectedGalleryEditImage!.length; i++) {
        if (selectedGalleryEditImage!.elementAt(i) != null) {
          gallerySelection.add(selectedGalleryEditImage!.elementAt(i));
        }
      }
    }

    Categories.AddItemImage(
      //accessToken.value,
      "fooditem",
      gallerySelection,
    ).then((value) {
      Utility.hideLoadingDialog();
      print("succc");
      print(value);
      print("addcaat");
      if (value.data != null) {
        print("mess");
        imageEditData!.value = value.data!.data!;
        for (var i = 0; i < imageEditData!.length; i++) {
          selectedGalleryImage!.add(imageEditData![i].path);
        }
        update();
        // Utility.showToastSuccess("Success", value.data!.message);
        print(selectedGalleryImage!.toJson());
        update();
        // itemNameController.text = "";
        // itemDescriptionController.text = "";
        // itemPriceController.text = "";
        // itemSalePriceController.text = "";
        // file = null;
        // isRecommanded.value = false;
        // isPopular.value = false;
        // isNew.value = false;
        // isNonveg.value = false;
        // ImageSelected.value = false;
        // Image = null;

        //Get.to(InventoryPage());
        return true;
      } else {
        Utility.showToastError(value.error!.message, " Failed");
        return false;
      }

      printInfo(info: "Data from Auth Controller");
    }).catchError((error) {
      Utility.hideLoadingDialog();
      print("errorr");
      print(error);
      printInfo(info: "Error From Controllers");
    });
  }

  DeleteImage(
    String image,
  ) {
    Utility.showLoadingDialog();

    print(parentController.text);
    print('space');
    Categories.DeleteImage(
      //"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2MGYyNmM2ZjQ0YjBmODAwMjAwZjMwZmIiLCJpYXQiOjE2MjY1MDAyMjAsImV4cCI6MTY4NjUwMDE2MCwidHlwZSI6ImFjY2VzcyJ9.xVIuSiuyhx2FkSwq7xPjsHQCt0gUtoLu6L1ouOqJkHw",
      // restaurant_idController.value.text,
      image,
    ).then((value) {
      Utility.hideLoadingDialog();
      print("succc");
      print(value);
      print("addcaat");
      if (value.data!.message == "Items deleted successfully") {
        print("mess");
        // Utility.showToastSuccess("Success", value.data!.message);

        //Get.to(InventoryPage());
        return true;
      } else {
        Utility.showToastError(value.error!.message, "Registration Failed");
        return false;
      }

      printInfo(info: "Data from Auth Controller");
    }).catchError((error) {
      Utility.hideLoadingDialog();
      print(error);
      printInfo(info: "Error From Controllers");
    });
  }
}

enum AppState {
  free,
  picked,
  cropped,
}
