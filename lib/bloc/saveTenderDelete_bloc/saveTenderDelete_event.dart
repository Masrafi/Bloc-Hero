abstract class SaveTenderDeleteEvent {}

class SaveTenderDeleteSubmittedEvent extends SaveTenderDeleteEvent {
  final String email;
  final String tenderCode;
  SaveTenderDeleteSubmittedEvent(
      {required this.email, required this.tenderCode});
}
