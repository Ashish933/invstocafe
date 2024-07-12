import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:responsive_deva/responsive_deva.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:image_picker/image_picker.dart';

import '../../../utility/color_theems.dart';
import '../../utility_widget/utility_widgets.dart';


class UpLoadPage extends StatefulWidget {
  const UpLoadPage({Key? key}) : super(key: key);

  @override
  State<UpLoadPage> createState() => _UpLoadPageState();
}

class _UpLoadPageState extends State<UpLoadPage> {

  List<String> imageTexts = [
    "Cancel cheque/Bank Statements(last 6 months)",
    "PAN",
    "Address Proof Front",
    "Address Proof Back",
    "Photo",
  ];

  final List<File?> _selectedImages = List.generate(5, (index) => null);

  Future<void> _getImage(ImageSource source, int buttonIndex) async {
    final pickedFile = await ImagePicker().pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _selectedImages[buttonIndex] = File(pickedFile.path);
      });
    }
  }

  void _removeImage(int index) {
    setState(() {
      _selectedImages[index] = null;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: UtilityWidgets.MainText("UpLoad Page", size: 14.sp, color: AppColors.backGroundColor),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset(
            "assets/images/arrow-narrow-left (1).png",
            scale: 2.9,
            color: Colors.white,
          ),
        ),
        backgroundColor: AppColors.secondaryColor,
      ),
      body: SingleChildScrollView(
        child: AnimationLimiter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: AnimationConfiguration.toStaggeredList(
                duration: const Duration(milliseconds: 700),
                childAnimationBuilder: (widget) => SlideAnimation(
                  horizontalOffset: 50.0,
                  child: FadeInAnimation(
                    child: widget,
                  ),
                ),
                children: List.generate(
                  5,
                      (index) => Container(
                    height: _selectedImages[index]==null ? getHeight(150):getHeight(400),
                    margin: EdgeInsets.all(2.w),
                    padding: EdgeInsets.all(3.w),
                    decoration: BoxDecoration(
                      color: AppColors.backGroundColor,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.textFieldHintText.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 7,
                          offset: const Offset(0, 2),
                        ),
                      ],
                      borderRadius: const BorderRadius.all(Radius.circular(6)),
                    ),
                    child: DottedBorder(
                      color: AppColors.secondaryColor,
                      strokeWidth: 1,
                      dashPattern: const [8, 6],
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          UtilityWidgets.MainText(
                            imageTexts[index], // Accessing text from the list using index
                            size: 9.sp,
                            color: AppColors.textColor,
                          ),
                          boxHeight(10),
                          Expanded(
                            child: Stack(
                              children: [
                                if (_selectedImages[index] != null)
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      image: DecorationImage(
                                        image: FileImage(_selectedImages[index]!),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                if (_selectedImages[index] != null)
                                  Positioned(
                                    top: 5,
                                    right: 5,
                                    child: InkWell(
                                      onTap: () {
                                        _removeImage(index);
                                      },
                                      child: const Icon(
                                        Icons.remove_circle,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          if (_selectedImages[index] == null) // Show upload button only if no image is selected
                            boxHeight(10),
                          ElevatedButton.icon(
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) {
                                  return SafeArea(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        ListTile(
                                          leading: const Icon(Icons.photo),
                                          title: const Text('Gallery'),
                                          onTap: () {
                                            Navigator.pop(context);
                                            _getImage(ImageSource.gallery, index);
                                          },
                                        ),
                                        ListTile(
                                          leading: const Icon(Icons.camera),
                                          title: const Text('Camera'),
                                          onTap: () {
                                            Navigator.pop(context);
                                            _getImage(ImageSource.camera, index);
                                          },
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            icon: const Icon(Icons.upload,color: AppColors.backGroundColor,),
                            label: UtilityWidgets.MainText("Uplode",size: 10.sp,color: AppColors.backGroundColor),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.secondaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                ),


              ),
            ),

          ),

        ),
      ),
    );
  }

}
