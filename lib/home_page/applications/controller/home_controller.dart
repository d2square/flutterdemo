import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:helloworld/home_page/domain/news_model.dart';
import 'package:helloworld/splashScreen/utils/const_string.dart';

class HomeController extends GetxController {
  /// very first method call in controller
  @override
  void onInit() {
    super.onInit();
    getNewsDataFromApi();
  }

  ///we can write logical part in the controller
  /// Using obx
  RxString s = "Ravi".obs;

  updateString(String valueUpdate) {
    s.value = valueUpdate;
  }

  ///using GetBuilder
  List<String> strList = ["Abhi", "Sarika", "Ravindra"];
  String valueForAppBar = "Sarika";

  updateSarikaValue(String string, int index) {
    strList[index] = string;
    update();
  }

  /*get call for news api*/
  final client = Dio();
  bool loading = false;

  List<Articles> articleModelList = [];
  List<NewsModel> newsModelList = [];

  updateListLoading(bool val) {
    loading = val;
    update();
  }

  getNewsDataFromApi() async {
    updateListLoading(true);
    try {
      ///https://newsapi.org/v2/top-headlines?country=us&apiKey=8780cdf148154a18b52efe8b1f666b58
      var response =
          await client.get(baseUrl + "?country=$country&apiKey=$apiKey");
      if (response.statusCode == 200) {
        updateListLoading(false);
        NewsModel newsModel = NewsModel.fromJson(response.data);
        articleModelList.addAll(newsModel.articles!);
      } else {
        updateListLoading(false);
        print("error");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  /// variable for Getx And Obx
  RxString stringValu = "Dipak".obs;

  /// Var for GetBuilder
  String strValue = "Dipak";
  updateValue(String s) {
    if (s == "Ravi") {
      strValue = "Dipak";
    } else {
      strValue = s;
    }
    update();
  }
}
