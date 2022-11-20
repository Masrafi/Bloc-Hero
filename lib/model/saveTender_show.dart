class SaveTenderShow {
  final id;
  final tendercode;
  final subscriberId;
  final status;
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
  final display;
  final visitors;
  final typecode;
  final sectorcode;
  final dcode;
  final catcode;
  final invname;
  final tnature;
  final issudate;
  final tendersource;
  final ensStatus;
  final distcode;
  final prebidMeetingDate;
  final procuringPlace;
  final tenderContentType;
  final createdAt;
  final typename;
  final categoryCode;
  SaveTenderShow({
    this.id,
    this.tendercode,
    this.subscriberId,
    this.status,
    this.workdesc,
    this.banglaDescription,
    this.totalamt,
    this.seduleprice,
    this.ernestamt,
    this.workduration,
    this.tpublishdate,
    this.workfindate,
    this.tpurchesdate,
    this.tsubmissiondate,
    this.tboxopendate,
    this.tentype,
    this.contractorability,
    this.display,
    this.visitors,
    this.typecode,
    this.sectorcode,
    this.dcode,
    this.catcode,
    this.invname,
    this.tnature,
    this.issudate,
    this.tendersource,
    this.ensStatus,
    this.distcode,
    this.prebidMeetingDate,
    this.procuringPlace,
    this.tenderContentType,
    this.createdAt,
    this.typename,
    this.categoryCode,
  });
  factory SaveTenderShow.fromJson(Map<String, dynamic> json) => SaveTenderShow(
        id: json["id"],
        tendercode: json["tendercode"],
        subscriberId: json["Subscriber_ID"],
        status: json["status"],
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
        display: json["display"],
        visitors: json["visitors"],
        typecode: json["typecode"],
        sectorcode: json["sectorcode"],
        dcode: json["dcode"],
        catcode: json["catcode"],
        invname: json["invname"],
        tnature: json["tnature"],
        issudate: json["issudate"],
        tendersource: json["tendersource"],
        ensStatus: json["ens_status"],
        distcode: json["distcode"],
        prebidMeetingDate: json["PrebidMeetingDate"],
        procuringPlace: json["ProcuringPlace"],
        tenderContentType: json["TenderContentType"],
        createdAt: DateTime.parse(json["created_at"]),
        typename: json["typename"],
        categoryCode: json["CategoryCode"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tendercode": tendercode,
        "Subscriber_ID": subscriberId,
        "status": status,
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
        "display": display,
        "visitors": visitors,
        "typecode": typecode,
        "sectorcode": sectorcode,
        "dcode": dcode,
        "catcode": catcode,
        "invname": invname,
        "tnature": tnature,
        "issudate": issudate,
        "tendersource": tendersource,
        "ens_status": ensStatus,
        "distcode": distcode,
        "PrebidMeetingDate": prebidMeetingDate,
        "ProcuringPlace": procuringPlace,
        "TenderContentType": tenderContentType,
        "created_at": createdAt.toIso8601String(),
        "typename": typename,
        "CategoryCode": categoryCode,
      };
}
