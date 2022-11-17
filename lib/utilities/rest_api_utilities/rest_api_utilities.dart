import 'package:api/utilities/rest_api_utilities/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class RestApiUtilities{

  //static String url='https://fakestoreapi.com/'; production api
  static String url='https://fakestoreapi.com';  // development api

static final String productUrl= "$url/products";

static final String error404= "Resource data not found";
static final String error401="Un Authorize Error";
  static final String timeOut="Time Out Error";
  static final String internetConnect="Internet is not connected ";

static final String errorUnknown="Unknown Error";

static  String getStatusResponce(int status){
  switch(status){
    case 404:
      return error404;
    case 401:
      return error401;
    case 420:
      return timeOut;
    case 430:
      return internetConnect;
    default:
      return errorUnknown;
  }
  }

  static void getPrintHeaderBodyResponse(url,header,body,response){
  print("Get Response : url:$url");
  print("Get Response : header:$header");
  print("Get Response : body:$body");
  print("Get Response : response:${response.statusCode},${response.body}");
  }

  static Widget showLoadingView(BuildContext context){
    return Center(
      child: Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          color: Colors.lightBlue,
            borderRadius: BorderRadius.circular(10)
        ),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 100,
                width: 100,
                child: Center(child: Lottie.asset(AppAssets.loadingBar,)),
              ),
              SizedBox(
                child: Center(child: Text("Loading Text",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w900),)),
              )
            ],
          ),
        ),
      ),
    );
  }

  static showLoadingDialog(BuildContext context){

  }

  static Widget showMessageView(BuildContext context,String path,String title){
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 200,
            height: 200,
            child: Lottie.asset(path),
          ),
          SizedBox(
            width: 150,
            child: Center(child: Text("$title",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w900),)),
          )
        ],
      ),
    );
  }

  static Widget showErrorReloadView(BuildContext context,String path,String title,onTap){
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          showMessageView(context, path, title),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.lime
            ),
            onPressed: onTap,
              child: Text("Reload",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900),),
          )
        ],
      ),
    );
  }

}