import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_grocery/const.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../model/category.dart';


class PopularCategoryCard extends StatelessWidget {
  final Category category;
  const PopularCategoryCard({Key? key,
  required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 5, 10),
      child: CachedNetworkImage(
        imageUrl: baseUrl + category.image,
        imageBuilder: (context, imageProvide) => Material(
          elevation: 8,
          shadowColor: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            width: 270,
            height: 140,
            decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10),
                image:   DecorationImage(image: imageProvide, fit: BoxFit.cover)
            ),
            child: Padding(
              padding: const EdgeInsets.all(0.5),
              child: Text(
                category.name,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  //backgroundColor: Color.fromRGBO(255,255, 255, 0.4)
                  background: Paint()
                    ..color=Colors.green.shade900
                    ..strokeJoin = StrokeJoin.round
                    ..strokeCap = StrokeCap.round
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 25.0,

                ),
              ),
            ),
          ),
        ),
        placeholder: (context, url) => Material(
          elevation: 8,
          shadowColor: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(10),
          child: Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.white,
            child: Container(
              width: 270,
              height: 140,
              decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10)
              ),
            ),
          ),
        ),
        errorWidget: (context, url, error) => Material(
          elevation: 8,
          shadowColor: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(10),
          child: Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.white,
            child: Container(
              width: 270,
              height: 140,
              decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10)
              ),
              child:  const Center(
                child: Icon(
                  Icons.error_outline,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ) ,
      ),
    );
  }
}
