import 'package:flutter/material.dart';
import 'package:one_line_review_app/network/api.dart';
<<<<<<< HEAD
=======
import 'package:one_line_review_app/constant/constant.dart';
import 'package:one_line_review_app/components/HashTagButton.dart';
<<<<<<< HEAD
>>>>>>> upstream_dev/dev
=======
import 'package:one_line_review_app/components/RecentReviewCard.dart';

// Carousel slider
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

class FullscreenSliderDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    final double height = MediaQuery.of(context).size.height;
    final double height = 320.0;
    return CarouselSlider(
      options: CarouselOptions(
        height: height,
        viewportFraction: 1.0,
        enlargeCenterPage: false,
        // autoPlay: false,
      ),
      items: imgList
          .map((item) => Container(
                child: Center(
                    child: Image.network(
                  item,
                  fit: BoxFit.cover,
                  height: height,
                )),
              ))
          .toList(),
    );
  }
}
>>>>>>> upstream_dev/dev

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var diorList = HttpHelper.getBrandProduct('dior');

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          /**
           * Carousel slider
           */
          FullscreenSliderDemo(),
          /**
           * 1번째 section
           */
          Container(
            decoration: BoxDecoration(
              color: Colors.black45,
            ),
            padding: EdgeInsets.only(left: 20.0, top: 20.0, bottom: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '꿀같은 휴일, \n 가볍게 국내 드라마 정주행!',
                  style: HeaderTextStyleWhite,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    Text('#국내 '),
                    Text('#로맨스 '),
                    Text('#드라마 '),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          ),

          /**
           * 2번째 section
           */
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            padding: EdgeInsets.only(
              left: 20.0,
              top: 20.0,
              bottom: 20.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      '관심 키워드',
                      style: HeaderHighlightTextStyle,
                    ),
                    Text(
                      '와 관련된',
                      style: HeaderTextStyleBlack,
                    ),
                    Text(
                      '최근 리뷰',
                      style: HeaderHighlightTextStyle,
                    ),
                    Text(
                      '에요',
                      style: HeaderTextStyleBlack,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    HashTagButton(
                      tagName: '#로맨스',
                    ),
                    HashTagButton(
                      tagName: '#드라마',
                    ),
                    HashTagButton(
                      tagName: '#로맨틱코미디',
                    ),
                    HashTagButton(
                      tagName: '#SF',
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                RecentReviewCard(),
                SizedBox(
                  height: 10.0,
                ),
                RecentReviewCard(),
                SizedBox(
                  height: 10.0,
                ),
                RecentReviewCard(),
              ],
            ),
          ),

          /**
           * 3번째 section
           */
          Container(
            decoration: BoxDecoration(
              color: Color(0xfff7f7f7),
            ),
            padding: EdgeInsets.only(left: 20.0, top: 20.0, bottom: 20.0),
            child: Column(
              children: [
                Row(
                  children: [
                    RichText(
                      text: TextSpan(children: <TextSpan>[
                        TextSpan(
                          text: '#로맨스',
                          style: HeaderHighlightTextStyle,
                        ),
                        TextSpan(
                          text: '분야의 HOT한 한줄러들을 \n',
                          style: HeaderTextStyleBlack,
                        ),
                        TextSpan(
                          text: '팔로우 해보세요!',
                          style: HeaderTextStyleBlack,
                        ),
                      ]),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
