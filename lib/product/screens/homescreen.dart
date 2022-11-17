import 'package:api/product/model/products_model.dart';
import 'package:api/product/services/product_services.dart';
import 'package:api/utilities/rest_api_utilities/app_assets.dart';
import 'package:api/utilities/rest_api_utilities/rest_api_utilities.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class Api extends StatefulWidget {
  const Api({Key? key}) : super(key: key);

  @override
  State<Api> createState() => _ApiState();
}

class _ApiState extends State<Api> {

  @override
  void initState() {
    super.initState();
    setState(() {
      _futureList = ProductService.loadProducts();
    });
  }



  Future<List<ProductsModel>>? _futureList;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("API Product List"),),
      body: Container(
       // child: RestApiUtilities.showLoadingView(context),
          child: FutureBuilder(
              future: _futureList,
              builder: (context,AsyncSnapshot<List<ProductsModel>> snapshot) {
                if(snapshot.connectionState==ConnectionState.waiting){
                  return RestApiUtilities.showLoadingView(context);
                }else if(snapshot.connectionState==ConnectionState.done){
                   if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  } else if (snapshot.hasData) {
                    List<ProductsModel>list=snapshot.data!;
                    if(list.length>0){
                      return ListView.builder(
                          itemCount: list.length,
                          itemBuilder: (context,index){
                            return ListTile(
                              title: Text("${list[index].title}"),
                              subtitle: Text("${list[index].description}"),
                            );
                          }
                      );
                    }else{
                      return RestApiUtilities.showErrorReloadView(context, AppAssets.internetIssue, "NO INTERNET",(){
                        setState(() {
                          _futureList=ProductService.loadProducts();
                        });
                      });
                    }
                  }else{
                   return Text("Data")  ;
                   }
                }
                else {
                  return Text("Data");
                }
              }
          )
      ),
    );
  }
}