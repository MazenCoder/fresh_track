import 'package:get/get.dart';
import '../usecases/img.dart';

class SliderModel {
  String imageAssetPath;
  String title;
  String desc;

  SliderModel({
    required this.imageAssetPath,
    required this.title,
    required this.desc,
  });

  void setImageAssetPath(String getImageAssetPath) {
    imageAssetPath = getImageAssetPath;
  }

  void setTitle(String getTitle) {
    title = getTitle;
  }

  void setDesc(String getDesc) {
    desc = getDesc;
  }

  String getImageAssetPath() {
    return imageAssetPath;
  }

  String getTitle() {
    return title;
  }

  String getDesc() {
    return desc;
  }

  static List<SliderModel> getSlides() {
    List<SliderModel> slides = <SliderModel>[];
    SliderModel sliderModel = SliderModel(
      title: 'intro_1'.tr,
      desc: 'intro_2'.tr,
      imageAssetPath: IMG.logo,
    );

    // slider 0
    slides.add(sliderModel);
    sliderModel = SliderModel(
      title: 'intro_3'.tr,
      desc: 'intro_4'.tr,
      imageAssetPath: IMG.logo,
    );

    // slider 1
    slides.add(sliderModel);
    sliderModel = SliderModel(
      title: 'intro_5'.tr,
      desc: 'intro_6'.tr,
      imageAssetPath: IMG.logo,
    );

    // slider 2
    slides.add(sliderModel);
    sliderModel = SliderModel(
      title: 'intro_7'.tr,
      desc: 'intro_8'.tr,
      imageAssetPath: IMG.logo,
    );

    // slider 3
    slides.add(sliderModel);

    return slides;
  }
}
