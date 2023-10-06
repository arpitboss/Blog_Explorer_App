import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data_model/blog.dart';

class FavoriteBlogsNotifier extends StateNotifier<List<Blog>> {
  FavoriteBlogsNotifier() : super([]);

  bool toggleBlogFavoriteStatus(Blog blog) {
    final isBlogFavorite = state.contains(blog);

    if (isBlogFavorite) {
      state = state.where((m) => m.id != blog.id).toList();
    } else {
      state = [...state, blog];
    }

    return !isBlogFavorite;
  }
}

final favoriteBlogsProvider = StateNotifierProvider<FavoriteBlogsNotifier, List<Blog>>(
  (ref) => FavoriteBlogsNotifier(),
);
