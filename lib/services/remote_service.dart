import 'package:api/models/post.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  Future<List<Post>?> getPosts() async {
    var client = http.Client();

    try {
      var uri = Uri.parse("https://jsonplaceholder.typicode.com/posts");
      var response = await client.get(uri);
      
      if (response.statusCode == 200) {
        var json = response.body;
        return postFromJson(json); // Return the parsed list of posts
      }
    } catch (e) {
      print("Error fetching posts: $e");
      return null; // Return null if there's an error
    } finally {
      client.close(); // Ensure the client is closed
    }

    return null; // Return null if the status code isn't 200
  }
}
