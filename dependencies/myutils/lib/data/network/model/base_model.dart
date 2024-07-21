/// Created by Nguyen Huu Tu on 28/03/2022.

abstract class BaseModel {
  BaseModel();
  BaseModel.init();
  BaseModel.fromJson(Map<String, dynamic> json);
  Map<String, dynamic> toJson();
}
