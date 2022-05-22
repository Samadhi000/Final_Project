import 'package:flutter/material.dart';
import 'package:kidoli/Constant/Constant_var.dart';

class StudentProfile extends StatefulWidget {
  const StudentProfile({Key? key}) : super(key: key);

  @override
  State<StudentProfile> createState() => _StudentProfileState();
}

class _StudentProfileState extends State<StudentProfile> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: size.height * 0.5,
              width: size.width * 1,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fitWidth,
                      alignment: Alignment.topCenter,
                      image: AssetImage('assets/download.jpg'))),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                  child: Container(
                    height: 70,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          minRadius: 35,
                          maxRadius: 40,
                          backgroundImage: NetworkImage(
                              'https://i.pinimg.com/originals/88/aa/b9/88aab93b1948c13d6acb878ced5e182e.jpg'),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Emma Watson',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Text(
                              '1545',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 100),
                    child: GridView.count(
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        primary: false,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 10, left: 10, bottom: 10),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              elevation: 8,
                              color: purple,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, right: 10, left: 10),
                                    child: Image.asset('assets/user.png',
                                        height: 100),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Text(
                                      "Edit Profile",
                                      style: TextStyle(
                                        fontSize: 17,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 10, left: 10, bottom: 10),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              elevation: 8,
                              color: purple,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, right: 10, left: 10),
                                    child: Image.asset(
                                        'assets/concentration.png',
                                        height: 100),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Text(
                                      "Concentration",
                                      style: TextStyle(
                                        fontSize: 17,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 10, left: 10, bottom: 10),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              elevation: 8,
                              color: purple,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, right: 10, left: 10),
                                    child: Image.asset('assets/gear.png',
                                        height: 100),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Text(
                                      "Settings",
                                      style: TextStyle(
                                        fontSize: 17,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 10, left: 10, bottom: 10),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              elevation: 8,
                              color: purple,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, right: 10, left: 10),
                                    child: Image.asset(
                                        'assets/clapperboard.png',
                                        height: 100),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Text(
                                      "History",
                                      style: TextStyle(
                                        fontSize: 17,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                        crossAxisCount: 2),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
