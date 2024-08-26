import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qrcode_reader_web/qrcode_reader_web.dart';
import 'package:ssoattendance/components/BottomNavbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeView();
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        forceMaterialTransparency: true,
        title: Center(
          child: Text(
            'Created Events',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              color: Color.fromRGBO(228, 142, 60, 1),
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(right: 10),
                width: MediaQuery.of(context).size.width * 0.6,
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(15),
                    prefixIcon: Icon(Icons.search),
                    prefixIconColor: Colors.black,
                    fillColor: Color.fromRGBO(239, 239, 239, 1),
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              TextButton.icon(
                style: TextButton.styleFrom(
                    iconColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    backgroundColor: Color.fromRGBO(228, 142, 60, 1),
                    fixedSize: Size(100, 40)),
                onPressed: () {},
                label: Text(
                  'Search',
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                      fontSize: 16),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.go('/scanner/1');
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.85,
                          height: 200,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color.fromRGBO(239, 239, 239, 1),
                              width: 3,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(25),
                            ),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 100,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(),
                                    Container(),
                                    Container(
                                      width: 14,
                                      color: Colors.blue,
                                    ),
                                    Container(
                                      width: 14,
                                      color: Colors.blue,
                                    ),
                                    Container(
                                      width: 14,
                                      color: Colors.blue,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Sample Event',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w800,
                                              fontSize: 20),
                                        ),
                                        Text(
                                          'API Development',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w800,
                                              fontSize: 14),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('9:00 AM to 10:30 AM'),
                                        Text('MAY 24, 2024'),
                                      ],
                                    ),
                                    Container(
                                      width: 100,
                                      height: 30,
                                      decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                      child: Center(
                                          child: Text(
                                        'Completed',
                                        style: TextStyle(color: Colors.white),
                                      )),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Bottomnavbar(
        index: 0,
      ),
    );
  }
}
