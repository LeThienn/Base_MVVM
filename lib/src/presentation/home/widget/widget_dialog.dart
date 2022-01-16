import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WidgetDialog extends StatelessWidget {
  final TextEditingController latController;
  final TextEditingController longController;
  const WidgetDialog({
    Key? key,
    required this.latController,
    required this.longController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height,
      child: Column(
        children: [
          TextFormField(
            controller: latController,
            decoration: InputDecoration(hintText: "Lat"),
          ),
          SizedBox(height: 20),
          TextFormField(
            controller: longController,
            decoration: InputDecoration(hintText: "Long"),
          ),
          SizedBox(height: 20),
          InkWell(
            child: Container(
              width: 200,
              height: 70,
              child: Center(
                child: Text("Accept"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
