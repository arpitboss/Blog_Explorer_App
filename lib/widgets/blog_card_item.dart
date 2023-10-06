import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import '../data_model/blog.dart';

class BlogViewItem extends StatelessWidget {
  const BlogViewItem({
    Key? key,
    required this.blog,
    required this.onSelectBlog,
  }) : super(key: key);

  final Blog blog;
  final void Function(Blog blog) onSelectBlog;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.all(12),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: InkWell(
          onTap: () {
            onSelectBlog(blog);
          },
          child: Stack(
            children: [
              Hero(
                tag: blog.id,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: blog.imageUrl,
                    fit: BoxFit.cover,
                    height: 240,
                    width: double.infinity,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black,
                        Colors.black.withOpacity(0.6),
                      ],
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 16,
                  ),
                  child: AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 300),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    textAlign: TextAlign.center,
                    child: Text(
                      blog.title,
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
