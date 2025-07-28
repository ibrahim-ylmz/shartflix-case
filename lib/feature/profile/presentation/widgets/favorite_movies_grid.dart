import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shartflix_case/feature/home/domain/entities/movie.dart';

/// Grid widget for displaying favorite movies.
class FavoriteMoviesGrid extends StatelessWidget {
  /// Favorite movies list.

  const FavoriteMoviesGrid({
    /// Favorite movies list.
    required this.movies,

    /// Loading state.
    required this.isLoading,
    super.key,
  });

  /// Favorite movies list.
  final List<MovieEntity> movies;

  /// Loading state.
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(
          color: Color(0xFFE50914),
        ),
      );
    }

    if (movies.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.movie_outlined,
              size: 64,
              color: Colors.white.withValues(alpha: 0.3),
            ),
            const SizedBox(height: 16),
            Text(
              'Henüz beğendiğiniz film yok',
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.7),
                fontSize: 16,
              ),
            ),
          ],
        ),
      );
    }

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.6,
      ),
      itemCount: movies.length,
      itemBuilder: (context, index) {
        final movie = movies[index];
        return _FavoriteMovieCard(movie: movie);
      },
    );
  }
}

/// Individual movie card widget.
class _FavoriteMovieCard extends StatelessWidget {
  const _FavoriteMovieCard({required this.movie});

  final MovieEntity movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Movie poster
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: _buildMoviePoster(movie),
            ),
          ),
        ),
        
        const SizedBox(height: 8),
        
        // Movie info below the image
        Text(
          movie.title ?? 'Bilinmeyen Film',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        
        if (movie.genre != null) ...[
          const SizedBox(height: 4),
          Text(
            movie.genre!,
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.7),
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ],
    );
  }

  /// Builds movie poster with safe URL validation
  Widget _buildMoviePoster(MovieEntity movie) {
    final posterUrl = movie.posterUrl ?? '';
    
    // Check if posterUrl is empty or invalid
    if (posterUrl.isEmpty || 
        posterUrl.startsWith('file:///') ||
        Uri.tryParse(posterUrl)?.hasScheme != true) {
      return Container(
        color: Colors.grey[800],
        width: double.infinity,
        child: const Icon(
          Icons.movie,
          color: Colors.white,
          size: 40,
        ),
      );
    }

    return CachedNetworkImage(
      imageUrl: posterUrl,
      fit: BoxFit.cover,
      width: double.infinity,
      placeholder: (context, url) => Container(
        color: Colors.grey[800],
        width: double.infinity,
        child: const Center(
          child: CircularProgressIndicator(
            color: Color(0xFFE50914),
            strokeWidth: 2,
          ),
        ),
      ),
      errorWidget: (context, url, error) => Container(
        color: Colors.grey[800],
        width: double.infinity,
        child: const Icon(
          Icons.movie,
          color: Colors.white,
          size: 40,
        ),
      ),
    );
  }
}
