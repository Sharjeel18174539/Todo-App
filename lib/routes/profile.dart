import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar:AppBar(
          centerTitle: true,
          title: const Text('My Profile'),
          leading: IconButton(onPressed: (){
            Navigator.pop(context);
            },
              icon: const FaIcon(FontAwesomeIcons.arrowLeft)
          ),
        ),
        body: const Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage('images/Mycvimage.png', ),
                //child: Image(image: AssetImage('images/Mycvimage.png', )),
              ),
              SizedBox(height: 8,),
              Text('My self Md Sharjeel Farooqui ,'
                  ' I am a recent graduate from Indian Institute of Information Technology Bhopal with computer science and engineering.'
                  ' Apart from this If I talk about my problem Solving skills,'
                  ' I am proficient in C++, c, basic java , basic Python , and have solved more than'
                  ' 700 questions on different platforms like leetcode , gfg, code chef.Apart from this '
                  ' If I talk about my development skill I am full stack Flutter Developer and also having a hand on '
                  ' experience in mern stack web technologies html, CSS, JavaScript, ReactJS, NodeJS, ExpressJs and MongoDB,'
                  ' MySQL, SQL, PostgreSQL, firebase. I have made many project using flutter and dart one of my major project was '
                  ' Currency detection for visual impaired people, and one project was big Mart sales prediction'
                  ' which was machine learning project thats of from my side.'),
            ],
          ),
        ),
      ),
    );
  }
}
