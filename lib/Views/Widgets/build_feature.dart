import 'package:flutter/material.dart';
import 'package:hd_bank/Models/feature.dart';
import 'package:hd_bank/Utils/base_style.dart';
import 'package:hd_bank/Utils/fake_data.dart';
import 'package:hd_bank/Views/Screens/payment.dart';

class BuildFeatures extends StatelessWidget {
  const BuildFeatures({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Feature> features = Data.getFuture();
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 300,
            child: GridView.count(
              crossAxisCount: 3,
              mainAxisSpacing: 2,
              padding: const EdgeInsets.all(16),
              children: List.generate(features.length,
                  (index) => buildFeature(features[index], context)),
            ),
          )
        ],
      ),
    );
  }

  Widget buildFeature(Feature feature, BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("Nhấn");
        onClick(feature.type, context);
      },
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: feature.bachgroundColor,
            radius: feature.radius,
            child: Padding(
              padding: EdgeInsets.all(feature.padding),
              child: Image.asset(feature.image),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            feature.name,
            style: BaseTextStyle.caption(color: BaseColor.black),
          )
        ],
      ),
    );
  }

  void onClick(EActionType type, BuildContext context) {
    switch (type) {
      case EActionType.Tuition:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Payment()),
        );

        break;
      case EActionType.Default:
        break;
    }
  }
}
