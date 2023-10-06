import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data_model/blog.dart';
import '../riverpod_providers/bookmarked_blogs_provider.dart';

class BlogDetailViewScreen extends ConsumerWidget {
  const BlogDetailViewScreen({
    super.key,
    required this.blog,
  });
  final Blog blog;

  void toggleBlogFavStatus(BuildContext context, Blog blog, WidgetRef ref) {
    final wasAdded =
        ref.read(favoriteBlogsProvider.notifier).toggleBlogFavoriteStatus(blog);
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(wasAdded
            ? 'Blog have been bookmarked !!'
            : 'Blog have been removed from Bookmarks !!'),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteBlogs = ref.watch(favoriteBlogsProvider);
    final isFavorite = favoriteBlogs.contains(blog);
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text(
            blog.title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                toggleBlogFavStatus(context, blog, ref);
              },
              icon: AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                transitionBuilder: (child, animation) {
                  return ScaleTransition(
                    scale: animation,
                    child: child,
                  );
                },
                child: Icon(
                  isFavorite ? Icons.star : Icons.star_border,
                  key: ValueKey(isFavorite),
                  size: 28,
                  color: isFavorite ? Colors.amber : Colors.white,
                ),
              ),
            ),
          ],
          backgroundColor: Colors.teal,
          elevation: 4,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Hero(
                tag: blog.id,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    blog.imageUrl,
                    fit: BoxFit.cover,
                    height: 300,
                    width: double.infinity,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Card(
                shadowColor: Colors.blueGrey,
                margin: const EdgeInsets.all(8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 8,
                clipBehavior: Clip.antiAlias,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.indigo,
                        Colors.teal,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Text(
                    blog.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
