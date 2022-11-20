abstract class SaveTenderEvent {}

class SaveTenderSubmittedEvent extends SaveTenderEvent {
  final String email;
  final String tenderCode;
  SaveTenderSubmittedEvent({required this.email, required this.tenderCode});
}
