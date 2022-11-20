import 'package:bdtender_bloc/repository/details_repo/todayTenderDetails_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/details_bloc/private_details/privateTenderDetails_bloc.dart';
import '../../bloc/details_bloc/private_details/privateTenderDetails_event.dart';
import '../../bloc/details_bloc/private_details/privateTenderDetails_state.dart';
import '../../bloc/details_bloc/today_details/todayTenderDetails_bloc.dart';
import '../../bloc/details_bloc/today_details/todayTenderDetails_event.dart';
import '../../bloc/details_bloc/today_details/todayTenderDetails_state.dart';
import '../../bloc/saveTender_bloc/saveTender_bloc.dart';
import '../../bloc/saveTender_bloc/saveTender_event.dart';
import '../../bloc/saveTender_bloc/saveTender_state.dart';
import '../../model/details_model/privateTenderDetails.dart';
import '../../model/details_model/todayTenderDetails.dart';
import '../../repository/details_repo/privateTenderDetails_repo.dart';
import '../../utils/heder.dart';

class PrivateTenderDetailsScreen extends StatelessWidget {
  const PrivateTenderDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PrivateTenderDetailsBloc(
            RepositoryProvider.of<RepositoryPrivateTenderDetails>(context),
          )..add(PrivateTenderDetailsLoadEvent()),
        ),
        BlocProvider(
          create: (context) => SaveTenderBloc(),
        ),
      ],
      child: Scaffold(
          appBar: header(context, titleText: "Private"),
          body: BlocListener<SaveTenderBloc, SaveTenderState>(
            listener: (context, state) {
              if (state is SaveTenderFailState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Tender save fail'),
                  ),
                );
              }
              if (state is SaveTenderSuccessState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Tender save Successfully'),
                  ),
                );
              }
            },
            child: BlocBuilder<PrivateTenderDetailsBloc,
                PrivateTenderDetailsState>(builder: (context, state) {
              if (state is PrivateTenderDetailsLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is PrivateTenderDetailsErrorState) {
                return Center(
                  child: Text("Error"),
                );
              }
              if (state is PrivateTenderDetailsLoadedState) {
                List<PrivateTenderDetailsModel> dataList = state.users;
                return ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: dataList.length,
                    itemBuilder: (_, index) {
                      return Container(
                        padding: EdgeInsets.all(15),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          elevation: 5,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              //mainAxisAlignment: MainAxisAlignment.,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  dataList[index].workdesc ?? "View Image",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'OpenSans',
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "Tender ID:",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'OpenSans',
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        dataList[index].tendercode ??
                                            "View Image",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontFamily: 'OpenSans',
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "Content Type: ",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'OpenSans',
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                          dataList[index].tenderContentType ??
                                              "View Image",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontFamily: 'OpenSans',
                                          )),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "Published on:",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'OpenSans',
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        dataList[index].issudate ??
                                            "View Image",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontFamily: 'OpenSans',
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "Location: ",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'OpenSans',
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        dataList[index].distcode ??
                                            "View Image",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontFamily: 'OpenSans',
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "Source: ",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'OpenSans',
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        dataList[index].tendersource ??
                                            "View Image",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontFamily: 'OpenSans',
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "Sector:",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'OpenSans',
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        dataList[index].sectorname ??
                                            "View Image",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontFamily: 'OpenSans',
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "Ear. Money: ",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'OpenSans',
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        dataList[index].ernestamt ??
                                            "View Image",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontFamily: 'OpenSans',
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "Doc. Price: ",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'OpenSans',
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        dataList[index].seduleprice ??
                                            "View Image",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontFamily: 'OpenSans',
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "Pur. Last Date: ",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'OpenSans',
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        dataList[index].tpurchesdate ??
                                            "View Image",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontFamily: 'OpenSans',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "Pre. Met. Date: ",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'OpenSans',
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        dataList[index].prebidMeetingDate ??
                                            "View Image",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontFamily: 'OpenSans',
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "Sub. Date: ",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'OpenSans',
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        dataList[index].tsubmissiondate ??
                                            "View Image",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontFamily: 'OpenSans',
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "Opening Date:",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'OpenSans',
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        dataList[index].tboxopendate ??
                                            "View Image",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontFamily: 'OpenSans',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "Visitor: ",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'OpenSans',
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        dataList[index].visitors ??
                                            "View Image",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontFamily: 'OpenSans',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                /*SizedBox(
                                      height: 10,
                                    ),*/
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "View Image: ",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'OpenSans',
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                        child: InkWell(
                                      child: Container(
                                        height: 30,
                                        width: 20,
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(7),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.image,
                                              color: Colors.white,
                                              size: 30,
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              'View Notice',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'OpenSans',
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      onTap: () async {
                                        // Navigator.push(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //         builder: (context) =>
                                        //             WebViewExample(
                                        //                 list[index][
                                        //                 "tendercode"])));
                                      },
                                    )),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  //padding: EdgeInsets.symmetric(vertical: 25.0),
                                  // width: double.infinity,
                                  padding: EdgeInsets.only(
                                    left: 20,
                                    right: 30,
                                  ),

                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      //backgroundColor: Colors.white,
                                      elevation: 5.0,
                                    ),
                                    onPressed: () {
                                      BlocProvider.of<SaveTenderBloc>(context)
                                          .add(
                                        SaveTenderSubmittedEvent(
                                          email: 'masrafianam@gmail.com',
                                          tenderCode:
                                              dataList[index].tendercode,
                                        ),
                                      );
                                    },
                                    // padding: EdgeInsets.all(15.0),
                                    // shape: RoundedRectangleBorder(
                                    //   borderRadius:
                                    //       BorderRadius.circular(
                                    //           12.0),
                                    // ),
                                    // color: Colors.white,
                                    child: Text(
                                      'Save as Favorite',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'OpenSans',
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              }
              return Container();
            }),
          )),
    );
  }
}
