class InstallmentDetail {
  int? dueDate;
  int? termAmount;

  InstallmentDetail({
    this.dueDate,
    this.termAmount,
  });

  factory InstallmentDetail.fromMap(Map<String, dynamic> json) => InstallmentDetail(
        dueDate: json["due_date"],
        termAmount: json["term_amount"],
      );

  Map<String, dynamic> toMap() => {
        "due_date": dueDate,
        "term_amount": termAmount,
      };
}

class GtdLoanKredivoMonth {
  String? interestRate;
  int? interestAmount;
  int? monthlyInstallment;
  int? processingFee;
  String? processingFeeRate;
  List<InstallmentDetail>? installmentDetail;
  int? initialAmount;
  int? totalAmount;
  int? paybackAmount;
  int? key;

  GtdLoanKredivoMonth({
    this.interestRate,
    this.interestAmount,
    this.monthlyInstallment,
    this.processingFee,
    this.processingFeeRate,
    this.installmentDetail,
    this.initialAmount,
    this.totalAmount,
    this.paybackAmount,
    this.key,
  });

  factory GtdLoanKredivoMonth.fromMap(Map<String, dynamic> json) => GtdLoanKredivoMonth(
        interestRate: json["interest_rate"],
        interestAmount: json["interest_amount"],
        monthlyInstallment: json["monthly_installment"],
        processingFee: json["processing_fee"],
        processingFeeRate: json["processing_fee_rate"],
        installmentDetail: json["installment_detail"] == null
            ? []
            : List<InstallmentDetail>.from(json["installment_detail"]!.map((x) => InstallmentDetail.fromMap(x))),
        initialAmount: json["initial_amount"],
        totalAmount: json["total_amount"],
        paybackAmount: json["payback_amount"],
      );

  Map<String, dynamic> toMap() => {
        "interest_rate": interestRate,
        "interest_amount": interestAmount,
        "monthly_installment": monthlyInstallment,
        "processing_fee": processingFee,
        "processing_fee_rate": processingFeeRate,
        "installment_detail":
            installmentDetail == null ? [] : List<dynamic>.from(installmentDetail!.map((x) => x.toMap())),
        "initial_amount": initialAmount,
        "total_amount": totalAmount,
        "payback_amount": paybackAmount,
      };
}

class GtdKredivoLoanDetail {
  int? status;
  String? message;
  List<GtdLoanKredivoMonth> innerArray = [];

  GtdKredivoLoanDetail({
    this.innerArray = const [],
    this.status,
    this.message,
  });

  factory GtdKredivoLoanDetail.fromJson(Map<String, dynamic> json) {
    var combineLoanMonths = json.entries
        .map((e) {
          int? indexMonth = int.tryParse(e.key);
          if (indexMonth != null) {
            var loanKredivoMonth = json[e.key] == null ? null : GtdLoanKredivoMonth.fromMap(json[e.key]);
            loanKredivoMonth?.key = indexMonth;
            return loanKredivoMonth;
          }
          return null;
        })
        .whereType<GtdLoanKredivoMonth>()
        .toList();
    return GtdKredivoLoanDetail(
      innerArray: combineLoanMonths,
      status: json["status"],
      message: json["message"],
    );
  }
}

var jsonKredivo = {
  "1": {
    "interest_rate": "0%",
    "interest_amount": 0,
    "monthly_installment": 3698620,
    "processing_fee": 36620,
    "processing_fee_rate": "1.0%",
    "installment_detail": [
      {"due_date": 1694171449, "term_amount": 3698620}
    ],
    "initial_amount": 3662000,
    "total_amount": 3662000,
    "payback_amount": 3698620
  },
  "3": {
    "interest_rate": "0%",
    "interest_amount": 0,
    "monthly_installment": 1293907,
    "processing_fee": 219720,
    "processing_fee_rate": "6.0%",
    "installment_detail": [
      {"due_date": 1694171449, "term_amount": 1293907},
      {"due_date": 1696849849, "term_amount": 1293907},
      {"due_date": 1699441849, "term_amount": 1293906}
    ],
    "initial_amount": 3662000,
    "total_amount": 3662000,
    "payback_amount": 3881720
  },
  "6": {
    "interest_rate": "3,45%",
    "interest_amount": 465586,
    "monthly_installment": 687931,
    "processing_fee": 0,
    "processing_fee_rate": "0.0%",
    "installment_detail": [
      {"due_date": 1694171449, "term_amount": 687931},
      {"due_date": 1696849849, "term_amount": 687931},
      {"due_date": 1699441849, "term_amount": 687931},
      {"due_date": 1702033849, "term_amount": 687931},
      {"due_date": 1704712249, "term_amount": 687931},
      {"due_date": 1707390649, "term_amount": 687931}
    ],
    "initial_amount": 3662000,
    "total_amount": 4127586,
    "payback_amount": 4127586
  },
  "12": {
    "interest_rate": "3,45%",
    "interest_amount": 890198,
    "monthly_installment": 379350,
    "processing_fee": 0,
    "processing_fee_rate": "0.0%",
    "installment_detail": [
      {"due_date": 1694171449, "term_amount": 379350},
      {"due_date": 1696849849, "term_amount": 379350},
      {"due_date": 1699441849, "term_amount": 379350},
      {"due_date": 1702033849, "term_amount": 379350},
      {"due_date": 1704712249, "term_amount": 379350},
      {"due_date": 1707390649, "term_amount": 379350},
      {"due_date": 1709896249, "term_amount": 379350},
      {"due_date": 1712574649, "term_amount": 379350},
      {"due_date": 1715166649, "term_amount": 379350},
      {"due_date": 1718017849, "term_amount": 379350},
      {"due_date": 1720437049, "term_amount": 379350},
      {"due_date": 1723115449, "term_amount": 379348}
    ],
    "initial_amount": 3662000,
    "total_amount": 4552198,
    "payback_amount": 4552198
  },
  "status": 1,
  "message": "Success"
};
 