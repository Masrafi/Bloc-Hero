import 'package:bdtender_bloc/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/privateCount_bloc/privateCount_bloc.dart';
import '../bloc/privateCount_bloc/privateCount_state.dart';
import '../model/todayCount_model.dart';

class Private extends StatelessWidget {
  var color = ColorFactory();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PrivateCountBloc, PrivateCountState>(
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
        List<TodayCountModel> dataList = state.users;
        return SizedBox(
          height: 40,
          width: 100,
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: dataList.length,
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
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            dataList[index].message,
                            style: TextStyle(fontSize: 14),
                          )
                        ],
                      )
                    ],
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/privateDetails');
                  },
                );
              }),
        );
      }
      return Container();
    });
  }
}
