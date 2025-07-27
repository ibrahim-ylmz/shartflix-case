import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shartflix_case/feature/home/domain/entities/movie.dart';

/// Widget that displays a movie in Instagram Reels-like full-screen format
class ReelsMovieWidget extends StatelessWidget {
  /// Constructor
  const ReelsMovieWidget({
    required this.movie,
    required this.onLikeToggle,
    super.key,
  });

  /// Movie entity to display
  final MovieEntity movie;

  /// Callback for like toggle
  final VoidCallback onLikeToggle;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // Background movie poster
        _buildBackgroundImage(),

        // Gradient overlay
        _buildGradientOverlay(),

        // Like button (top right)
        _buildLikeButton(),

        // Movie info (bottom left)
        _buildMovieInfo(context),
      ],
    );
  }

  /// Build background image with cached network image
  Widget _buildBackgroundImage() {
    return CachedNetworkImage(
      imageUrl: movie.posterUrl ?? '',
      fit: BoxFit.cover,
      placeholder: (context, url) => Container(
        color: Colors.grey[900],
        child: Center(
          child: CircularProgressIndicator(
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
      errorWidget: (context, url, error) => Container(
        color: Colors.grey[700],
        child: const Center(
          child: Icon(
            Icons.movie,
            color: Colors.white,
            size: 50,
          ),
        ),
      ),
    );
  }

  /// Build gradient overlay for better text readability
  Widget _buildGradientOverlay() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            Color(0x4D000000), // 30% black
            Color(0xCC000000), // 80% black
          ],
          stops: [0.0, 0.6, 1.0],
        ),
      ),
    );
  }

  /// Build like button (heart icon)
  Widget _buildLikeButton() {
    return Positioned(
      bottom: 110,
      right: 20,
      child: GestureDetector(
        onTap: onLikeToggle,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(40),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
            child: Container(
              width: 55,
              height: 85,
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.1),
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.2),
                ),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Center(
                child: Icon(
                  movie.isFavorite ?? false ? Icons.favorite : Icons.favorite,
                  color: movie.isFavorite ?? false
                      ? const Color(0xFFE50914)
                      : Colors.white,
                  size: 28,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMovieInfo(BuildContext context) {
    return Positioned(
      bottom: 15,
      left: 30,
      right: 30,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 2),
          ),
          child: ClipOval(
            child: CachedNetworkImage(
              imageUrl: movie.posterUrl ?? '',
              fit: BoxFit.cover,
              placeholder: (context, url) => Container(
                color: Colors.grey[700],
                child: const Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              errorWidget: (context, url, error) => Container(
                color: Colors.grey[700],
                child: const Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ),
        ),
        title: Text(
          movie.title ?? 'Unknown Movie',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (movie.plot != null && movie.plot!.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  movie.plot!,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.white70,
                    fontSize: 13,
                    height: 1.4,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.5,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
