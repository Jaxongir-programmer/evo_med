import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:evo_med/core/config/app_colors.dart';
import 'package:evo_med/core/routing/app_routing.dart';
import 'package:evo_med/core/service_locator.dart';
import 'package:evo_med/core/util/extensions/extensions.dart';
import 'package:evo_med/features/common/presentation/widgets/custom_button.dart';
import 'package:evo_med/features/on_boarding/presentation/blocs/on_boarding/on_boarding_bloc.dart';
import 'package:evo_med/features/on_boarding/presentation/widgets/on_boarding_body_widget.dart';
import 'package:evo_med/generated/locale_keys.g.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late final PageController _pageController;
  late final OnBoardingBloc _onBoardingBloc;

  int _activePage = 0;

  @override
  void initState() {
    _onBoardingBloc = OnBoardingBloc(onBoardingUseCase: serviceLocator(), createDeviceUseCase: serviceLocator())
      ..add(OnBoardingGetEvent());
    _pageController = PageController(
      initialPage: 0,
      keepPage: false,
    );
    super.initState();
  }

  nextPage() {
    _pageController.animateToPage(++_activePage, duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
  }

  goToAuth() async {
    context.goNamed(AppRouter.home);
  }

  @override
  void didChangeDependencies() {
    _onBoardingBloc.add(CreateDeviceEvent(language: context.locale.languageCode));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _onBoardingBloc,
      child: Scaffold(
        body: BlocBuilder<OnBoardingBloc, OnBoardingState>(
          builder: (context, state) {
            if (state.status.isSuccess) {
              return Column(
                children: [
                  Expanded(
                    flex: 10,
                    child: PageView.builder(
                      physics: const CustomPageViewScrollPhysics(),
                      controller: _pageController,
                      onPageChanged: (int page) {
                        setState(() {
                          _activePage = page;
                        });
                      },
                      itemCount: state.onBoardingList.length,
                      itemBuilder: (BuildContext context, int index) {
                        final onBoarding = state.onBoardingList[index];
                        return OnBoardingBodyWidget(
                          image: onBoarding.image,
                          title: onBoarding.title.titleByLocale,
                          description: onBoarding.description.titleByLocale,
                        );
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List<Widget>.generate(
                      state.onBoardingList.length,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(2),
                          onTap: () {
                            _pageController.animateToPage(index,
                                duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
                          },
                          child: CircleAvatar(
                            radius: 4,
                            backgroundColor: _activePage == index ? AppColors.dotActive : AppColors.dotInactive,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Gap(42),
                  CustomButton(
                    margin: EdgeInsets.only(
                      bottom: context.padding.bottom + 12,
                      right: 16,
                      left: 16,
                    ),
                    onTap: _activePage < state.onBoardingList.length - 1 ? nextPage : goToAuth,
                    text: LocaleKeys.btn_continue.tr(),
                  )
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}

class CustomPageViewScrollPhysics extends ScrollPhysics {
  const CustomPageViewScrollPhysics({super.parent});

  @override
  CustomPageViewScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return CustomPageViewScrollPhysics(parent: buildParent(ancestor)!);
  }

  @override
  SpringDescription get spring => const SpringDescription(
        mass: 50,
        stiffness: 100,
        damping: 0.8,
      );
}
