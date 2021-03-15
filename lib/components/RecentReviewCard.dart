import 'package:flutter/material.dart';

class RecentReviewCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(
          right: 20.0,
        ),
        height: 100.0,
        decoration: BoxDecoration(
          // Container의 boxShadow
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 9,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          color: Colors.white,
        ),
        child: Row(
          children: [
            //이미지로 변경 해야함.
            Container(
              width: 74.0,
              decoration: BoxDecoration(
                color: Color(0xffe5e5e5),
              ),
            ),
            SizedBox(
              height: 7.0,
            ),
            Flexible(
              child: Container(
                padding: EdgeInsets.only(
                  top: 20.0,
                  left: 20.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'SF처돌이님의 리뷰',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 14.0,
                        color: Color(0xff151515),
                      ),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      '한국 스페이스 영화의 성공적인 첫 스타트',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14.0,
                        color: Color(0xff151515),
                      ),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Row(
                      children: [
                        Text(
                          '9시간 전',
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff151515).withOpacity(0.5),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
