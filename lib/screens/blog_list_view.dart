import 'package:blog_explorer/screens/tabs_screen.dart';
import 'package:flutter/material.dart';
import '../data_model/blog.dart';
import '../widgets/blog_card_item.dart';
import 'detailed_blog_view.dart';

class BlogsViewListScreen extends StatelessWidget {
  const BlogsViewListScreen({
    super.key,
    required this.blogs,
  });
  final List<Blog> blogs;

  void _selectBlog(BuildContext context, Blog blog) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => BlogDetailViewScreen(
          blog: blog,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.article_rounded,
            size: 100,
            color: Colors.grey,
          ),
          const SizedBox(height: 20),
          const Text(
            'No Blogs Added Yet!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Start exploring and add your favorite blogs!',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CustomTabsScreen()));
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.teal,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            ),
            child: const Text(
              'Explore Blogs',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );

    if (blogs.isNotEmpty) {
      content = ListView.builder(
        itemCount: blogs.length,
        itemBuilder: (context, index) => BlogViewItem(
          blog: blogs[index],
          onSelectBlog: (blog) {
            _selectBlog(context, blog);
          },
        ),
      );
    }
    return Scaffold(
      backgroundColor: Colors.black,
      body: content,
    );
  }
}
