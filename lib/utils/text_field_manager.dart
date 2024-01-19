import 'package:mask_input_formatter/mask_input_formatter.dart';

import 'text_filter.dart';
import 'user_session.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class TextFieldManager {

  TextEditingController controller = TextEditingController();
  FocusNode focusNode = FocusNode();
  RxString errorMessage=''.obs;
  String fieldName;
  TextInputType _textInputType = TextInputType.name;
  bool Function()? customValidation;
  int length;
  String? hint;
  TextCapitalization textCapitalization = TextCapitalization.none;

  TextFilter filter;
  List<TextInputFormatter>? _formatters;
  bool mandatory;

  TextFieldManager(this.fieldName, {this.filter= TextFilter.none, this.mandatory=true, this.length=30, this.hint}) {
    if(filter == TextFilter.cnic){
      length = 15;
      _formatters=[MaskInputFormatter(mask: '#####-#######-#')];
      _textInputType = TextInputType.number;
      customValidation = validateCNIC;
    } else if(filter == TextFilter.number){
      _formatters=[FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))];
      _textInputType = TextInputType.number;
      customValidation = validateNumber;
    } else if(filter == TextFilter.name){
      _formatters=[FilteringTextInputFormatter.allow(RegExp(r'[A-Za-z ]'))];
      textCapitalization = TextCapitalization.words;
      _textInputType = TextInputType.name;
    } else if(filter == TextFilter.iban){
      _formatters=[FilteringTextInputFormatter.allow(RegExp(r'[A-Z0-9]'))];
      textCapitalization = TextCapitalization.characters;
      _textInputType = TextInputType.name;
      customValidation = validateIBAN;
    } else if(filter == TextFilter.alphaNumeric){
      _formatters=[FilteringTextInputFormatter.allow(RegExp(r'[A-Za-z0-9 ]'))];
      textCapitalization = TextCapitalization.sentences;
      _textInputType = TextInputType.text;
    } else if(filter == TextFilter.email){
      _formatters=[FilteringTextInputFormatter.deny(RegExp(r'\s'))];
      _textInputType = TextInputType.emailAddress;
      customValidation = validateEmail;
    } else if(filter == TextFilter.mobile){
      length = 11;
      _formatters=[FilteringTextInputFormatter.allow(RegExp(r'[0-9]'))];
      _textInputType = TextInputType.number;
      customValidation = validateMobileNumber;
    }
  }

  bool validate(){
    UserSession.isDataChanged.value = true;
    if(customValidation!=null) {
      return customValidation!();
    }
    if(text.isEmpty){
      errorMessage.value = mandatory ? "$fieldName is Required!" : '';
    } else {
      errorMessage.value = "";
    }
    return errorMessage.isEmpty;
  }

  bool validateMobileNumber() {
    if(text.isEmpty) {
      errorMessage.value = mandatory ? "Mobile No is required!" : "";
    } else if(RegExp(r'^[0][3][0-5][0-9]{8}$').hasMatch(text)) {
      errorMessage.value = "";
    }else{
      errorMessage.value = "Mobile No must follow '03XXXXXXXXX' format!";
    }

    return errorMessage.isEmpty;
  }

  bool validateIBAN() {
    if(text.isEmpty) {
      errorMessage.value = mandatory ? "$fieldName is required!" : "";
    } else if(text.length==24) {
      errorMessage.value = "";
    }else{
      errorMessage.value = "Invalid $fieldName";
    }

    return errorMessage.isEmpty;
  }

  /*bool validatePhoneNumber(){
    if(text.isEmpty){
      errorMessage.value = mandatory ? "$fieldName is required!" : "";
    } else if(!RegExp(r'(^[0][1-9][0-9]{9,15}$)').hasMatch(text)){
      errorMessage.value = "Invalid $fieldName";
    } else {
      errorMessage.value = '';
    }
    return errorMessage.isEmpty;
  }*/

  bool validateCNIC(){
    if(text.isEmpty){
      errorMessage.value = mandatory ? "CNIC is required!" : "";
    } else if(RegExp(r"^[0-9]{5}-[0-9]{7}-[0-9]$").hasMatch(text)){
      errorMessage.value = "";
    } else {
      // errorMessage.value = "CNIC must follow the 'XXXXX-XXXXXXX-X' format!";
      errorMessage.value = "Invalid CNIC!";
    }
    return errorMessage.isEmpty;
  }

  bool validateNumber() {
    if (text.isNotEmpty) {
      double d = double.tryParse(text)??0;
      controller.text = d.ceil().toString();
      controller.selection = TextSelection(baseOffset: text.length, extentOffset: text.length);
      errorMessage.value = "";
    } else {
      errorMessage.value =  mandatory ? "$fieldName is required!" : "";
    }
    return errorMessage.isEmpty;
  }

  bool validateEmail() {
    if (text.isEmpty) {
      errorMessage.value = mandatory ? "Email Address is required!":"";
    } else if (!text.isEmail) {
      errorMessage.value = "Invalid Email Address!";
    } else {
      errorMessage.value = "";
    }
    return errorMessage.isEmpty;
  }

  String get text => controller.text.trim();

  TextInputType get keyboardType => _textInputType;
  List<TextInputFormatter>? get formatters => _formatters;

}