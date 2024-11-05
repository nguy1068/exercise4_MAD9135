import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> fetchRandomUsers() async {
  const String url =
      'https://random-data-api.com/api/users/random_user?size=10'; // Fetch 10 users
  try {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List<dynamic> users = json.decode(response.body);
      for (var user in users) {
        print('${user['uid']} - ${user['first_name']} ${user['last_name']}');
      }
    } else {
      print('Failed to load users: ${response.statusCode}');
    }
  } catch (e) {
    print('Error occurred: $e');
  }
}

void main() {
  fetchRandomUsers();
}
