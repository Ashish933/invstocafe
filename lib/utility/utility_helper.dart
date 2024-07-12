import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:investocafe_flutter/utility/app_constant.dart';
import 'package:investocafe_flutter/utility/color_theems.dart';
import 'package:responsive_deva/responsive_deva.dart';

class UtilityHelper {
  static bool statusToast = true;
  static toastMessage(message) {
    if (message != null && message != "") {
      SnackBar snackBar = SnackBar(
          elevation: 7.0,
          behavior: SnackBarBehavior.floating,
          duration: const Duration(milliseconds: 1500),
          backgroundColor: AppColors.primaryColor,
          content: Container(
              margin: EdgeInsets.symmetric(vertical: getHeight(10)),
              child: Text(
                message,
                style: const TextStyle(color: Colors.black),
              )));
      if (statusToast) {
        statusToast = false;
        scaffoldMessengerKey!.currentState?.showSnackBar(snackBar);
      }
      Future.delayed(const Duration(milliseconds: 1500), () {
        statusToast = true;
      });
    }
  }

  static allWordsCapitilize(String str) {
    return str.toLowerCase().split(' ').map((word) {
      String leftText = (word.length > 1) ? word.substring(1, word.length) : '';
      return word[0].toUpperCase() + leftText;
    }).join(' ');
  }

// remove html tags form string
  static String removeAllHtmlTags(String htmlText) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);

    return htmlText.replaceAll(exp, '');
  }

// get date piker form current date
  static selectDate(BuildContext context, {selectedDate}) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime(2101));

    if (picked != null && picked != selectedDate) {
      return picked;
    } else {
      return null;
    }
  }

// get date piker form current year
  static showYearData(context) async {
    var selectYear = null;
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Select Year"),
          content: Container(
            // Need to use container to add size constraint.
            width: 300,
            height: 300,
            child: YearPicker(
              firstDate: DateTime(DateTime.now().year - 100, 1),
              lastDate: DateTime(DateTime.now().year + 100, 1),
              initialDate: DateTime.now(),
              selectedDate: DateTime.now(),
              onChanged: (DateTime dateTime) {
                selectYear = dateTime.year.toInt();
                Navigator.pop(context);
                print(selectYear);
              },
            ),
          ),
        );
      },
    );
    return selectYear;
  }

  static dateFormat(date) {
    try {
      DateTime convent = DateTime.parse(date);
      return DateFormat.yMMMEd().format(convent);
    } catch (e) {
      return "N/A";
    }
  }

  static dateMonthIndex(date) => int.parse(DateFormat.M().format(date));
  static onlyNumber(date) =>
      int.parse(date.toString().replaceAll(RegExp(r'[^0-9]'), ''));

  // static openBrowserTab({path}) async {
  //   await FlutterWebBrowser.openWebPage(
  //     url: path ?? "https://gadgets.ndtv.com/",
  //   );
  // }

  // static shareMyApp() async {
  //   await Share.share(
  //       'We are a pre-eminent brand in the realm of "climate change, carbon credit and sustainability solutions” across the globe. We aspire to render strategic solutions for helping businesses and organizations to achieve their climate ambition. Our objective is to rehabilitate the Earth to a low carbon and climate resilient global economy.  https://play.google.com/store/apps/details?id=com.eki.MyApplication',
  //       subject: 'Hi, Welcome to EKI Energy Services Limited');
  // }

  // static ImagePicker picker = ImagePicker();
  // static Future<XFile?> getImage({quality}) async {
  //   try {
  //     PermissionStatus status = await Permission.camera.status;
  //     if (status.isPermanentlyDenied) {
  //       openAppSettings();
  //     }
  //     status = await Permission.camera.request();

  //     final file = await picker.pickImage(
  //         source: ImageSource.camera,
  //         imageQuality: quality ?? 50,
  //         preferredCameraDevice: CameraDevice.rear,
  //         // requestFullMetadata: false,
  //         maxHeight: 668,
  //         maxWidth: 500);
  //     return file;
  //   } catch (e) {
  //     UtilityHelper.toastMessage(e.toString());
  //     log(e.toString() + "getImage()");
  //     return null;
  //   }
  // }

  // static Future<CroppedFile?> cropImage(imageFile) async {
  //   CroppedFile? croppedFile = await ImageCropper().cropImage(
  //     sourcePath: imageFile.path,
  //     aspectRatioPresets: [
  //       CropAspectRatioPreset.square,
  //       CropAspectRatioPreset.original,
  //       CropAspectRatioPreset.ratio3x2,
  //       CropAspectRatioPreset.ratio4x3,
  //       CropAspectRatioPreset.ratio16x9
  //     ],
  //     uiSettings: [
  //       AndroidUiSettings(
  //           toolbarTitle: 'Crop Image',
  //           toolbarColor: MyColor.primary,
  //           toolbarWidgetColor: Colors.white,
  //           initAspectRatio: CropAspectRatioPreset.original,
  //           lockAspectRatio: false),
  //       IOSUiSettings(
  //         title: 'Crop Image',
  //       ),
  //       WebUiSettings(
  //         context: navigatorKey!.currentState!.context,
  //       ),
  //     ],
  //   );
  //   return croppedFile;
  // }

  // static imgNA(img, {height, width, fit}) {
  //   return CachedNetworkImage(
  //     imageUrl: img,
  //     imageBuilder: (context, imageProvider) => Container(
  //       height: height ?? getHeight(50),
  //       width: width ?? getWidth(50),
  //       decoration: BoxDecoration(
  //         image: DecorationImage(
  //           image: imageProvider,
  //           fit: fit ?? BoxFit.cover,
  //           colorFilter: ColorFilter.mode(Colors.red, BlendMode.colorBurn),
  //         ),
  //       ),
  //     ),
  //     placeholder: (context, url) => Image.asset(
  //       "assets/images/loading_img.png",
  //       height: height ?? getHeight(50),
  //       width: width ?? getWidth(50),
  //       fit: fit ?? BoxFit.cover,
  //     ),
  //     // errorWidget: (context, url, error) => Container(),
  //     errorWidget: (context, url, error) => Image.asset(
  //       "assets/images/placeholder_image.png",
  //       height: height ?? getHeight(50),
  //       width: width ?? getWidth(50),
  //                   fit: fit ?? BoxFit.cover,

  //     ),
  //     // placeholder: (context, url) => CircularProgressIndicator(),
  //     // errorWidget: (context, url, error) => Icon(Icons.error),
  //   );
  // }

  // static dateTimePicker(context) async {
  //   DateTime? dateTime = await showOmniDateTimePicker(
  //     context: context,
  //     primaryColor: Colors.cyan,
  //     backgroundColor: Colors.grey[900],
  //     calendarTextColor: Colors.white,
  //     tabTextColor: Colors.white,
  //     unselectedTabBackgroundColor: Color.fromRGBO(97, 97, 97, 1),
  //     buttonTextColor: Colors.white,

  //     timeSpinnerTextStyle:
  //          TextStyle(color: Colors.white70, fontSize: 10),
  //     timeSpinnerHighlightedTextStyle:
  //          TextStyle(color: Colors.white, fontSize: 10),
  //     is24HourMode: false,
  //     isShowSeconds: false,
  //           startInitialDate: DateTime.now(),
  //     startFirstDate: DateTime.now(),

  //     // startFirstDate: DateTime(1600).subtract(const Duration(days: 3652)),
  //     startLastDate: DateTime.now().add(
  //       const Duration(days: 3652),
  //     ),

  //     // borderRadius: const Radius.circular(16),
  //   );
  //   print(dateTime);
  // }
}
