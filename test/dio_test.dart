import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('dio simple test', () async {
    var response = await Dio().get("http://127.0.0.1:3000/app/users/");
    print(response.data);
  });

  
}
