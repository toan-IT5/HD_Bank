import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hd_bank/Utils/base_style.dart';

class SarouselSlider extends StatelessWidget {
  const SarouselSlider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: BaseColor.orange,
            boxShadow: [BaseBoxShadow.common]),
        child: CarouselSlider(
          options: CarouselOptions(
            height: 150,
            viewportFraction: 1.0,
            enlargeCenterPage: false,
            enableInfiniteScroll: true,
            scrollDirection: Axis.horizontal,
            autoPlay: true,
          ),
          items: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: Image.asset("assets/images/baner.jpg").image,
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: Image.network(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcToE5dLhgQSzXblQZnZO647ad-ec0dts8JSUA&usqp=CAU")
                      .image,
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: Image.network(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTU819ByP602ORYghHePY_3EF5pMNP_K-aqkg&usqp=CAU")
                      .image,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
