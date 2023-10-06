import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data_model/blog.dart';
import '../riverpod_providers/api_provider.dart';
import '../riverpod_providers/bookmarked_blogs_provider.dart';
import 'blog_list_view.dart';

class CustomTabsScreen extends ConsumerStatefulWidget {
  const CustomTabsScreen({super.key});

  @override
  ConsumerState<CustomTabsScreen> createState() {
    return _CustomTabsScreenState();
  }
}

class _CustomTabsScreenState extends ConsumerState<CustomTabsScreen> {
  int _selectedTabIndex = 0;

  void _selectTabIndex(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final blogsData = ref.watch(blogsProvider);
    Widget activeTabContent = blogsData.when(
      data: (blogs) {
        List<Blog> apiBlogs = blogs.map((e) => e).toList();
        return BlogsViewListScreen(
          blogs: apiBlogs,
        );
      },
      error: (error, stackTrace) {
        return const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline,
                size: 100,
                color: Colors.red,
              ),
              Text(
                'Oops! Something went wrong.',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Please try again later.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        );
      },
      loading: () => const Center(
        child: CircularProgressIndicator(
          semanticsLabel: 'Loading...',
          color: Colors.teal,
        ),
      ),
    );

    String activeTabTitle = 'Blogs';
    if (_selectedTabIndex == 1) {
      final favoriteBlogsData = ref.watch(favoriteBlogsProvider);
      activeTabContent = BlogsViewListScreen(blogs: favoriteBlogsData);
      activeTabTitle = 'Your Bookmarks';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activeTabTitle),
        backgroundColor: Colors.teal,
      ),
      body: activeTabContent,
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.teal,
        onTap: _selectTabIndex,
        currentIndex: _selectedTabIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.article_rounded),
            label: 'Blogs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Bookmarks',
          ),
        ],
      ),
    );
  }
}
