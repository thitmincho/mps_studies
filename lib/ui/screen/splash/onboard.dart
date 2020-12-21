import 'package:flutter/material.dart';

class SliderModel {
  String imageAssetPath;
  String title;

  SliderModel({this.imageAssetPath, this.title});

  void setImageAssetPath(String getImageAssetPath) {
    imageAssetPath = getImageAssetPath;
  }

  void setTitle(String getTitle) {
    title = getTitle;
  }

  String getImageAssetPath() {
    return imageAssetPath;
  }

  String getTitle() {
    return title;
  }
}

List<SliderModel> getSlides() {
  List<SliderModel> slides = new List<SliderModel>();
  SliderModel sliderModel = new SliderModel();

  //1
  sliderModel.setTitle("Search of Political Knowledge");
  sliderModel.setImageAssetPath("assets/images/slide_logo.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //2
  sliderModel.setTitle("Effective Learning");
  sliderModel.setImageAssetPath("assets/images/slide_logo.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  //3
  sliderModel.setTitle("Get Updated about Daily politics");
  sliderModel.setImageAssetPath("assets/images/slide_logo.png");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  return slides;
}
