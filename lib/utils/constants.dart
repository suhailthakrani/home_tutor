import 'package:google_fonts/google_fonts.dart';

const String kAppName = "Solid Waste Management";

///*********************  Route Names   *********************///
const String kSplashScreenRoute = "/SPLASH_SCREEN";
const String kSignInScreenRoute = "/SIGN_IN_SCREEN";
const String kSignUpScreenRoute = "/SIGN_UP_SCREEN";
const String kDashboardScreenRoute = "/DASHBOARD_SCREEN";
const String kForgotPasswordScreenRoute = "/FORGOT_PASSWORD_SCREEN";
const String kSubmitComplaintScreenRout = "/SUBMIT_COMPLAINT_SCREEN";
const String kPostArticleScreenRoute = "/POST_ARTICLE_SCREEN";
const String kReadArticleScreenRoute = "/READ_ARTICLE_SCREEN";
const String kViewAllArticlesScreenRoute = "/VIEW_ALL_ARTICLES_SCREEN";
const String kViewAllSweeperScreenRoute = "/VIEW_ALL_SWEEPER_SCREEN";
const String kSweeperDetailScreenRoute = "/SWEEPER_DETAIL_SCREEN";
const String kViewAllEquipmentScreenRoute = "/VIEW_ALL_EQUIPMENT_SCREEN";
const String kEquipmentDetailScreenRoute = "/EQUIPMENT_DETAIL_SCREEN";
const String kViewHistoryScreenRoute = "/VIEW_HISTORY_SCREEN";
const String kChangePasswordScreenRoute = "/CHANGE_PASSWORD_SCREEN";


///*********************  Messages   *********************///
const String kPermissionPermanentlyDenied =
    "Permission is Permanently Denied\nPlease allow permission from settings and try again.";
const String kStoragePermissionDenied =
    "Allow Storage Permission to Save photos.";
const String kStoragePermissionDeniedForCamera =
    "Allow Storage Permission to Select photos.";
const String kCameraPermissionDenied =
    "Allow Camera Permission to Capture photos.";
const String kManageStoragePermissionDenied =
    "Allow Manage Storage Permission to Save photos.";
const String kPermissionDenied = "Permission Denied";
const String kNoInternetMsg = 'No Internet Connection!';
const String kPoorInternetConnection =
    "Poor network connection detected. Please check your internet connection!";
const String kNetworkError =
    "Network Error. Please change your internet connection!";
const String kServiceError =
    "Services Currently Unavailable, Our technical team is working on it. Please try again later.";
const String kErrorMessage = "Something went wrong, Please try again later.";

const String kSessionExpireMsg = 'Session Expired\nPlease login Again.';
const String kEmailAlreadyInUseErrorMsg = 'This Email is already in use.\nPlease Try another';
const String kUserNotFoundErrorMsg = 'No user found with this email.\nPlease Try another';
const String kWrongPasswordErrorMsg = 'Password is incorrect.\nPlease Try again';


///*********************  Firebase Collection Names   *********************///
const String kUserCollection = "users";
const String kArticleCollection = "articles";
const String kComplaintCollection = "complaints";
const String kEquipmentCollection = "equipments";
const String kSweeperCollection = "sweepers";
const String kTipsCollection = "tips";

///*********************  APP Font Family   *********************///
String kLoginFontFamily = GoogleFonts.acme().fontFamily ?? "";
String kLogoFontFamily = GoogleFonts.righteous().fontFamily ?? "";