import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  final List<OnBoardingModel> _list = [
    OnBoardingModel(AppStrings.onBoardingTitle1, AppStrings.onBoardingSubTitle1,
        ImageAssets.onBoarding1),
    OnBoardingModel(AppStrings.onBoardingTitle2, AppStrings.onBoardingSubTitle2,
        ImageAssets.onBoarding2),
    OnBoardingModel(AppStrings.onBoardingTitle3, AppStrings.onBoardingSubTitle3,
        ImageAssets.onBoarding3),
  ];

  final PageController _pageController = PageController();
  int _currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
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
          itemCount: _list.length,
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _currentPageIndex = index;
            });
          },
          itemBuilder: (context, index) {
            return OnBoardingPage(_list[index]);
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
            _getBottomSheet(),
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
            pageIndex = _getPreviousPageIndex();
          } else {
            pageIndex = _getNextPageIndex();
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

  Widget _getCircleWidget(int index) {
    if (index == _currentPageIndex) {
      return SvgPicture.asset(ImageAssets.hollowCircleIcon);
    }

    return SvgPicture.asset(ImageAssets.solidCircleIcon);
  }

  Widget _getBottomSheet() {
    return Container(
      color: ColorManager.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _getArrowWidget(ImageAssets.arrowLeftIcon),
          Row(
            children: [
              for (int i = 0; i < _list.length; i++)
                Padding(
                  padding: const EdgeInsets.all(AppPadding.p8),
                  child: _getCircleWidget(i),
                )
            ],
          ),
          _getArrowWidget(ImageAssets.arrowRightIcon),
        ],
      ),
    );
  }

  int _getPreviousPageIndex() {
    if (_currentPageIndex - 1 == -1) {
      return _list.length - 1;
    } else {
      return _currentPageIndex - 1;
    }
  }

  int _getNextPageIndex() {
    if (_currentPageIndex + 1 == _list.length) {
      return 0;
    } else {
      return _currentPageIndex + 1;
    }
  }
}

class OnBoardingPage extends StatelessWidget {
  final OnBoardingModel _model;

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

class OnBoardingModel {
  String title;
  String subTitle;
  String image;

  OnBoardingModel(this.title, this.subTitle, this.image);
}
