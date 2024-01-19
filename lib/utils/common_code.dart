
import 'dart:convert';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import 'app_colors.dart';


class CommonCode {





  void showToast({required String message}) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: const Color(0xF9454141),
        textColor: Colors.white,
        fontSize: 13.0);
  }

  void showSuccessToast({required String message}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: kGreenNormalColor,
      textColor: Colors.white,
      fontSize: 13.0,
    );
  }

  Widget showEmptyListMessage({required String message, double heightPercentage = 0.6, double fontSize = 18}){
    return SizedBox(height: Get.height*heightPercentage,
        child:Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset("assets/images/empty_record.png", width: Get.width*0.5,height: Get.height*(heightPercentage/2),),
              Text(message, textAlign:TextAlign.center,style: TextStyle(color: const Color(0xffe2e2e2), fontSize: fontSize, fontWeight: FontWeight.bold),),
            ],
          ),
        ));
  }



  Future<bool> checkInternetConnection() async {
    var result = await Connectivity().checkConnectivity();
    return result == ConnectivityResult.mobile || result == ConnectivityResult.wifi;
  }

  Future<bool> checkInternetAccess() async {
    try {
      if(await checkInternetConnection()) {
        http.Response response =
        await http.get(Uri.parse("https://www.google.com/"))
            .timeout(const Duration(seconds: 10));
        return response.body.length > 4;
      }
    } catch (_) {}
    return false;
  }

   Widget showProgressIndicator(bool visibility, bool isListEmpty) {
    return visibility ? Visibility(
        visible: visibility,
        child:  Padding(
            padding: EdgeInsets.only(top: Get.height*0.3),
            child: Center(child: CircularProgressIndicator(color: kPrimaryColor,strokeWidth: 2)))
    ) : Visibility(
      visible: isListEmpty,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(top: Get.height*0.3),
        child: Column(
          children: [
            Image.asset('assets/icons_new/empty-list.png', width: 120, color: Colors.grey.shade200,),
            Text('No Data Found!', style: TextStyle(fontSize: 22, color: Colors.grey.shade200, fontWeight: FontWeight.bold),),
          ],
        ),
      ),
    );
  }


  Future<String> saveImage(
      {required String url,bool greaterThanEleven = false}) async {
    Directory? directory;
    String fileSavingName = "file.pdf";
    String newPath = "";
    try {
      if (Platform.isAndroid) {
        String appendDate = "${DateTime.now().microsecond}";
        if (await requestPermission(Permission.storage)) {
          directory = await getExternalStorageDirectory();
          List<String> paths = directory!.path.split("/");
          List<String> urlList = url.split("/");
          // String downloadFileName = urlList.last;
          // fileSavingName = "${downloadingModelList[indexOfCurrentFileBeingDownloaded].bankTransactionNoOfFile.value}"+"_${appendDate}_"+urlList.last;
          fileSavingName = "_${appendDate}_${urlList.last}";
          for (int x = 1; x < paths.length; x++) {
            String folder = paths[x];
            if (folder != "Android") {
              newPath += "/$folder";
            } else {
              break;
            }
          }
          if (!greaterThanEleven) {
            newPath = "$newPath/Download/SFERPApp";
          }else{
            newPath = "$newPath/Download/";
          }
          directory = Directory(newPath);
        } else {
          return "";
        }
      } else {
        if (await requestPermission(Permission.photos)) {
          directory = await getTemporaryDirectory();
        } else {
          return "";
        }
      }
      File saveFile = File("${directory.path}/$fileSavingName");
      if (!await directory.exists()) {
        await directory.create(recursive: true);
      }
      if (await directory.exists()) {
        //downloading
        var response =await http.get(Uri.parse(url));
        saveFile.writeAsBytes(response.bodyBytes);
        //downloaded
        //for ios
        // if (Platform.isIOS) {
        //   await ImageGallerySaver.saveFile(saveFile.path,
        //       isReturnPathOfIOS: true);
        // }
        return "$newPath/$fileSavingName";
      }
      return "";
    } catch (e) {
      return "";
    }
  }

  Future<bool> requestPermission(Permission permission) async {
    if (await permission.isGranted) {
      return true;
    } else {
      var result = await permission.request();
      if (result == PermissionStatus.granted) {
        return true;
      }
    }
    return false;
  }

  Uint8List decodeImage(String imagePath){
    Uint8List image = base64Decode(imagePath);
    return image;
  }

}
