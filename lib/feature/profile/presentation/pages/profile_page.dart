import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shartflix_case/feature/profile/presentation/bloc/profile_bloc.dart';
import 'package:shartflix_case/feature/profile/presentation/bloc/profile_event.dart';
import 'package:shartflix_case/feature/profile/presentation/bloc/profile_state.dart';
import 'package:shartflix_case/feature/profile/presentation/widgets/favorite_movies_grid.dart';
import 'package:shartflix_case/feature/profile/presentation/widgets/profile_header.dart';
import 'package:shartflix_case/shared/widgets/custom_back_button.dart';

/// Profile page widget.
class ProfilePage extends StatefulWidget {
  /// Constructor for [ProfilePage].
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with WidgetsBindingObserver, AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    context.read<ProfileBloc>().add(const LoadProfile());
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      _refreshFavoriteMovies();
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _refreshFavoriteMovies();
    });
  }

  void _refreshFavoriteMovies() {
    final currentState = context.read<ProfileBloc>().state;
    if (currentState is ProfileLoaded) {
      context.read<ProfileBloc>().add(const LoadFavoriteMovies());
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      backgroundColor: const Color(0xFF090909),
      appBar: AppBar(
        leading: const CustomBackButton(),
        leadingWidth: 90,
        centerTitle: true,
        title: Text(
          'Profil Detayı',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 15,
          ),
        ),
        actions: [
          Container(
            padding: const EdgeInsets.only(right: 30),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFE50914),
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 8,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                minimumSize: Size.zero,
              ),
              child: Row(
                spacing: 4,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.diamond,
                    color: Colors.white,
                    size: 20,
                  ),
                  Text(
                    'Sınırlı Teklif',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if (state is ProfileLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Color(0xFFE50914),
                ),
              );
            }

            if (state is ProfileError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Bir hata oluştu',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        context.read<ProfileBloc>().add(const LoadProfile());
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFE50914),
                      ),
                      child: const Text('Tekrar Dene'),
                    ),
                  ],
                ),
              );
            }

            if (state is ProfileLoaded) {
              return RefreshIndicator(
                color: const Color(0xFFE50914),
                onRefresh: () async {
                  context.read<ProfileBloc>().add(const LoadFavoriteMovies());
                  await Future<void>.delayed(const Duration(milliseconds: 500));
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 30,
                  ),
                  child: Column(
                    children: [
                      ProfileHeader(
                        profile: state.profile,
                        isUploadingPhoto: state.isUploadingPhoto,
                        onPhotoUpload: () {},
                      ),
                      const SizedBox(height: 24),
                      Expanded(
                        child: FavoriteMoviesGrid(
                          movies: state.favoriteMovies,
                          isLoading: state.isLoadingFavorites,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
