import 'package:bdtender_bloc/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/corrigenCount_bloc/corrigenCount_bloc.dart';
import '../bloc/corrigenCount_bloc/corrigenCount_state.dart';
import '../model/todayCount_model.dart';

class Corrigen extends StatelessWidget {
  var color = ColorFactory();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CorrigenCountBloc, CorrigenCountState>(
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
        List<TodayCountModel> dataList = state.users;
        return SizedBox(
          height: 40,
          width: 120,
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
                            "Corrigendum",
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
                    Navigator.pushNamed(context, '/corrigenDetails');
                  },
                );
              }),
        );
      }
      return Container();
    });
  }
}
