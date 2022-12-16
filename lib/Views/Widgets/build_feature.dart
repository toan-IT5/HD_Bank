import 'package:flutter/material.dart';
import 'package:hd_bank/Models/feature.dart';
import 'package:hd_bank/Notifilers/app_notifiler.dart';
import 'package:hd_bank/Utils/base_style.dart';
import 'package:provider/provider.dart';

class BuildFeatures extends StatelessWidget {
  const BuildFeatures({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Feature> features = Provider.of<AppNotifiler>(context).getFuture();
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
              children: List.generate(
                  features.length, (index) => buildFeature(features[index])),
            ),
          )
        ],
      ),
    );
  }

  Widget buildFeature(Feature feature) {
    return GestureDetector(
      onTap: () {},
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
}
