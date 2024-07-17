import 'package:myutils/data/cache_helper/cache_helper.dart';

import 'model/officer_model.dart';

const gotadiOfficer = [
  {
    "name": "VP Hồ Chí Minh",
    "address": "194 Nguyễn Thị Minh Khai, Phường Võ Thị Sáu, Quận 3, TP.HCM",
    "phone": "Hotline: 1900-9002",
    "contact": "Liên hệ các bộ phận: 028.62.850850",
    "fax": "Fax: (84) 28 62 580 555"
  },
  {
    "name": "VP Hà Nội",
    "address": "47 Phan Chu Trinh, Phường Phan Chu Trinh, Quận Hoàn Kiếm, Hà Nội",
    "phone": "Hotline: 1900-9002",
    "contact": "Liên hệ: 024.71.069069",
    "fax": "Fax: (84) 24 37 333 337"
  }
];
List<OfficerModel> listOfficer (){
  String cachedLanguageCode = CacheHelper.shared.getCachedLanguage();
  if(cachedLanguageCode == "vi"){
    return [
      OfficerModel(
        name: "VP Hồ Chí Minh",
        address: "194 Nguyễn Thị Minh Khai, Phường Võ Thị Sáu, Quận 3, TP.HCM",
        phone: "Hotline: 1900-9002",
        contact: "Liên hệ các bộ phận: 028.62.850850",
        fax: "Fax: (84) 28 62 580 555"
      ),
      OfficerModel(
        name: "VP Hà Nội",
        address: "47 Phan Chu Trinh, Phường Phan Chu Trinh, Quận Hoàn Kiếm, Hà Nội",
        phone: "Hotline: 1900-9002",
        contact: "Liên hệ: 024.71.069069",
        fax: "Fax: (84) 24 37 333 337"
      )
    ];
  }else{
    return [
      OfficerModel(
        name: "Ho Chi Minh City Office",
        address: "194 Nguyen Thi Minh Khai, Vo Thi Sau Ward, District 3, HCMC",
        phone: "Hotline: 1900-9002",
        contact: "Contact departments: 028.62.850850",
        fax: "Fax: (84) 28 62 580 555"
      ),
      OfficerModel(
        name: "Hanoi Office",
        address: "47 Phan Chu Trinh, Phan Chu Trinh Ward, Hoan Kiem District, Hanoi",
        phone: "Hotline: 1900-9002",
        contact: "Contact: 024.71.069069",
        fax: "Fax: (84) 24 37 333 337"
      )
    ];
  }
}