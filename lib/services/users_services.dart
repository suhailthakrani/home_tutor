
import 'package:firebase_auth/firebase_auth.dart';

import '../models/login_model.dart';
import '../models/response_model.dart';
import '../models/user_model.dart';
import '../utils/constants.dart';
import '../utils/firebase_client.dart';

class UserServices{
  Future<String> authenticateUser({required LoginModel loginModel})async{
    ResponseModel responseModel = await FirebaseClient().firebaseAuthUserRegisterRequest(model: loginModel);
    return responseModel.statusDescription;
  }

  Future<String> registerUser(UserModel userModel) async {
    ResponseModel responseModel = await FirebaseClient().firebaseInsertRequest(model: userModel, collectionName: kUserCollection, id: userModel.email);
    return responseModel.statusDescription;
  }

  Future<String> loginUser(LoginModel loginModel)async{
    ResponseModel responseModel = await FirebaseClient().firebaseAuthUserSignInRequest(model: loginModel);
    return responseModel.statusDescription;
  }

  Future<dynamic> getUser(String email) async {
    dynamic response = await FirebaseClient().firebaseGetSingleRequest(collectionName: kUserCollection, id: email);
    return response;
  }

  
  Future<ResponseModel> sendEmail({required String email}) async {
    String errorMsg = '';
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      errorMsg = 'OK';
      return ResponseModel.named(statusDescription: errorMsg);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        errorMsg = "user-not-found";
      }
      return ResponseModel.named(statusDescription: errorMsg);
    }
  }

  Future<ResponseModel> changePassword({required String password, required String newPassword}) async {
    String errorMsg = '';
    final currentUser =  FirebaseAuth.instance.currentUser;
    try {
      print('---------------------------------1');
      if(currentUser != null){
        AuthCredential credential = EmailAuthProvider.credential(
          email: currentUser.email ?? '',
          password: newPassword,
        );
        await currentUser.reauthenticateWithCredential(credential);
        await currentUser.updatePassword(newPassword);
        print('---------------------------------2');
        errorMsg = 'OK';
      }

      return ResponseModel.named(statusDescription: errorMsg);
    } on FirebaseAuthException catch (e) {
      errorMsg = e.code;
      print('---------------------------------3: $errorMsg');
      return ResponseModel.named(statusDescription: errorMsg);
    }
  }


}