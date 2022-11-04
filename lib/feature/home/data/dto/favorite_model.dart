class FavoriteModel {
  String? status;
  String? reason;

  FavoriteModel({this.status, this.reason});

  FavoriteModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    reason = json['reason'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['reason'] = reason;
    return data;
  }
}
