import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onlne_test_app/modale/qustionModle.dart';
import 'package:onlne_test_app/widget/answerOption.dart';
import 'package:onlne_test_app/widget/reviewTile.dart';

import 'controlar/omrnswer.dart';
import 'controlar/timer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

final CountDownTimerState TimerState = Get.put(CountDownTimerState());

OmrSheetAnswer listOfAnswerAndState = OmrSheetAnswer();

class _MyHomePageState extends State<MyHomePage> {
  int selectOption = 0;
  int _counter = 0;
  RxInt questionNo = 1.obs;
  int minTimer = 59;
  int scTimer = 59;
  RxBool option1Select = false.obs;
  RxBool option2Select = false.obs;
  RxBool option3Select = false.obs;
  RxBool option4Select = false.obs;
  // List<int> listOfAnswer = [];
  // List<int> listOfState = [];
  int attemptedQuestion = 0;
  int qustionForReview = 0;
  bool reviewView = true;
  @override
  void initState() {
    // TODO: implement initState
    TimerState.StateTimerStart();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff00AB99),
        title: const Text("SSC-CGL-Test"),
        centerTitle: true,
        bottom: const PreferredSize(
            child: Padding(
              padding: EdgeInsets.all(4.0),
              child: Text(
                "Full Length Test",
                style: TextStyle(color: Colors.white),
              ),
            ),
            preferredSize: Size.zero),
        leading: const Padding(
          padding: EdgeInsets.only(top: 13.0, left: 5),
          child: Text(
            "60Min",
            style: TextStyle(fontSize: 18),
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(13.0),
            child: Icon(Icons.menu),
          )
        ],
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 10),
                  child: Obx(((() => Text(
                        "Qs-$questionNo",
                        style: TextStyle(fontSize: 20),
                      ))))),
              GetBuilder<CountDownTimerState>(
                builder: (_) => Text(
                  '${TimerState.min} : ${TimerState.seconds}',
                  style: const TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: const Color(0xff00AB99),
                    ),
                    Icon(Icons.close, color: Colors.red)
                  ],
                ),
              )
            ],
          ),
          Divider(color: const Color(0xff00AB99), thickness: 2),
          Expanded(
            child: reviewView
                ? Column(children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          Container(
                            child: Obx(((() => Text("$questionNo .",
                                style: TextStyle(fontSize: 20))))),
                          ),
                          Container(
                            width: width - 75,
                            child: const Text(
                                textAlign: TextAlign.justify,
                                maxLines: 10,
                                style: TextStyle(fontSize: 15),
                                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, "),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          selectOption = 1;
                          option1Select = true.obs;
                          option2Select = false.obs;
                          option3Select = false.obs;
                          option4Select = false.obs;
                          setState(() {});
                        },
                        child: Option(
                          Selected: option1Select,
                          option: "a",
                          OptionText: "Option A is correct",
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          selectOption = 2;
                          option1Select = false.obs;
                          option2Select = true.obs;
                          option3Select = false.obs;
                          option4Select = false.obs;
                          setState(() {});
                        },
                        child: Option(
                          Selected: option2Select,
                          option: "b",
                          OptionText: "Option b is correct",
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          selectOption = 3;
                          option1Select = false.obs;
                          option2Select = false.obs;
                          option3Select = true.obs;
                          option4Select = false.obs;
                          setState(() {});
                        },
                        child: Option(
                          Selected: option3Select,
                          option: "c",
                          OptionText: "Option c is correct",
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          selectOption = 4;
                          option1Select = false.obs;
                          option2Select = false.obs;
                          option3Select = false.obs;
                          option4Select = true.obs;
                          setState(() {});
                        },
                        child: Option(
                          Selected: option4Select,
                          option: "d",
                          OptionText: "Option d is correct",
                        ),
                      ),
                    )
                  ])
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Column(
                        children: [
                          ReviewTile(
                            icon: Icon(
                              Icons.circle,
                              color: Color(0xffc5DC72),
                            ),
                            icon2: Icon(Icons.done_outline_rounded),
                            OptionText: "Attempted Question",
                            numberOf: attemptedQuestion,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ReviewTile(
                            icon: Icon(
                              Icons.circle,
                              color: Color(0xffBDBFC1),
                            ),
                            icon2: Icon(Icons.close_sharp),
                            OptionText: "Not Attempted Question",
                            numberOf: 100 - attemptedQuestion,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ReviewTile(
                            icon: Icon(
                              Icons.star,
                              color: Color(0xffFFCC29),
                            ),
                            icon2: Icon(Icons.file_open),
                            OptionText: "Question For Review",
                            numberOf: qustionForReview,
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          GridView.builder(
                            itemCount: 100,
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 10,
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              bool colorBool = true;
                              int index2 = index + 1;
                              bool starIcon = false;
                              if (listOfAnswerAndState.answerList.length >=
                                  index + 1) {
                                if (listOfAnswerAndState.answerList[index] !=
                                    0) {
                                  colorBool = false;
                                }
                              }
                              if (listOfAnswerAndState.answerList.length >=
                                  index + 1) {
                                if (listOfAnswerAndState.answerList[index] ==
                                    2) {
                                  starIcon = true;
                                }
                              }
                              return Card(
                                child: Container(
                                  // footer: new Text(""),
                                  child: Stack(children: [
                                    Center(
                                      child: Icon(
                                        Icons.circle,
                                        color: colorBool
                                            ? Color(0xffBDBFC1)
                                            : Color(0xffC5DC72),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 6),
                                      child: Visibility(
                                          visible: starIcon,
                                          child: Icon(
                                            Icons.star,
                                            size: 20,
                                            color: Color(0xffFFCC29),
                                          )),
                                    ),
                                    Center(child: Text("$index2")),
                                  ]),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15, left: 15, bottom: 5),
            child: Visibility(
              visible: reviewView,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    child: Row(
                      children: [
                        Container(
                          height: 30,
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 2, color: const Color(0xff00AB99)),
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              if (listOfAnswerAndState.answerList.length <
                                      (questionNo.toInt()) ||
                                  listOfAnswerAndState.answerList.length == 0) {
                                listOfAnswerAndState.addanswer(2, selectOption);
                                option1Select = false.obs;
                                option2Select = false.obs;
                                option3Select = false.obs;
                                option4Select = false.obs;
                                selectOption = 0;
                                if (questionNo > 100) {
                                  questionNo.update(questionNo++);
                                }
                              } else {
                                if (listOfAnswerAndState
                                        .fatchanswer(questionNo.toInt() - 1) ==
                                    1) {
                                  option1Select = true.obs;
                                }
                                if (listOfAnswerAndState
                                        .fatchanswer(questionNo.toInt() - 1) ==
                                    4) {
                                  option4Select = true.obs;
                                }
                                if (listOfAnswerAndState
                                        .fatchanswer(questionNo.toInt() - 1) ==
                                    2) {
                                  option2Select = true.obs;
                                }
                                if (listOfAnswerAndState
                                        .fatchanswer(questionNo.toInt() - 1) ==
                                    3) {
                                  option3Select = true.obs;
                                }
                                option1Select = false.obs;
                                option2Select = false.obs;
                                option3Select = false.obs;
                                option4Select = false.obs;
                              }
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  child: Icon(
                                    Icons.remove_red_eye_outlined,
                                    color: Color(0xff00AB99),
                                  ),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      border: Border(
                                          right: BorderSide(
                                              width: 2,
                                              color: const Color(0xff00AB99)))),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Review Later",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff00AB99)),
                                ),
                                SizedBox(
                                  width: 5,
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 30,
                    child: ElevatedButton(
                      child: Text("Sava & Next"),
                      onPressed: () {
                        if (listOfAnswerAndState.answerList.length <
                                (questionNo.toInt()) ||
                            listOfAnswerAndState.answerList.length == 0) {
                          listOfAnswerAndState.addanswer(1, selectOption);
                          option1Select = false.obs;
                          option2Select = false.obs;
                          option3Select = false.obs;
                          option4Select = false.obs;
                          selectOption = 0;
                          setState(() {});
                          if (questionNo < 100) {
                            questionNo.update(questionNo++);
                          }
                        } else {
                          option1Select = false.obs;
                          option2Select = false.obs;
                          option3Select = false.obs;
                          option4Select = false.obs;
                          if (listOfAnswerAndState
                                  .answerList[questionNo.toInt() - 1]
                                  .selectedOption ==
                              1) {
                            option1Select = true.obs;
                          }
                          if (listOfAnswerAndState
                                  .answerList[questionNo.toInt() - 1]
                                  .selectedOption == 4) {
                            option4Select = true.obs;
                          }
                          if (listOfAnswerAndState
                                  .answerList[questionNo.toInt() - 1]
                                  .selectedOption == 2) {
                            option2Select = true.obs;
                          }
                          if (listOfAnswerAndState
                                  .answerList[questionNo.toInt() - 1]
                                  .selectedOption == 3) {
                            option3Select = true.obs;
                          }

                          if (questionNo > 1 && questionNo < 100) {
                            questionNo.update(questionNo++);
                          }
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0xff00AB99)),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      option1Select = false.obs;
                      option2Select = false.obs;
                      option3Select = false.obs;
                      option4Select = false.obs;
                      selectOption = 0;
                    },
                    child: Row(
                      children: [
                        Container(
                          height: 30,
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 2, color: const Color(0xff00AB99)),
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                child: Icon(
                                  Icons.close,
                                  color: Color(0xff00AB99),
                                ),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    border: Border(
                                        right: BorderSide(
                                            width: 2,
                                            color: const Color(0xff00AB99)))),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Clear Answer",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff00AB99)),
                              ),
                              SizedBox(
                                width: 5,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 50,
            color: Color(0xff00AB99),
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: reviewView
                        ? () {
                            qustionForReview = 0;
                            attemptedQuestion = 0;

                            option1Select = false.obs;
                            option2Select = false.obs;
                            option3Select = false.obs;
                            option4Select = false.obs;
                            if (listOfAnswerAndState
                                        .fatchanswer(questionNo.value - 1) ==
                                    1 &&
                                questionNo > 1) {
                              option1Select = true.obs;
                            }
                            if (listOfAnswerAndState
                                        .fatchanswer(questionNo.value - 1) ==
                                    4 &&
                                questionNo > 1) {
                              option4Select = true.obs;
                            }
                            if (listOfAnswerAndState
                                        .fatchanswer(questionNo.value - 1) ==
                                    2 &&
                                questionNo > 1) {
                              option2Select = true.obs;
                            }
                            if (listOfAnswerAndState
                                        .fatchanswer(questionNo.value - 1) ==
                                    3 &&
                                questionNo > 1) {
                              option3Select = true.obs;
                            }

                            if (questionNo > 1) {
                              questionNo.update(questionNo--);
                            }

                            setState(() {});
                          }
                        : () {
                            reviewView = true;
                            setState(() {});
                          },
                    child: Row(
                      children: [
                        Container(
                          height: 15,
                          width: 15,
                          child: Icon(
                            Icons.arrow_back_ios_new_outlined,
                            color: Color(0xff00AB99),
                            size: 14,
                          ),
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Back",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 30,
                    child: ElevatedButton(
                      child: Text(
                        reviewView ? "Review & Submit" : "Submit Test",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        if (reviewView == true) {
                          reviewView = false;
                          attemptedQuestion = 0;
                          qustionForReview = 0;
                          listOfAnswerAndState.answerList.forEach(
                            (element) {
                              if (element.selectedOption != 0) {
                                attemptedQuestion++;
                              }
                            },
                          );
                          listOfAnswerAndState.answerList.forEach(
                            (element) {
                              if (element.stateOfQustion == 2) {
                                qustionForReview++;
                              }
                            },
                          );
                          setState(() {});
                        }
                      },
                      style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all(
                              const Color(0xff00AB99)),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white)),
                    ),
                  ),
                  reviewView
                      ? GestureDetector(
                          onTap: () {
                            if (listOfAnswerAndState.answerList.length <
                                    (questionNo.toInt()) ||
                                listOfAnswerAndState.answerList.length == 0) {
                              listOfAnswerAndState.addanswer(0, 0);
                              option1Select = false.obs;
                              option2Select = false.obs;
                              option3Select = false.obs;
                              option4Select = false.obs;
                              selectOption = 0;
                              questionNo.update(questionNo++);
                            } else {
                              option1Select = false.obs;
                              option2Select = false.obs;
                              option3Select = false.obs;
                              option4Select = false.obs;
                              if (listOfAnswerAndState
                                      .fatchanswer(questionNo.value - 1) ==
                                  1) {
                                option1Select = true.obs;
                              }
                              if (listOfAnswerAndState
                                      .fatchanswer(questionNo.value - 1) ==
                                  4) {
                                option4Select = true.obs;
                              }
                              if (listOfAnswerAndState
                                      .fatchanswer(questionNo.value - 1) ==
                                  2) {
                                option2Select = true.obs;
                              }
                              if (listOfAnswerAndState
                                      .fatchanswer(questionNo.value - 1) ==
                                  3) {
                                option3Select = true.obs;
                              }

                              if (questionNo > 1 && questionNo < 100) {
                                questionNo.update(questionNo++);
                              }
                            }
                          },
                          child: Row(
                            children: [
                              Text(
                                "Skip",
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                height: 15,
                                width: 15,
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Color(0xff00AB99),
                                  size: 14,
                                ),
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                              ),
                            ],
                          ),
                        )
                      : Container(
                          width: 50,
                        ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
