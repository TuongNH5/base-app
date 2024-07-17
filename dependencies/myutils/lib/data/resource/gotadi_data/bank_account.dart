import 'package:myutils/data/cache_helper/cache_helper.dart';

import 'model/bank_holder_model.dart';
import 'model/bank_model.dart';

const bankGotadiAccount = [
  {
    "bankCode": "",
    "bankName": "Ngân hàng TMDV Quốc tế Việt Nam (VIB)- Chi nhánh Sở Giao Dịch",
    "bankShortName": "VIB",
    "bankLogo": "VIBBank.png",
    "transferNote": "",
    "accountNumber": "333 666 999 - Tài khoản VND",
    "accountName": "Công Ty Cổ Phần Công Nghệ Du Lịch Gotadi"
  },
  {
    "bankCode": "",
    "bankName": "Ngân hàng Ngoại thương Việt Nam (VCB), Chi nhánh Sở Giao Dịch",
    "bankShortName": "VCB",
    "bankLogo": "Vietcombank.png",
    "transferNote": "",
    "accountNumber": "0011001523690",
    "accountName": "Công Ty Cổ Phần Công Nghệ Du Lịch Gotadi"
  },
  {
    "bankCode": "",
    "bankName": "Ngân hàng TMCP Kỹ Thương VN (Techcombank), Chi nhánh Thắng Lợi",
    "bankShortName": "Techcombank",
    "bankLogo": "TechcomBank.png",
    "transferNote": "Ghi chú: Vui lòng không chuyển khoản sau 20h",
    "accountNumber": "19120036731016",
    "accountName": "Công Ty Cổ Phần Công Nghệ Du Lịch Gotadi"
  },
  {
    "bankCode": "",
    "bankName": "Ngân hàng TM Công thương Việt Nam (Vietinbank), Chi nhánh Sài Gòn",
    "bankShortName": "VietinBank",
    "bankLogo": "VietinBank.png",
    "transferNote": "",
    "accountNumber": "115002809486",
    "accountName": "Công Ty Cổ Phần Công Nghệ Du Lịch Gotadi"
  }
];

// const listATMBanks = [
//   {
//     "code": "ABBank",
//     "logo": "ABBank.png",
//     "name": "AB Bank - NH TMCP An Bình",
//   },
//   {
//     "code": "ACB",
//     "logo": "ACB.png",
//     "name": "ACB - Ngân hàng Á Châu",
//   },
//   {
//     "code": "AgriBank",
//     "logo": "Agribank.png",
//     "name": "AgriBank - NH Nông Nghiệp & PTNT Việt Nam",
//   },
//   {
//     "code": "BIDV",
//     "logo": "BIDV.png",
//     "name": "BIDV – Ngân hàng đầu tư và phát triển Việt Nam",
//   },
//   {
//     "code": "BacABank",
//     "logo": "BacABank.png",
//     "name": "Bac A Bank - Ngân hàng TMCP Bắc Á",
//   },
//   {
//     "code": "BaoVietBank",
//     "logo": "BaoVietBank.jpg",
//     "name": "BaoVietBank - Ngân hàng Bảo Việt",
//   },
//   {
//     "code": "DongABank",
//     "logo": "DongABank.png",
//     "name": "Dong A Bank - Ngân hàng TMCP Đông Á",
//   },
//   {
//     "code": "Eximbank",
//     "logo": "Eximbank.png",
//     "name": "Eximbank - Ngân hàng TMCP Xuất nhập khẩu Việt Nam",
//   },
//   {
//     "code": "GPBank",
//     "logo": "GPBank.png",
//     "name": "GP Bank - NH TMCP Dầu Khí Toàn Cầu",
//   },
//   {
//     "code": "HDBank",
//     "logo": "HDBank.png",
//     "name": "HDBank - Ngân hàng TMCP Phát Triển TP Hồ Chí Minh",
//   },
//   {
//     "code": "LienVietPostBank",
//     "logo": "LienVietPostBank.png",
//     "name": "LienVietPostBank - Ngân hàng Bưu điện Liên Việt",
//   },
//   {
//     "code": "MB",
//     "logo": "MB.png",
//     "name": "MB - Ngân hàng TMCP Quân Đội",
//   },
//   {
//     "code": "MaritimeBank",
//     "logo": "MSBBank.png",
//     "name": "MSB – Ngân hàng TMCP Hàng Hải Việt Nam",
//   },
//   {
//     "code": "NamABank",
//     "logo": "NamABank.png",
//     "name": "Nam A Bank - NH TMCP Nam Á",
//   },
//   {
//     "code": "NaviBank",
//     "logo": "NCBBank.png",
//     "name": "NaviBank - Ngân hàng TMCP Quốc dân",
//   },
//   {
//     "code": "OCB",
//     "logo": "OCBBank.png",
//     "name": "OCB - Ngân hàng Phương Đông",
//   },
//   {
//     "code": "OceanBank",
//     "logo": "OceanBank.png",
//     "name": "OceanBank - Ngân hàng TMCP Đại Dương",
//   },
//   {
//     "code": "PGBank",
//     "logo": "PGBank.png",
//     "name": "PG Bank - NH TMCP Xăng dầu Petrolimex",
//   },
//   {
//     "code": "SHB",
//     "logo": "SHB.png",
//     "name": "SHB - Ngân hàng TMCP Sài Gòn - Hà Nội",
//   },
//   {
//     "code": "SacomBank",
//     "logo": "Saccombank.png",
//     "name": "SacomBank - NH TMCP Sài Gòn Thương Tín",
//   },
//   {
//     "code": "SaigonBank",
//     "logo": "SaigonBank.png",
//     "name": "Saigon Bank - NH TMCP Sài Gòn Công Thương",
//   },
//   {
//     "code": "TechComBank",
//     "logo": "TechcomBank.png",
//     "name": "TechComBank – Ngân hàng TMCP Kỹ thương Việt Nam",
//   },
//   {
//     "code": "TienphongBank",
//     "logo": "TPBank.png",
//     "name": "TienphongBank - Ngân hàng Tiên phong",
//   },
//   {
//     "code": "VIB",
//     "logo": "VIBBank.png",
//     "name": "VIB - Ngân Hàng Quốc Tế",
//   },
//   {
//     "code": "VPBank",
//     "logo": "VPBank.png",
//     "name": "VP Bank - Ngân hàng Việt Nam Thịnh Vượng",
//   },
//   {
//     "code": "VietABank",
//     "logo": "VietABank.png",
//     "name": "VietABank - Ngân hàng Việt Á",
//   },
//   {
//     "code": "Vietcombank",
//     "logo": "Vietcombank.png",
//     "name": "Vietcombank - NH TMCP Ngoại thương Việt Nam",
//   },
//   {
//     "code": "VietinBank",
//     "logo": "VietinBank.png",
//     "name": "VietinBank - Ngân hàng TMCP Công thương Việt Nam",
//   }
// ];

List<BankModel> listATMBanks (){
  String cachedLanguageCode = CacheHelper.shared.getCachedLanguage();
  if(cachedLanguageCode == "vi"){

    return[
      BankModel(
        code: "ABBank",
        logo: "ABBank.png",
        name: "AB Bank - NH TMCP An Bình",
      ),
      BankModel(
        code: "ACB",
        logo: "ACB.png",
        name: "ACB - Ngân hàng Á Châu",
      ),
      BankModel(
        code: "AgriBank",
        logo: "Agribank.png",
        name: "AgriBank - NH Nông Nghiệp & PTNT Việt Nam",
      ),
      BankModel(
        code: "BIDV",
        logo: "BIDV.png",
        name: "BIDV – Ngân hàng đầu tư và phát triển Việt Nam",
      ),
      BankModel(
        code: "BacABank",
        logo: "BacABank.png",
        name: "Bac A Bank - Ngân hàng TMCP Bắc Á",
      ),
      BankModel(
        code: "BaoVietBank",
        logo: "BaoVietBank.jpg",
        name:"BaoVietBank - Ngân hàng Bảo Việt",
      ),
      BankModel(
        code: "DongABank",
        logo: "DongABank.png",
        name:  "Dong A Bank - Ngân hàng TMCP Đông Á",
      ),
      BankModel(
        code: "Eximbank",
        logo: "Eximbank.png",
        name: "Eximbank - Ngân hàng TMCP Xuất nhập khẩu Việt Nam",
      ),
      BankModel(
        code: "GPBank",
        logo: "GPBank.png",
        name:  "GP Bank - NH TMCP Dầu Khí Toàn Cầu",
      ),
      BankModel(
        code: "HDBank",
        logo: "HDBank.png",
        name:  "HDBank - Ngân hàng TMCP Phát Triển TP Hồ Chí Minh",
      ),
      BankModel(
        code: "LienVietPostBank",
        logo: "LienVietPostBank.png",
        name: "LienVietPostBank - Ngân hàng Bưu điện Liên Việt",
      ),
      BankModel(
        code: "MB",
        logo: "MB.png",
        name: "MB - Ngân hàng TMCP Quân Đội",
      ),
      BankModel(
        code: "MaritimeBank",
        logo: "MSBBank.png",
        name:"MSB – Ngân hàng TMCP Hàng Hải Việt Nam",
      ),
      BankModel(
        code: "NamABank",
        logo: "NamABank.png",
        name: "Nam A Bank - NH TMCP Nam Á",
      ),
      BankModel(
        code: "NaviBank",
        logo: "NCBBank.png",
        name: "NaviBank - Ngân hàng TMCP Quốc dân",
      ),
      BankModel(
        code: "OCB",
        logo: "OCBBank.png",
        name: "OCB - Ngân hàng Phương Đông",
      ),
      BankModel(
        code: "OceanBank",
        logo: "OceanBank.png",
        name:"OceanBank - Ngân hàng TMCP Đại Dương",
      ),
      BankModel(
        code: "PGBank",
        logo: "PGBank.png",
        name: "PG Bank - NH TMCP Xăng dầu Petrolimex",
      ),
      BankModel(
        code: "SHB",
        logo: "SHB.png",
        name:"SHB - Ngân hàng TMCP Sài Gòn - Hà Nội",
      ),
      BankModel(
        code: "SacomBank",
        logo: "Saccombank.png",
        name: "SacomBank - NH TMCP Sài Gòn Thương Tín",
      ),
      BankModel(
        code: "SaigonBank",
        logo: "SaigonBank.png",
        name:"Saigon Bank - NH TMCP Sài Gòn Công Thương",
      ),
      BankModel(
        code: "TechComBank",
        logo: "TechcomBank.png",
        name: "TechComBank – Ngân hàng TMCP Kỹ thương Việt Nam",
      ),
      BankModel(
        code: "TienphongBank",
        logo: "TPBank.png",
        name: "TienphongBank - Ngân hàng Tiên phong",
      ),
      BankModel(
        code: "VIB",
        logo: "VIBBank.png",
        name:  "VIB - Ngân Hàng Quốc Tế",
      ),
      BankModel(
        code: "VPBank",
        logo: "VPBank.png",
        name:"VP Bank - Ngân hàng Việt Nam Thịnh Vượng",
      ),
      BankModel(
        code: "VietABank",
        logo: "VietABank.png",
        name: "VietABank - Ngân hàng Việt Á",
      ),
      BankModel(
        code: "Vietcombank",
        logo: "Vietcombank.png",
        name: "Vietcombank - NH TMCP Ngoại thương Việt Nam",
      ),
      BankModel(
        code: "VietinBank",
        logo: "VietinBank.png",
        name: "VietinBank - Ngân hàng TMCP Công thương Việt Nam",
      )
    ];


  }else{
    return[
      BankModel(
        code: "ABBank",
        logo: "ABBank.png",
        name: "AB Bank - An Binh Commercial Joint Stock Bank",
      ),
      BankModel(
        code: "ACB",
        logo: "ACB.png",
        name: "ACB - Asia Commercial Joint Stock Bank",
      ),
      BankModel(
        code: "AgriBank",
        logo: "Agribank.png",
        name: "AgriBank - Vietnam Bank for Agriculture and Rural Development",
      ),
      BankModel(
        code: "BIDV",
        logo: "BIDV.png",
        name: "BIDV - Bank for Investment and Development of Vietnam",
      ),
      BankModel(
        code: "BacABank",
        logo: "BacABank.png",
        name: "Bac A Bank - North Asia Commercial Joint Stock Bank",
      ),
      BankModel(
        code: "BaoVietBank",
        logo: "BaoVietBank.jpg",
        name: "BaoVietBank - BaoViet Bank",
      ),
      BankModel(
        code: "DongABank",
        logo: "DongABank.png",
        name: "Dong A Bank - Dong A Commercial Joint Stock Bank",
      ),
      BankModel(
        code: "Eximbank",
        logo: "Eximbank.png",
        name: "Eximbank - Vietnam Export Import Commercial Joint Stock Bank",
      ),
      BankModel(
        code: "GPBank",
        logo: "GPBank.png",
        name: "GP Bank - Global Petro Commercial Joint Stock Bank",
      ),
      BankModel(
        code: "HDBank",
        logo: "HDBank.png",
        name: "HDBank - Ho Chi Minh City Development Joint Stock Commercial Bank",
      ),
      BankModel(
        code: "LienVietPostBank",
        logo: "LienVietPostBank.png",
        name: "LienVietPostBank - LienViet Post Bank",
      ),
      BankModel(
        code: "MB",
        logo: "MB.png",
        name: "MB - Military Commercial Joint Stock Bank",
      ),
      BankModel(
        code: "MaritimeBank",
        logo: "MSBBank.png",
        name: "MSB - Maritime Commercial Joint Stock Bank",
      ),
      BankModel(
        code: "NamABank",
        logo: "NamABank.png",
        name: "Nam A Bank - Nam A Commercial Joint Stock Bank",
      ),
      BankModel(
        code: "NaviBank",
        logo: "NCBBank.png",
        name: "NaviBank - National Citizen Bank",
      ),
      BankModel(
        code: "OCB",
        logo: "OCBBank.png",
        name: "OCB - Oriental Commercial Joint Stock Bank",
      ),
      BankModel(
        code: "OceanBank",
        logo: "OceanBank.png",
        name: "OceanBank - Ocean Commercial Joint Stock Bank",
      ),
      BankModel(
        code: "PGBank",
        logo: "PGBank.png",
        name: "PG Bank - Petrolimex Joint Stock Commercial Bank",
      ),
      BankModel(
        code: "SHB",
        logo: "SHB.png",
        name: "SHB - Saigon - Hanoi Commercial Joint Stock Bank",
      ),
      BankModel(
        code: "SacomBank",
        logo: "Saccombank.png",
        name: "SacomBank - Saigon Thuong Tin Commercial Joint Stock Bank",
      ),
      BankModel(
        code: "SaigonBank",
        logo: "SaigonBank.png",
        name: "Saigon Bank - Saigon Cong Thuong Commercial Joint Stock Bank",
      ),
      BankModel(
        code: "TechComBank",
        logo: "TechcomBank.png",
        name: "TechComBank - Vietnam Technological and Commercial Joint Stock Bank",
      ),
      BankModel(
        code: "TienphongBank",
        logo: "TPBank.png",
        name: "TienphongBank - Tien Phong Commercial Joint Stock Bank",
      ),
      BankModel(
        code: "VIB",
        logo: "VIBBank.png",
        name: "VIB - Vietnam International Bank",
      ),
      BankModel(
        code: "VPBank",
        logo: "VPBank.png",
        name: "VP Bank - Vietnam Prosperity Joint Stock Commercial Bank",
      ),
      BankModel(
        code: "VietABank",
        logo: "VietABank.png",
        name: "VietABank - Viet A Commercial Joint Stock Bank",
      ),
      BankModel(
        code: "Vietcombank",
        logo: "Vietcombank.png",
        name: "Vietcombank - Vietnam Joint Stock Commercial Bank for Foreign Trade",
      ),
      BankModel(
        code: "VietinBank",
        logo: "VietinBank.png",
        name: "VietinBank - Vietnam Joint Stock Commercial Bank for Industry and Trade",
      )
    ];
  }
}
List<BankHolderModel> listBankGotadiAccount(){
  String cachedLanguageCode = CacheHelper.shared.getCachedLanguage();
  if(cachedLanguageCode == "vi"){
    return [
      BankHolderModel(
        bankCode: "",
        bankName: "Ngân hàng TMDV Quốc tế Việt Nam (VIB)- Chi nhánh Sở Giao Dịch",
        bankShortName: "VIB",
        bankLogo: "VIBBank.png",
        transferNote: "",
        accountNumber: "333 666 999 - Tài khoản VND",
        accountName: "Công Ty Cổ Phần Công Nghệ Du Lịch Gotadi"
      ),
      BankHolderModel(
        bankCode: "",
        bankName: "Ngân hàng Ngoại thương Việt Nam (VCB), Chi nhánh Sở Giao Dịch",
        bankShortName: "VCB",
        bankLogo: "Vietcombank.png",
        transferNote: "",
        accountNumber: "0011001523690",
        accountName: "Công Ty Cổ Phần Công Nghệ Du Lịch Gotadi"
      ),
      BankHolderModel(
        bankCode: "",
        bankName: "Ngân hàng TMCP Kỹ Thương VN (Techcombank), Chi nhánh Thắng Lợi",
        bankShortName: "Techcombank",
        bankLogo: "TechcomBank.png",
        transferNote: "Ghi chú: Vui lòng không chuyển khoản sau 20h",
        accountNumber: "19120036731016",
        accountName: "Công Ty Cổ Phần Công Nghệ Du Lịch Gotadi"
      ),
      BankHolderModel(
        bankCode: "",
        bankName: "Ngân hàng TM Công thương Việt Nam (Vietinbank), Chi nhánh Sài Gòn",
        bankShortName: "VietinBank",
        bankLogo: "VietinBank.png",
        transferNote: "",
        accountNumber: "115002809486",
        accountName: "Công Ty Cổ Phần Công Nghệ Du Lịch Gotadi"
      )
    ];
  }else{
    return [
      BankHolderModel(
          bankCode: "",
          bankName: "Vietnam International Commercial Joint Stock Bank (VIB) - Transaction Office Branch",
          bankShortName: "VIB",
          bankLogo: "VIBBank.png",
          transferNote: "",
          accountNumber: "333 666 999 - VND Account",
          accountName: "Gotadi Technology Tourism Joint Stock Company"
      ),
      BankHolderModel(
          bankCode: "",
          bankName: "Vietnam Joint Stock Commercial Bank for Foreign Trade (VCB), Transaction Office Branch",
          bankShortName: "VCB",
          bankLogo: "Vietcombank.png",
          transferNote: "",
          accountNumber: "0011001523690",
          accountName: "Gotadi Technology Tourism Joint Stock Company"
      ),
      BankHolderModel(
          bankCode: "",
          bankName: "Vietnam Technological and Commercial Joint Stock Bank (Techcombank), Thang Loi Branch",
          bankShortName: "Techcombank",
          bankLogo: "TechcomBank.png",
          transferNote: "Note: Please do not transfer after 8 PM",
          accountNumber: "19120036731016",
          accountName: "Gotadi Technology Tourism Joint Stock Company"
      ),
      BankHolderModel(
          bankCode: "",
          bankName: "Vietnam Bank for Industry and Trade (Vietinbank), Saigon Branch",
          bankShortName: "VietinBank",
          bankLogo: "VietinBank.png",
          transferNote: "",
          accountNumber: "115002809486",
          accountName: "Gotadi Technology Tourism Joint Stock Company"
      )
    ];

  }


}