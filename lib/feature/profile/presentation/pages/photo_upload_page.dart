import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shartflix_case/feature/profile/presentation/bloc/profile_bloc.dart';
import 'package:shartflix_case/feature/profile/presentation/bloc/profile_event.dart';
import 'package:shartflix_case/feature/profile/presentation/bloc/profile_state.dart';

/// Photo upload page for selecting and uploading profile photos.
class PhotoUploadPage extends StatefulWidget {
  /// Constructor for [PhotoUploadPage].
  const PhotoUploadPage({super.key});

  @override
  State<PhotoUploadPage> createState() => _PhotoUploadPageState();
}

class _PhotoUploadPageState extends State<PhotoUploadPage> {
  File? _selectedImage;
  bool _hasUploadStarted = false;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );
    if (picked != null) {
      setState(() {
        _selectedImage = File(picked.path);
      });
    }
  }

  void _upload() {
    if (_selectedImage == null) return;
    setState(() {
      _hasUploadStarted = true;
    });
    context.read<ProfileBloc>().add(UploadPhoto(_selectedImage!));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state is ProfileLoaded &&
            !state.isUploadingPhoto &&
            _hasUploadStarted) {
          context.pop();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Fotoğraf başarıyla yüklendi'),
              backgroundColor: Color(0xFFE50914),
            ),
          );
        } else if (state is ProfileError && _hasUploadStarted) {
          setState(() {
            _hasUploadStarted = false;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: const Color(0xFFE50914),
            ),
          );
        }
      },
      child: Scaffold(
        backgroundColor: const Color(0xFF090909),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(32),
                          border: Border.all(
                            color: Colors.white.withValues(alpha: 0.2),
                            width: 1.2,
                          ),
                        ),
                        child: IconButton(
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 20,
                          ),
                          onPressed: () => context.pop(),
                        ),
                      ),
                    ),
                    const Center(
                      child: Text(
                        'Profil Detayı',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25),

                // Title
                const Text(
                  'Fotoğraflarınızı Yükleyin',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 10),

                // Subtitle
                const Text(
                  'Resources out incentivize\nrelaxation floor loss cc.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 35),

                // Photo selection area
                Center(
                  child: GestureDetector(
                    onTap: _pickImage,
                    child: Container(
                      width: 165,
                      height: 155,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.08),
                        borderRadius: BorderRadius.circular(28),
                        border: Border.all(
                          color: Colors.white.withValues(alpha: 0.12),
                          width: 1.2,
                        ),
                      ),
                      child: _selectedImage == null
                          ? Center(
                              child: Icon(
                                Icons.add,
                                color: Colors.white.withValues(alpha: 0.5),
                                size: 36,
                              ),
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(24),
                              child: Image.file(
                                _selectedImage!,
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: double.infinity,
                              ),
                            ),
                    ),
                  ),
                ),

                const Spacer(),

                // Upload button
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: BlocBuilder<ProfileBloc, ProfileState>(
                      builder: (context, state) {
                        final isLoading =
                            state is ProfileLoaded && state.isUploadingPhoto;
                        final canUpload = _selectedImage != null && !isLoading;

                        return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: canUpload
                                ? const Color(0xFFE50914)
                                : Colors.grey[700],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            elevation: 0,
                          ),
                          onPressed: canUpload ? _upload : null,
                          child: isLoading
                              ? const SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white,
                                    ),
                                  ),
                                )
                              : const Text(
                                  'Devam Et',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                  ),
                                ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
