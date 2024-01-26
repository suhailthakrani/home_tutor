import 'package:google_fonts/google_fonts.dart';


///*********************  Routes   *********************///

const String kSplashScreenRoute = "/";
const String kWelcomeScreenRoute = "/WELCOME_SCREEN";
const String kSignInScreenRoute = "/SIGN_IN_SCREEN";

///*********************  Teacher Routes   *********************///

const String kTeacherSignUpScreenRoute = "/TEACHER_SIGN_UP_SCREEN";
const String kTMainScreenRoute = "/TMainScreenRoute";
const String kTStudentsHomeScreenRoute = "/kTStudentsHomeScreenRoute";
const String kTAccountScreenRoute = '/TAccountScreenRoute';
const String kTHomeScreenRoute = '/THomeScreenRoute';
const String kTProfileScreenRoute = '/TProfileScreenRoute';
const String kTNewRequestsScreenRoute = '/TNewRequestsScreenRoute';
const String kTStudentDetailsScreenRoute = '/TStudentDetailsScreenRoute';

///*********************  Student Routes   *********************///

const String kStudentSignUpScreenRoute = "/STUDENT_SIGN_UP_SCREEN";
const String kSMainScreenRoute = "/SMainScreenRoute";
const String kSAccountScreenRoute = '/SAccountScreenRoute';
const String kSHomeScreenRoute = '/SHomeScreenRoute';
const String kSProfileScreenRoute = '/SProfileScreenRoute';
const String kSTutorsListScreenRoute = '/STutorsListScreenRoute';
const String kSTeacherDetailsScreenRoute = '/STeacherDetailsScreenRoute';
const String kSFavTeacherScreenRoute = '/SFavTeacherScreenRoute';
const String kSRequestTutorScreenRoute = '/SRequestTutprScreenRoute';

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