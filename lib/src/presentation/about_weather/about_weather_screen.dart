import 'package:flutter/material.dart';
import 'package:flutter_app/src/configs/configs.dart';
import 'package:flutter_app/src/presentation/about_weather/about_weather_viewmodel.dart';

import '../presentation.dart';

class AboutWeatherScreen extends StatefulWidget {
  const AboutWeatherScreen({Key? key}) : super(key: key);

  @override
  _AboutWeatherScreenState createState() => _AboutWeatherScreenState();
}

class _AboutWeatherScreenState extends State<AboutWeatherScreen> {
  late final AboutWeatherViewModel _viewModel;
  @override
  Widget build(BuildContext context) {
    return BaseWidget<AboutWeatherViewModel>(
      viewModel: AboutWeatherViewModel(),
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
      padding: EdgeInsets.all(100),
      child: Image.asset("assets/images/logoapp.png"),
    );
  }
}
