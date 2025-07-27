import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shartflix_case/feature/home/presentation/bloc/home_bloc.dart';
import 'package:shartflix_case/feature/home/presentation/bloc/home_event.dart';
import 'package:shartflix_case/feature/home/presentation/bloc/home_state.dart';
import 'package:shartflix_case/feature/home/presentation/pages/mixin/home_page_mixin.dart';
import 'package:shartflix_case/feature/home/presentation/widgets/reels_movie_widget.dart';

/// Home page with Instagram Reels-like movie display
class HomePage extends StatefulWidget {
  /// Constructor
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with HomePageMixin {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF090909),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Color(0xFFE50914),
                ),
              );
            }

            if (state is HomeError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      color: Colors.white,
                      size: 64,
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Bir hata oluştu',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      state.message,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () {
                        context.read<HomeBloc>().add(RefreshHomeData());
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFE50914),
                        foregroundColor: Colors.white,
                      ),
                      child: const Text('Tekrar Dene'),
                    ),
                  ],
                ),
              );
            }

            if (state is HomeLoaded) {
              final movies = state.featuredMovies;

              if (movies.isEmpty) {
                return const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.movie_outlined,
                        color: Colors.white,
                        size: 64,
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Henüz film bulunmuyor',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                );
              }

              return PageView.builder(
                controller: pageController,
                scrollDirection: Axis.vertical,
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  final movie = movies[index];
                  return ReelsMovieWidget(
                    movie: movie,
                    onLikeToggle: () {},
                  );
                },
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
