import 'dart:async';
import 'dart:io';

import 'package:api/product/model/products_model.dart';
import 'package:api/utilities/rest_api_utilities/rest_api_utilities.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ProductService{
  static var client = http.Client();
  static var duration=Duration(seconds: 10);

  static Future<List<ProductsModel>> loadProducts() async {
    List<ProductsModel>list = [];

   try{
     Map<String, String> header={};
     Map<String,String> body={};
     Response response = await client.get(Uri.parse(RestApiUtilities.productUrl)).timeout(duration);
     
     RestApiUtilities.getPrintHeaderBodyResponse(RestApiUtilities.productUrl, header, body, response);

     if (response.statusCode == 200) {
       list = productsModelFromMap(response.body);
       return list;
     } else {
       return list;
     }
   } on TimeoutException{
     print(RestApiUtilities.getStatusResponce(420));
     return list;
     }on SocketException{
     print(RestApiUtilities.getStatusResponce(430));
     return list;
   }catch (e){
     print("${e.toString()}");
     return list;

   }
  }
}