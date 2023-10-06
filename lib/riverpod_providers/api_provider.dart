import 'dart:convert';
import 'package:blog_explorer/database/offline_database_support.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../data_model/blog.dart';

final blogsProvider = FutureProvider<List<Blog>>((ref) async {
  final db = BlogDatabaseServices();
  final connectivityResult = await Connectivity().checkConnectivity();
  final isOnline = connectivityResult != ConnectivityResult.none;
  
  const String apiUrl = 'https://intent-kit-16.hasura.app/api/rest/blogs';
  const String adminSecret = '32qR4KmXOIpsGPQKMqEJHGJS27G5s7HdSKO3gdtQd2kv5e852SiYwWNfxkZOBuQ6';

  if (isOnline) {
    try {
      final response = await http.get(Uri.parse(apiUrl), headers: {
        'x-hasura-admin-secret': adminSecret,
      });

      if (response.statusCode == 200) {
        final List<dynamic> responseData = jsonDecode(response.body)['blogs'];
        final blogs = responseData.map((blogData) => Blog.fromJson(blogData)).toList();

        for (var blog in blogs) {
          await db.insertBlog(blog);
        }

        return blogs;
      } else {
        throw Exception('Something went wrong. Please try again later!');
      }
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  } else {
    final offlineBlogs = await db.loadBlogs();
    return offlineBlogs;
  }
});
