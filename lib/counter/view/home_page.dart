import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ssoattendance/components/BottomNavbar.dart';
import 'package:ssoattendance/counter/auth/auth_bloc.dart';
import 'package:ssoattendance/models/event.dart';
import 'package:ssoattendance/repository/repository_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [BlocProvider(create: (context) => AuthBloc())],
        child: MultiBlocProvider(
            providers: [BlocProvider(create: (context) => RepositoryBloc())],
            child: HomeView()));
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
    final email = user!.email as String;
    BlocProvider.of<RepositoryBloc>(context).add(GetLoggedInUser(email));
    super.initState();
  }

  Color getColor(String eventType) {
    switch (eventType) {
      case "Badge":
        return Color.fromRGBO(238, 191, 168, 1);
      case "Training":
        return Color.fromRGBO(148, 184, 226, 1);
      case "Presentation":
        return Color.fromRGBO(167, 219, 207, 1);
      case "QPS Academy":
        return Color.fromRGBO(249, 222, 176, 1);
      case "Certification":
        return Color.fromRGBO(227, 171, 171, 1);
      case "Simulation":
        return Color.fromRGBO(149, 165, 241, 1);
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            BlocProvider.of<AuthBloc>(context).add(SignOutUser());
          },
          icon: Icon(Icons.logout),
          color: Color.fromRGBO(228, 142, 60, 1),
        ),
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
          BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is SignOutSuccessful) {
                context.go('/');
              }
            },
            child: Container(),
          ),
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
                onPressed: () {
                  BlocProvider.of<RepositoryBloc>(context).add(GetUsers());
                },
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
          BlocListener<RepositoryBloc, RepositoryState>(
            listener: (context, state) {
              String email;
              int iD;
              if (state is GetLoggedInUserState) {
                email = state.email;
                iD = state.Id;
                BlocProvider.of<RepositoryBloc>(context).add(GetUserEvents(iD));
              }
            },
            child: BlocBuilder<RepositoryBloc, RepositoryState>(
              builder: (context, state) {
                if (state is GetUserEventsState) {
                  final userEvents = state.events;
                  return Expanded(
                    child: ListView.builder(
                      itemCount: userEvents.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  context.go('/scanner/1');
                                },
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.85,
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
                                              color: getColor(
                                                  userEvents[index].eventType),
                                            ),
                                            Container(
                                              width: 14,
                                              color: getColor(
                                                  userEvents[index].eventType),
                                            ),
                                            Container(
                                              width: 14,
                                              color: getColor(
                                                  userEvents[index].eventType),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '${userEvents[index].eventTitle}',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      fontSize: 20),
                                                ),
                                                Text(
                                                  '${userEvents[index].subUnit}',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w800,
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
                                                      BorderRadius.circular(
                                                          25)),
                                              child: Center(
                                                  child: Text(
                                                'Completed',
                                                style: TextStyle(
                                                    color: Colors.white),
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
                        );
                      },
                    ),
                  );
                } else if (state is RepositoryFailedState) {
                  return Center(
                    child: Text('Failed to load Events: ${state.message}'),
                  );
                } else {
                  return Center(
                    child: Text('Loading...'),
                  );
                }
              },
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
