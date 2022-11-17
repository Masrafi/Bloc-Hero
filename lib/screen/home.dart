import 'package:bdtender_bloc/model/todayCount_model.dart';
import 'package:bdtender_bloc/repository/corrigen_repo.dart';
import 'package:bdtender_bloc/repository/live_repo.dart';
import 'package:bdtender_bloc/repository/private_repo.dart';
import 'package:bdtender_bloc/utils/color.dart';
import 'package:bdtender_bloc/utils/heder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/corrigenCount_bloc/corrigenCount_bloc.dart';
import '../bloc/corrigenCount_bloc/corrigenCount_event.dart';
import '../bloc/corrigenCount_bloc/corrigenCount_state.dart';
import '../bloc/liveCount_bloc/liveCount_bloc.dart';
import '../bloc/liveCount_bloc/liveCount_event.dart';
import '../bloc/liveCount_bloc/liveCount_state.dart';
import '../bloc/privateCount_bloc /privateCount_bloc.dart';
import '../bloc/privateCount_bloc /privateCount_event.dart';
import '../bloc/privateCount_bloc /privateCount_state.dart';
import '../bloc/todayCount_bloc/todayCount_bloc.dart';
import '../bloc/todayCount_bloc/todayCount_event.dart';
import '../bloc/todayCount_bloc/todayCount_state.dart';
import '../repository/today_repo.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var _search = TextEditingController();
  final GlobalKey<ScaffoldState> _globalKey = new GlobalKey<ScaffoldState>();
  var color = ColorFactory();
  // FlutterToast flutterToast;
  // SharedPreferences logindata;
  // String username;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TodayCountBloc(
            RepositoryProvider.of<RepositoryToday>(context),
          )..add(TodayCountLoadEvent()),
        ),
        BlocProvider(
          create: (context) => LiveCountBloc(
            RepositoryProvider.of<RepositoryLive>(context),
          )..add(LiveCountLoadEvent()),
        ),
        BlocProvider(
          create: (context) => PrivateCountBloc(
            RepositoryProvider.of<RepositoryPrivate>(context),
          )..add(PrivateCountLoadEvent()),
        ),
        BlocProvider(
          create: (context) => CorrigenCountBloc(
            RepositoryProvider.of<RepositoryCorrigen>(context),
          )..add(CorrigenCountLoadEvent()),
        ),
      ],
      child: Scaffold(
        appBar: header(context, titleText: 'BDTender'),
        body: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            ClipPath(
              clipper: ClippingClass(),
              child: Container(
                color: color.theme,

                height: 250,
                //color: Color(0xFF2F64A3),
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Find all your desired tenders',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              controller: _search,
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'OpenSans',
                              ),
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return 'Text field is empty';
                                } else {}
                              },
                              decoration: InputDecoration(
                                errorStyle: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 10.0),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderSide: new BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                                hintText: 'Search by Keywords: ex. BDTender',
                                labelText: 'Search Your Tender...',
                                //hintStyle: kHintTextStyle,
                              ),
                              //onEditingComplete: masrafi,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 20,
                                right: 20,
                              ),
                              child: Container(
                                height: 40,
                                child: RaisedButton(
                                  elevation: 5.0,
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      //masrafi();
                                    }
                                  },
                                  padding: EdgeInsets.all(10),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  color: Colors.white,
                                  child: Text(
                                    'Search',
                                    style: TextStyle(
                                      color: color.blackB,
                                      letterSpacing: 1.5,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'OpenSans',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            // Center(
            //   child: Text(
            //     'Daily tender status: ',
            //     style: TextStyle(
            //       fontSize: displayWidth(context) * 0.05,
            //
            //       fontWeight: FontWeight.bold,
            //       //fontStyle: FontStyle.italic
            //     ),
            //   ),
            // ),
            Center(
              child: Text(
                "Browse by...",
                style: TextStyle(
                  fontSize: 15,

                  fontWeight: FontWeight.bold,
                  //fontStyle: FontStyle.italic
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => FourOption(
                    //             'https://www.bdtender.com/tender/category')));
                  },
                  child: Container(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.height / 100,
                      right: MediaQuery.of(context).size.height / 100,
                      top: MediaQuery.of(context).size.height / 70,
                      bottom: MediaQuery.of(context).size.height / 70,
                    ),
                    decoration: BoxDecoration(
                      color: color.theme,
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    child: Text(
                      "Categories",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => FourOption(
                    //             'https://www.bdtender.com/tender/organization')));
                  },
                  child: Container(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.height / 100,
                      right: MediaQuery.of(context).size.height / 100,
                      top: MediaQuery.of(context).size.height / 70,
                      bottom: MediaQuery.of(context).size.height / 70,
                    ),
                    decoration: BoxDecoration(
                      color: color.theme,
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    child: Text(
                      "Departments",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => FourOption(
                    //             'https://www.bdtender.com/tender/districts')));
                  },
                  child: Container(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.height / 100,
                      right: MediaQuery.of(context).size.height / 100,
                      top: MediaQuery.of(context).size.height / 70,
                      bottom: MediaQuery.of(context).size.height / 70,
                    ),
                    decoration: BoxDecoration(
                      color: color.theme,
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    child: Text(
                      "Districts",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => FourOption(
                    //             'https://www.bdtender.com/tender-today')));
                  },
                  child: Container(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.height / 100,
                      right: MediaQuery.of(context).size.height / 100,
                      top: MediaQuery.of(context).size.height / 70,
                      bottom: MediaQuery.of(context).size.height / 70,
                    ),
                    decoration: BoxDecoration(
                      color: color.theme,
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    child: Text(
                      "Deadline",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                'Daily tender status: ',
                style: TextStyle(
                  fontSize: 16,

                  fontWeight: FontWeight.bold,
                  //fontStyle: FontStyle.italic
                ),
              ),
            ),

            SizedBox(
              height: 10,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BlocBuilder<TodayCountBloc, TodayCountState>(
                    builder: (context, state) {
                  if (state is TodayCountLoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is TodayCountErrorState) {
                    return Center(
                      child: Text("Error"),
                    );
                  }
                  if (state is TodayCountLoadedState) {
                    List<TodayCountModel> userList = state.users;
                    return SizedBox(
                      height: 40,
                      width: 100,
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: userList.length,
                          itemBuilder: (_, index) {
                            return InkWell(
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.notifications,
                                    size: 20,
                                    color: color.theme,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "Today’s",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        userList[index].message,
                                        style: TextStyle(fontSize: 14),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              onTap: () {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) =>
                                //             TodayPublishTender()));
                              },
                            );
                          }),
                    );
                  }
                  return Container();
                }),
                BlocBuilder<CorrigenCountBloc, CorrigenCountState>(
                    builder: (context, state) {
                  if (state is CorrigenCountLoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is CorrigenCountErrorState) {
                    return Center(
                      child: Text("Error"),
                    );
                  }
                  if (state is CorrigenCountLoadedState) {
                    List<TodayCountModel> userList = state.users;
                    return SizedBox(
                      height: 40,
                      width: 120,
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: userList.length,
                          itemBuilder: (_, index) {
                            return InkWell(
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.notifications,
                                    size: 20,
                                    color: color.theme,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "Corrigendum",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        userList[index].message,
                                        style: TextStyle(fontSize: 14),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              onTap: () {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) =>
                                //             TodayPublishTender()));
                              },
                            );
                          }),
                    );
                  }
                  return Container();
                }),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BlocBuilder<PrivateCountBloc, PrivateCountState>(
                    builder: (context, state) {
                  if (state is PrivateCountLoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is PrivateCountErrorState) {
                    return Center(
                      child: Text("Error"),
                    );
                  }
                  if (state is PrivateCountLoadedState) {
                    List<TodayCountModel> userList = state.users;
                    return SizedBox(
                      height: 40,
                      width: 100,
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: userList.length,
                          itemBuilder: (_, index) {
                            return InkWell(
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.notifications,
                                    size: 20,
                                    color: color.theme,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "Private",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        userList[index].message,
                                        style: TextStyle(fontSize: 14),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              onTap: () {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) =>
                                //             TodayPublishTender()));
                              },
                            );
                          }),
                    );
                  }
                  return Container();
                }),
                BlocBuilder<LiveCountBloc, LiveCountState>(
                    builder: (context, state) {
                  if (state is LiveCountLoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is LiveCountErrorState) {
                    return Center(
                      child: Text("Error"),
                    );
                  }
                  if (state is LiveCountLoadedState) {
                    List<TodayCountModel> userList = state.users;
                    return SizedBox(
                      height: 40,
                      width: 120,
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: userList.length,
                          itemBuilder: (_, index) {
                            return InkWell(
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.notifications,
                                    size: 20,
                                    color: color.theme,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        "Live Tender",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        userList[index].message,
                                        style: TextStyle(fontSize: 14),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              onTap: () {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) =>
                                //             TodayPublishTender()));
                              },
                            );
                          }),
                    );
                  }
                  return Container();
                }),
              ],
            ),
            GestureDetector(
              onTap: () {
                // Navigator.push(
                //     context, MaterialPageRoute(builder: (context) => Pay()));
              },
              child: Container(
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 30,
                  left: MediaQuery.of(context).size.height / 30,
                  right: MediaQuery.of(context).size.height / 30,
                ),
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 60,
                  bottom: MediaQuery.of(context).size.height / 60,
                  left: MediaQuery.of(context).size.height / 50,
                  right: MediaQuery.of(context).size.height / 50,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.03),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(0, 0), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.add_circle,
                      color: color.theme,
                      size: MediaQuery.of(context).size.height / 35,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.height / 50,
                    ),
                    Text(
                      "Pay Now",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height / 55,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Container(),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: color.theme,
                      size: MediaQuery.of(context).size.height / 35,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 10,
            ),
          ],
        ),
      ),
    );
  }
}

class ClippingClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        size.width / 2, size.height - 100, size.width, size.height);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
