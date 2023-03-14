import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter/material.dart';
import 'dart:html';
import 'package:project/paymt.dart';
import 'package:project/received.dart';

import 'dashboard.dart';

class FeedbackWidget extends StatefulWidget {
  const FeedbackWidget({super.key});

  @override
  _FeedbackState createState() => _FeedbackState();
}

class _FeedbackState extends State<FeedbackWidget> {

  final TextEditingController _feedbackController = TextEditingController();
  
  @override
  void dispose() {
    _feedbackController.dispose();
    super.dispose();
  }

  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Give Feedback', style: TextStyle(
            fontFamily: 'Barlow Semi Condensed',
              color: Color.fromRGBO(50, 41, 57, 1),
              fontWeight: FontWeight.w900,
              fontSize: 32,
          ),),
          backgroundColor: Color.fromRGBO(201, 199, 126, 1),
        ),
        backgroundColor: Color.fromRGBO(201, 199, 126, 1),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Title(
                  color: Color.fromRGBO(50, 41, 57, 1),
                  child: Text(
                    'Please Rate Our service',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Barlow Semi Condensed'),
                  )),
              Container(
                child: RatingBar.builder(
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Color.fromRGBO(187, 144, 45, 1),
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                )
              ),
              //Spacer(flex: 1,),

              Text(
                'Care to share more about it',
                style: TextStyle(
                    fontFamily: 'Barlow Semi Condensed',
                    fontWeight: FontWeight.normal,
                    fontSize: 20,
                    color: Colors.black),
              ),



              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  controller: _feedbackController,
                  maxLines: null,
                  
                  decoration: InputDecoration(
                    hintText: 'Please enter your feedback here...',
                    filled: true,
                    fillColor: Color.fromRGBO(217, 217, 217, 1),
                     contentPadding:
                          EdgeInsets.symmetric(vertical: 120, horizontal: 10),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      )
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsetsDirectional.only(bottom: 30),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(50, 41, 57, 1)),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const VerifiedFeedbackWidget()));
                  },
                  child: Text(
                    ' Submit Feedback',
                    style: TextStyle(
                        fontFamily: 'Barlow Semi Condensed',
                        color: Color.fromRGBO(240, 236, 207, 1)),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
