import 'package:flutter/material.dart';
import 'package:flutter_components/widgets/widgets.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card Widget'),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        children: const [
          CustomCardType1(),
          SizedBox(height: 10),
          CustomCardType2(
            name: 'Un hermoso paisaje',
            imageUrl: 'https://photographylife.com/wp-content/uploads/2017/01/What-is-landscape-photography.jpg',
          ),
          SizedBox(height: 10),
          CustomCardType2(
            imageUrl: 'http://www.solofondos.com/wp-content/uploads/2016/04/mountain-landscape-wallpaper.jpg',
          ),
          SizedBox(height: 10),
          CustomCardType2(
            imageUrl: 'https://avivamientochaco.com/web/wp-content/uploads/2018/10/travel-landscape-01.jpg',
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}
