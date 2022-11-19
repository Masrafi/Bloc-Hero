import 'package:bdtender_bloc/bloc/saveTender_bloc/saveTender_bloc.dart';
import 'package:bdtender_bloc/bloc/saveTender_bloc/saveTender_state.dart';
import 'package:bdtender_bloc/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/privateCount_bloc/privateCount_bloc.dart';
import '../bloc/privateCount_bloc/privateCount_state.dart';
import '../model/todayCount_model.dart';

class SaveTenderSuccess extends StatelessWidget {
  var color = ColorFactory();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SaveTenderBloc, SaveTenderState>(
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
    }, builder: (context, state) {
      return Container();
    });
  }
}
