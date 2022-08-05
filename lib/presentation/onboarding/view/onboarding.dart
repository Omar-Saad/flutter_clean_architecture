import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_clean_architecture/domain/models/models.dart';
import 'package:flutter_clean_architecture/presentation/onboarding/viewmodel/onboarding_viewmodel.dart';
import 'package:flutter_clean_architecture/presentation/resources/app_constants.dart';

import 'package:flutter_clean_architecture/presentation/resources/assets_manager.dart';
import 'package:flutter_clean_architecture/presentation/resources/color_manager.dart';
import 'package:flutter_clean_architecture/presentation/resources/routes_manager.dart';
import 'package:flutter_clean_architecture/presentation/resources/strings_manager.dart';
import 'package:flutter_clean_architecture/presentation/resources/values_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();
  final OnBoardingViewModel _viewModel = OnBoardingViewModel();

  _bindViewModel() {
    _viewModel.start();
  }

  @override
  void initState() {
    _bindViewModel();
    super.initState();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SliderViewObject>(
      builder: (context, snapshot) {
        return _getContentWidget(snapshot.data);
      },
      stream: _viewModel.outputSliderViewObject,
    );
  }

  Widget _getContentWidget(SliderViewObject? sliderViewObject) {
    if (sliderViewObject == null) {
      return Container();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ColorManager.white,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      backgroundColor: ColorManager.white,
      body: PageView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: sliderViewObject.totalPages,
          controller: _pageController,
          onPageChanged: (index) {
            _viewModel.onPageChanged(index);
          },
          itemBuilder: (context, index) {
            return OnBoardingPage(sliderViewObject.sliderModel);
          }),
      bottomSheet: Container(
        color: ColorManager.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, RoutesManager.register);
                    },
                    child: Text(
                      AppStrings.skip,
                      style: Theme.of(context).textTheme.titleMedium,
                    ))),
            _getBottomSheet(sliderViewObject),
          ],
        ),
      ),
    );
  }

  Widget _getArrowWidget(String image) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p14),
      child: GestureDetector(
        onTap: () {
          late int pageIndex;
          if (image == ImageAssets.arrowLeftIcon) {
            pageIndex = _viewModel.goToPreviousPage();
          } else {
            pageIndex = _viewModel.goToNextPage();
          }
          _pageController.animateToPage(pageIndex,
              duration: const Duration(
                  milliseconds: AppConstants.sliderAnimationTime),
              curve: Curves.bounceInOut);
        },
        child: SizedBox(
          width: AppSize.s20,
          height: AppSize.s20,
          child: SvgPicture.asset(
            image,
          ),
        ),
      ),
    );
  }

  Widget _getCircleWidget(int index, int currentIndex) {
    if (index == currentIndex) {
      return SvgPicture.asset(ImageAssets.hollowCircleIcon);
    }

    return SvgPicture.asset(ImageAssets.solidCircleIcon);
  }

  Widget _getBottomSheet(SliderViewObject sliderViewObject) {
    return Container(
      color: ColorManager.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _getArrowWidget(ImageAssets.arrowLeftIcon),
          Row(
            children: [
              for (int i = 0; i < sliderViewObject.totalPages; i++)
                Padding(
                  padding: const EdgeInsets.all(AppPadding.p8),
                  child: _getCircleWidget(i, sliderViewObject.currentPageIndex),
                )
            ],
          ),
          _getArrowWidget(ImageAssets.arrowRightIcon),
        ],
      ),
    );
  }
}

class OnBoardingPage extends StatelessWidget {
  final SliderObject _model;

  const OnBoardingPage(this._model, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: AppSize.s40,
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            _model.title,
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            _model.subTitle,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: AppSize.s60,
        ),
        SvgPicture.asset(_model.image),
      ],
    );
  }
}
