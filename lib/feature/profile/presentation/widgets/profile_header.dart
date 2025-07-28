import 'package:flutter/material.dart';
import 'package:shartflix_case/feature/profile/domain/entities/user_profile_entity.dart';

/// Profile header widget displaying user info and action buttons.
class ProfileHeader extends StatelessWidget {
  /// Constructor for [ProfileHeader].
  const ProfileHeader({
    required this.profile,
    required this.isUploadingPhoto,
    required this.onPhotoUpload,
    super.key,
  });

  /// User profile.
  final UserProfileEntity profile;

  /// Whether photo upload is in progress.
  final bool isUploadingPhoto;

  /// Callback for photo upload.
  final VoidCallback onPhotoUpload;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.2),
                  width: 2,
                ),
              ),
              child: ClipOval(
                child: _buildProfileImage(),
              ),
            ),
            if (isUploadingPhoto)
              Positioned.fill(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.black54,
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2,
                      ),
                    ),
                  ),
                ),
              ),
            const SizedBox(width: 16),

            // User details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    profile.name,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'ID: ${profile.id.substring(0, 6)}',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(
                        context,
                      ).textTheme.bodyMedium?.color?.withValues(alpha: 0.7),
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),

            // Photo upload button
            ElevatedButton(
              onPressed: isUploadingPhoto ? null : onPhotoUpload,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFE50914),
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 5,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Fotoğraf Ekle',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 32),

        // Section title
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            // 700w 13px
            'Beğendiğim Filmler',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w700,
              fontSize: 13,
            ),
          ),
        ),
      ],
    );
  }

  /// Builds profile image with safe URL validation
  Widget _buildProfileImage() {
    // Check if photoUrl is empty or invalid
    if (profile.photoUrl.isEmpty || 
        profile.photoUrl.startsWith('file:///') ||
        Uri.tryParse(profile.photoUrl)?.hasScheme != true) {
      return Container(
        color: Colors.grey[800],
        child: const Icon(
          Icons.person,
          color: Colors.white,
          size: 40,
        ),
      );
    }

    return Image.network(
      profile.photoUrl,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        return Container(
          color: Colors.grey[800],
          child: const Icon(
            Icons.person,
            color: Colors.white,
            size: 40,
          ),
        );
      },
    );
  }
}
