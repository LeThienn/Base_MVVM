import 'package:flutter/material.dart';
import 'package:flutter_app/src/configs/configs.dart';
import 'package:flutter_app/src/configs/constanst/app_colors.dart';
import 'package:flutter_app/src/presentation/home/home_viewmodel.dart';
import 'package:get/get.dart';

import '../presentation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final HomeViewModel _viewModel;
  @override
  Widget build(BuildContext context) {
    return BaseWidget<HomeViewModel>(
      viewModel: HomeViewModel(),
      onViewModelReady: (viewModel) => _viewModel = viewModel!..init(),
      builder: (context, viewModel, child) {
        return Scaffold(
          backgroundColor: DARK_COLOR,
          body: _buildBody(),
        );
      },
    );
  }

  Widget _buildBody() {
    return Container(
      child: Column(
        children: [
          _appBar(),
          SizedBox(height: 10),
          Expanded(child: _bodyCenter()),
          SizedBox(height: 10),
          _bottomBar(),
        ],
      ),
    );
  }

  Widget _appBar() {
    return Container(
      height: AppBar().preferredSize.height,
      width: Get.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () {}, icon: Icon(Icons.add, color: Colors.white)),
          IconButton(
              onPressed: () => Get.toNamed(Routers.about),
              icon: Icon(Icons.info, color: Colors.white))
        ],
      ),
    );
  }

  Widget _bodyCenter() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Image.asset(_viewModel.weatherModel?.currently?.icon != null
                    ? "assets/images/${_viewModel.weatherModel?.currently?.icon}.png"
                    : "assets/images/default@3x.png"),
                SizedBox(width: 20),
                Text(
                  "${_viewModel.weatherModel?.currently?.summary ?? ""}",
                  style: STYLE_MEDIUM.copyWith(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              "${_viewModel.weatherModel?.currently?.temperature}",
              style: STYLE_LARGE.copyWith(color: Colors.white),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 100),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("30"),
                SizedBox(width: 10),
                Image.asset(
                  "assets/images/heatindexWinter.png",
                  width: Get.width * 0.6,
                ),
                SizedBox(width: 10),
                Text("30"),
              ],
            )
          ],
        ));
  }

  Widget _bottomBar() {
    return Container(
        height: 150,
        width: Get.width,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("THU",
                    style: STYLE_MEDIUM.copyWith(
                      color: Colors.white,
                    )),
                Text("FRI",
                    style: STYLE_MEDIUM.copyWith(
                      color: Colors.white,
                    )),
                Text("SAT",
                    style: STYLE_MEDIUM.copyWith(
                      color: Colors.white,
                    )),
                Text("SUN",
                    style: STYLE_MEDIUM.copyWith(
                      color: Colors.white,
                    )),
                Text("MON",
                    style: STYLE_MEDIUM.copyWith(
                      color: Colors.white,
                    )),
                Text("TUE",
                    style: STYLE_MEDIUM.copyWith(
                      color: Colors.white,
                    )),
                Text("WEB",
                    style: STYLE_MEDIUM.copyWith(
                      color: Colors.white,
                    )),
              ],
            ),
          ],
        ));
  }
}
