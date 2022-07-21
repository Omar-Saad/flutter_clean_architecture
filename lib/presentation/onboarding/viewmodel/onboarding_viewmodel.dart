import 'dart:async';

import 'package:flutter_clean_architecture/presentation/base/base_viewmodel.dart';

import '../../../domain/models.dart';
import '../../resources/assets_manager.dart';
import '../../resources/strings_manager.dart';

class OnBoardingViewModel extends BaseViewModel
    with OnBoardingViewModelInputs, OnBoardingViewModelOutputs {
  /// How to change data between view and view model ? Stream controfinal ller.
  final StreamController<SliderViewObject> _streamController =
      StreamController<SliderViewObject>();

  late List<SliderObject> _sliderObjects;

  int _currentPageIndex = 0;

  /// Base View model inputs.
  @override
  void dispose() {
    _streamController.close();
  }

  @override
  void start() {
    _sliderObjects = _getSliderObjects();
    _postDataToView();
  }

  /// OnBoarding View model inputs.
  @override
  int goToNextPage() {
    if (_currentPageIndex < _sliderObjects.length - 1) {
      _currentPageIndex++;
    } else {
      _currentPageIndex = 0;
    }
    return _currentPageIndex;
  }

  @override
  int goToPreviousPage() {
    if (_currentPageIndex - 1 < 0) {
      _currentPageIndex = _sliderObjects.length - 1;
    } else {
      _currentPageIndex--;
    }
    return _currentPageIndex;
  }

  @override
  void onPageChanged(int pageIndex) {
    _currentPageIndex = pageIndex;
    _postDataToView();
  }

  @override
  // TODO: implement inputSliderViewModel
  Sink get inputSliderViewObject => _streamController.sink;

  /// OnBoarding View model outputs.
  @override
  Stream<SliderViewObject> get outputSliderViewObject =>
      _streamController.stream
          .map((SliderViewObject sliderViewObject) => sliderViewObject);

  /// onBoarding private helper functions.
  List<SliderObject> _getSliderObjects() => [
        SliderObject(AppStrings.onBoardingTitle1,
            AppStrings.onBoardingSubTitle1, ImageAssets.onBoarding1),
        SliderObject(AppStrings.onBoardingTitle2,
            AppStrings.onBoardingSubTitle2, ImageAssets.onBoarding2),
        SliderObject(AppStrings.onBoardingTitle3,
            AppStrings.onBoardingSubTitle3, ImageAssets.onBoarding3),
      ];

  void _postDataToView() {
    inputSliderViewObject.add(SliderViewObject(
        _sliderObjects[_currentPageIndex],
        _sliderObjects.length,
        _currentPageIndex));
  }
}

/// When a view 'orders' to make any job.
abstract class OnBoardingViewModelInputs {
  /// called when user taps on the next button or swipe left.
  int goToNextPage();

  /// called when user taps on the previous button or swipe right.
  int goToPreviousPage();

  /// called when slider page changed.
  void onPageChanged(int pageIndex);

  /// stream controller input.
  Sink get inputSliderViewObject;
}

abstract class OnBoardingViewModelOutputs {
  Stream<SliderViewObject> get outputSliderViewObject;
}
