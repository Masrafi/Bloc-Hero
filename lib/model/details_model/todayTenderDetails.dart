class TodayTenderDetailsModel {
  final tendercode;
  final typecode;
  final sectorcode;
  final dcode;
  final catcode;
  final invname;
  final tnature;
  final issudate;
  final tendersource;
  final status;
  final ensStatus;
  final distcode;
  final display;
  final prebidMeetingDate;
  final procuringPlace;
  final tenderContentType;
  final createdAt;
  final workdesc;
  final banglaDescription;
  final totalamt;
  final seduleprice;
  final ernestamt;
  final workduration;
  final tpublishdate;
  final workfindate;
  final tpurchesdate;
  final tsubmissiondate;
  final tboxopendate;
  final tentype;
  final contractorability;
  final visitors;
  final id;
  final typename;
  final sectorid;
  final sectorname;
  TodayTenderDetailsModel({
    required this.tendercode,
    required this.typecode,
    required this.sectorcode,
    required this.dcode,
    required this.catcode,
    required this.invname,
    required this.tnature,
    required this.issudate,
    required this.tendersource,
    required this.status,
    required this.ensStatus,
    required this.distcode,
    required this.display,
    required this.prebidMeetingDate,
    required this.procuringPlace,
    required this.tenderContentType,
    required this.createdAt,
    required this.workdesc,
    required this.banglaDescription,
    required this.totalamt,
    required this.seduleprice,
    required this.ernestamt,
    required this.workduration,
    required this.tpublishdate,
    required this.workfindate,
    required this.tpurchesdate,
    required this.tsubmissiondate,
    required this.tboxopendate,
    required this.tentype,
    required this.contractorability,
    required this.visitors,
    required this.id,
    required this.typename,
    required this.sectorid,
    required this.sectorname,
  });

  factory TodayTenderDetailsModel.fromJson(Map<String, dynamic> json) =>
      TodayTenderDetailsModel(
        tendercode: json["tendercode"],
        typecode: json["typecode"],
        sectorcode: json["sectorcode"],
        dcode: json["dcode"],
        catcode: json["catcode"],
        invname: json["invname"],
        tnature: json["tnature"],
        issudate: json["issudate"],
        tendersource: json["tendersource"],
        status: json["status"],
        ensStatus: json["ens_status"],
        distcode: json["distcode"],
        display: json["display"],
        prebidMeetingDate: json["PrebidMeetingDate"],
        procuringPlace: json["ProcuringPlace"],
        tenderContentType: json["TenderContentType"],
        createdAt: DateTime.parse(json["created_at"]),
        workdesc: json["workdesc"],
        banglaDescription: json["bangla_description"],
        totalamt: json["totalamt"],
        seduleprice: json["seduleprice"],
        ernestamt: json["ernestamt"],
        workduration: json["workduration"],
        tpublishdate: json["tpublishdate"],
        workfindate: json["workfindate"],
        tpurchesdate: json["tpurchesdate"],
        tsubmissiondate: json["tsubmissiondate"],
        tboxopendate: json["tboxopendate"],
        tentype: json["tentype"],
        contractorability: json["contractorability"],
        visitors: json["visitors"],
        id: json["id"],
        typename: json["typename"],
        sectorid: json["sectorid"],
        sectorname: json["sectorname"],
      );

  Map<String, dynamic> toJson() => {
        "tendercode": tendercode,
        "typecode": typecode,
        "sectorcode": sectorcode,
        "dcode": dcode,
        "catcode": catcode,
        "invname": invname,
        "tnature": tnature,
        "issudate": issudate,
        "tendersource": tendersource,
        "status": status,
        "ens_status": ensStatus,
        "distcode": distcode,
        "display": display,
        "PrebidMeetingDate": prebidMeetingDate,
        "ProcuringPlace": procuringPlace,
        "TenderContentType": tenderContentType,
        "created_at": createdAt.toIso8601String(),
        "workdesc": workdesc,
        "bangla_description": banglaDescription,
        "totalamt": totalamt,
        "seduleprice": seduleprice,
        "ernestamt": ernestamt,
        "workduration": workduration,
        "tpublishdate": tpublishdate,
        "workfindate": workfindate,
        "tpurchesdate": tpurchesdate,
        "tsubmissiondate": tsubmissiondate,
        "tboxopendate": tboxopendate,
        "tentype": tentype,
        "contractorability": contractorability,
        "visitors": visitors,
        "id": id,
        "typename": typename,
        "sectorid": sectorid,
        "sectorname": sectorname,
      };
}

extension HistoryBookingExtension on TodayTenderDetailsModel {
  String get chenage  {
    return "${visitors} masrafi";
  }
  }