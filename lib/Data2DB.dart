import 'dart:convert';
import 'package:http/http.dart' as http;

void sendDataToPhp() async {
  String phpApiUrl = "http://192.168.18.11/index.php";

  Map<String, dynamic> data = {
    'action': 'INS',
    'param1': 'hello',
    'param2': 'flutter',
    'param3': 'world',
    
  };

  try {
    final response = await http.post(
      Uri.parse(phpApiUrl),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      // 處理成功的情況
      print("資料發送成功");
      print("伺服器回應: ${response.body}");
    } else {
      // 處理錯誤的情況
      print("資料發送失敗");
      print("錯誤碼: ${response.statusCode}");
    }
  } catch (error) {
    // 捕捉任何異常
    print("發生錯誤: $error");
  }
}
