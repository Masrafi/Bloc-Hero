import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import '../../utils/config.dart';
import 'saveTenderDelete_event.dart';
import 'saveTenderDelete_state.dart';

class SaveTenderDeleteBloc
    extends Bloc<SaveTenderDeleteEvent, SaveTenderDeleteState> {
  SaveTenderDeleteBloc() : super(SaveTenderDeleteInitialState()) {
    on<SaveTenderDeleteSubmittedEvent>(
      (event, emit) async {
        var endPoint = Config.DELETE_SAVE_TENDER;
        Response response = await post(Uri.parse(endPoint),
            body: {"Email": event.email, "tendercode": event.tenderCode});
        if (response.statusCode == 200) {
          emit(SaveTenderDeleteSuccessState());
        } else {
          emit(SaveTenderDeleteFailState());
        }
      },
    );
  }
}
