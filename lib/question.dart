import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/database.dart';
import 'package:custom_timer/custom_timer.dart';
import 'score.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({Key? key}) : super(key: key);

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  final CustomTimerController _controller = CustomTimerController();
  Color baseColor1 = Color.fromARGB(204, 170, 217, 251);
  Color baseColor2 = Color.fromARGB(204, 170, 217, 251);
  Color baseColor3 = Color.fromARGB(204, 170, 217, 251);
  Color baseColor4 = Color.fromARGB(204, 170, 217, 251);
  Color wrong = Color.fromARGB(204, 243, 119, 119);
  Color correct = Color.fromARGB(204, 181, 253, 181);
  int score = 0;
  int e = 0;
  int q = 1;
  @override
  void initState() {
    _controller.start();
    super.initState();
  }

  @override
  void changeColor(int check) {
    if (sample_data[e]['answer_index'] == 0) {
      setState(() {
        baseColor1 = correct;
        baseColor2 = wrong;
        baseColor3 = wrong;
        baseColor4 = wrong;
        if (check == sample_data[e]['answer_index']) {
          score = score + 10;
        }
      });
    } else if (sample_data[e]['answer_index'] == 1) {
      setState(() {
        baseColor1 = wrong;
        baseColor2 = correct;
        baseColor3 = wrong;
        baseColor4 = wrong;
        if (check == sample_data[e]['answer_index']) {
          score = score + 10;
        }
      });
    } else if (sample_data[e]['answer_index'] == 2) {
      setState(() {
        baseColor1 = wrong;
        baseColor2 = wrong;
        baseColor3 = correct;
        baseColor4 = wrong;
        if (check == sample_data[e]['answer_index']) {
          score = score + 10;
        }
      });
    } else if (sample_data[e]['answer_index'] == 3) {
      setState(() {
        baseColor1 = wrong;
        baseColor2 = wrong;
        baseColor3 = wrong;
        baseColor4 = correct;
        if (check == sample_data[e]['answer_index']) {
          score = score + 10;
        }
      });
    }
    Future.delayed(Duration(milliseconds: 500), () async {
      setState(() {
        if (e == 4) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FinalScreen(score)),
          );
        } else {
          e++;
          q++;
        }
        baseColor1 = Color.fromARGB(204, 170, 217, 251);
        baseColor2 = Color.fromARGB(204, 170, 217, 251);
        baseColor3 = Color.fromARGB(204, 170, 217, 251);
        baseColor4 = Color.fromARGB(204, 170, 217, 251);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/bg.png'), fit: BoxFit.cover),
          ),
        ),
        SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomTimer(
                    controller: _controller,
                    begin: const Duration(minutes: 2),
                    end: Duration(),
                    builder: (time) {
                      return Text("${time.minutes}:${time.seconds}::${time.milliseconds}",
                          style: TextStyle(fontSize: 24.0));
                    }),
                SizedBox(
                  height: 20,
                ),
                Text(score.toString()),
                SizedBox(height: 70),
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        // border: Border.all(
                        //   color: Colors.white,
                        //   width: 2,
                        // ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Q-$q',
                            style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                fontFamily: GoogleFonts.arvo().fontFamily,
                                color: Colors.white),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Flexible(
                            child: Text(
                              sample_data[e]['question'].toString(),
                              style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: GoogleFonts.arvo().fontFamily,
                                  color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 50),
                    ElevatedButton(
                        onPressed: () {
                          
                            changeColor(0);
                       
                        },
                        style: ElevatedButton.styleFrom(
                            fixedSize: Size(380, 60), primary: baseColor1),
                        child: Row(
                          children: [
                            Icon(
                              Icons.arrow_right,
                              color: Colors.black,
                              size: 26,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              sample_data[e]['options'][0].toString(),
                              style: TextStyle(fontSize: 26),
                            )
                          ],
                        )),
                    SizedBox(height: 10),
                    ElevatedButton(
                        onPressed: () {
                          
                            changeColor(1);
                       
                        },
                        style: ElevatedButton.styleFrom(
                            fixedSize: Size(380, 60), primary: baseColor2),
                        child: Row(
                          children: [
                            Icon(
                              Icons.arrow_right,
                              color: Colors.black,
                              size: 26,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              sample_data[e]['options'][1].toString(),
                              style: TextStyle(fontSize: 26),
                            )
                          ],
                        )),
                    SizedBox(height: 10),
                    ElevatedButton(
                        onPressed: () {
                          
                            changeColor(2);
                        
                        },
                        style: ElevatedButton.styleFrom(
                            fixedSize: Size(380, 60), primary: baseColor3),
                        child: Row(
                          children: [
                            Icon(
                              Icons.arrow_right,
                              color: Colors.black,
                              size: 26,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              sample_data[e]['options'][2].toString(),
                              style: TextStyle(fontSize: 26),
                            )
                          ],
                        )),
                    SizedBox(height: 10),
                    ElevatedButton(
                        onPressed: () {
                         
                            changeColor(3);
                       
                        },
                        style: ElevatedButton.styleFrom(
                            fixedSize: Size(380, 60), primary: baseColor4),
                        child: Row(
                          children: [
                            Icon(
                              Icons.arrow_right,
                              color: Colors.black,
                              size: 26,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              sample_data[e]['options'][3].toString(),
                              style: TextStyle(fontSize: 26),
                            )
                          ],
                        )),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    ));
  }
}
