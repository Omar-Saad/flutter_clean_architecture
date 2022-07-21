/// OnBoarding models
class SliderObject {
  String title;
  String subTitle;
  String image;

  SliderObject(this.title, this.subTitle, this.image);
}

class SliderViewObject {
  SliderObject sliderModel;
  int currentPageIndex;
  int totalPages;

  SliderViewObject(this.sliderModel, this.totalPages, this.currentPageIndex);
}
