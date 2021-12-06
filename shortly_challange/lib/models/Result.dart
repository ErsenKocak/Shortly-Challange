import 'ShortedLink.dart';

class Result {
  bool? ok;
  ShortedLink? result;
  int? errorCode;
  String? error;

  Result({required this.ok, this.result});

  Result.fromJson(Map<String, dynamic> json) {
    ok = json['ok'];
    errorCode = json['errorCode'];
    error = json['error'];
    result =
        json['result'] != null ? ShortedLink.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ok'] = this.ok;
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    return data;
  }
}
