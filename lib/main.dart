// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bmi/SocialMedia.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData.dark(),
        home: SocialMedia()
        // const BMI(title: 'BMI CALCULATOR'),
        );
  }
}

class BMI extends StatefulWidget {
  const BMI({super.key, required this.title});
  final String title;
  @override
  State<BMI> createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  double height = 0;
  int weight = 10;
  int age = 0;
  double bmi = 0;
  bool female = false;
  bool male = false;

  double bmicalculate(double height1, int weight1) {
    height1 = height1 / 100;

    return bmi = weight1 / (height1 * height1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      if (male == false) {
                        female = !female;
                      }
                      if (male == true) {
                        female = true;
                        male = false;
                      }
                    });
                  },
                  child: Stack(children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                      height: 170,
                      width: 150,
                      child: const Center(
                        child: Icon(
                          color: Colors.black,
                          Icons.female,
                          size: 150,
                        ),
                      ),
                    ),
                    Container(
                      height: 170,
                      width: 150,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 37, 32, 32)
                            .withOpacity(female ? 0.45 : 0.0),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                    )
                  ]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      if (female == false) {
                        male = !male;
                      }
                      if (female == true) {
                        male = true;
                        female = false;
                      }
                    });
                  },
                  child: Stack(children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                      height: 170,
                      width: 150,
                      child: const Center(
                        child: Icon(
                          color: Colors.black,
                          Icons.male_outlined,
                          size: 120,
                        ),
                      ),
                    ),
                    Container(
                      height: 170,
                      width: 150,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 37, 32, 32)
                            .withOpacity(male ? 0.45 : 0.0),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                    )
                  ]),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
              ),
              width: 300,
              height: 180,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "HEIGHT",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${height.toInt()}cm",
                    style: const TextStyle(fontSize: 20),
                  ),
                  Slider(
                    value: height, // Bind value to the height variable
                    onChanged: (value) {
                      setState(() {
                        height = value;
                      });
                    },
                    activeColor: const Color.fromARGB(255, 175, 54, 54),
                    inactiveColor: const Color.fromARGB(255, 59, 56, 56),
                    divisions: 200,
                    label: "${height.toInt()} ", // Show current height as label
                    max: 200,
                    min: 0,
                  )
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                  height: 160,
                  width: 150,
                  child: Column(
                    children: [
                      const Text(
                        "Weight",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${weight}",
                        style: const TextStyle(fontSize: 28),
                      ),
                      Row(
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  if (weight > 10) weight = weight - 1;
                                });
                              },
                              child: const Icon(Icons.remove)),
                          ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  weight = weight + 1;
                                });
                              },
                              child: const Icon(Icons.add))
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                  height: 160,
                  width: 150,
                  child: Column(
                    children: [
                      const Text(
                        "AGE",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${age}",
                        style: const TextStyle(fontSize: 28),
                      ),
                      Row(
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  if (age > 0) age = age - 1;
                                });
                              },
                              child: const Icon(Icons.remove)),
                          ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  age = age + 1;
                                });
                              },
                              child: const Icon(Icons.add))
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      )),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: Colors.amber,
        onPressed: () {
          final calbmi = bmicalculate(height, weight);
          if (height > 80 && weight >= 10) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => ResultScreen(
                          age: age,
                          bmi: calbmi,
                        )));
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  "Height must be greater than 80",
                  style: TextStyle(color: Colors.red),
                ),
              ),
            );
          }
          setState(() {
            weight = 10;
            height = 0;
            age = 0;
            female = false;
            male = false;
          });
        },
        child: const Center(
          child: Text(
            "Submit",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      ),

      //  InkWell(
      //   onTap: () {
      //     final calbmi = bmicalculate(height, weight);

      //     Navigator.push(
      //         context,
      //         MaterialPageRoute(
      //             builder: (_) => ResultScreen(
      //                   age: age,
      //                   bmi: calbmi,
      //                 )));
      //     // setState(() {
      //     //   weight = 0;
      //     //   height = 0;
      //     //   age = 0;
      //     // });
      //   },
      //   child: Container(
      //       width: 140,
      //       height: 40,
      //       decoration: BoxDecoration(
      //           color: Colors.amberAccent,
      //           borderRadius: BorderRadius.circular(17)),
      //       child: const Center(
      //         child: Text(
      //           "Submit",
      //           style: TextStyle(color: Colors.white),
      //         ),
      //       )),
      //)
    );
  }
}

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    Key? key,
    required this.age,
    required this.bmi,
  }) : super(key: key);

  final int age;
  final double bmi;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Result",
                style: TextStyle(fontSize: 60, color: Colors.white),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    color: Colors.teal,
                    child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(18)),
                          border: Border.all(
                            color: Colors.teal,
                          ),
                        ),
                        height: 270,
                        width: 350,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            if (age < 18)
                              if (bmi < 18.5)
                                const Text(
                                  "Underweight",
                                  style: TextStyle(
                                      fontSize: 30,
                                      color: Color.fromARGB(255, 1, 7, 56)),
                                )
                              else if (bmi >= 18.5 && bmi < 25)
                                const Text(
                                  "Normal",
                                  style: TextStyle(
                                      fontSize: 30,
                                      color: Color.fromARGB(255, 1, 7, 56)),
                                )
                              else if (bmi >= 25 && bmi < 30)
                                const Text(
                                  "Overweight",
                                  style: TextStyle(
                                      fontSize: 30,
                                      color: Color.fromARGB(255, 1, 7, 56)),
                                )
                              else if (bmi >= 30)
                                const Text(
                                  "Obese",
                                  style: TextStyle(
                                      fontSize: 30,
                                      color: Color.fromARGB(255, 1, 7, 56)),
                                )
                              else if (age >= 18)
                                if (bmi < 18.5)
                                  const Text(
                                    "Underweight",
                                    style: TextStyle(
                                        fontSize: 30,
                                        color: Color.fromARGB(255, 1, 7, 56)),
                                  )
                                else if (bmi >= 18.5 && bmi < 25)
                                  const Text(
                                    "Normal weight",
                                    style: TextStyle(
                                        fontSize: 30,
                                        color: Color.fromARGB(255, 1, 7, 56)),
                                  )
                                else if (bmi >= 25 && bmi < 30)
                                  const Text(
                                    "Overweight",
                                    style: TextStyle(
                                        fontSize: 30,
                                        color: Color.fromARGB(255, 1, 7, 56)),
                                  )
                                else
                                  const Text(
                                    "Obese",
                                    style: TextStyle(
                                        fontSize: 30,
                                        color: Color.fromARGB(255, 0, 29, 247)),
                                  ),
                            Text(
                              "BMI: ${bmi.round()}",
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Color.fromARGB(255, 12, 13, 13)),
                            ),
                          ],
                        )),
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
              width: 140,
              height: 40,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 192, 24, 24),
                  borderRadius: BorderRadius.circular(17)),
              child: const Center(
                child: Text(
                  "Re-Check",
                  style: TextStyle(color: Colors.white),
                ),
              )),
        ));
  }
}
