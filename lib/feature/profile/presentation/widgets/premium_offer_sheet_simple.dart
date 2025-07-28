import 'dart:ui';
import 'package:flutter/material.dart';

/// Premium offer sheet widget for displaying subscription packages
class PremiumOfferSheet extends StatelessWidget {
  /// Constructor for [PremiumOfferSheet]
  const PremiumOfferSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF090909),
            border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
          ),
          child: Stack(
            children: [
              // Top Gradient
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      center: const Alignment(0.0, -1.0),
                      radius: 1.0,
                      colors: [
                        const Color(0xFFE50914).withValues(alpha: 0.3),
                        Colors.transparent,
                      ],
                      stops: const [0.2, 1.0],
                    ),
                  ),
                ),
              ),
              // Bottom Gradient
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      center: const Alignment(0.0, 1.0),
                      radius: 1.0,
                      colors: [
                        const Color(0xFFE50914).withValues(alpha: 0.3),
                        Colors.transparent,
                      ],
                      stops: const [0.2, 1.0],
                    ),
                  ),
                ),
              ),
              // Content
              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildTitleSection(),
                    const SizedBox(height: 24),
                    _buildBonusSection(),
                    const SizedBox(height: 20),
                    _buildPackageSelectionSection(),
                    const SizedBox(height: 20),
                    _buildSeeAllButton(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitleSection() {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Sınırlı Teklif',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        SizedBox(height: 8),
        Text(
          "Jeton paketini seçerek bonus\nkazanın ve yeni bölümlerin kilidini açın!",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  Widget _buildBonusSection() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
      ),
      child: const Column(
        children: [
          Text(
            'Alacağınız Bonuslar',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
          ),
          SizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _BonusItem(
                iconPath: 'assets/icons/ic_emrald.png',
                label: 'Premium\nHesap',
              ),
              _BonusItem(
                iconPath: 'assets/icons/ic_hearts.png',
                label: 'Daha Fazla\nEşleşme',
              ),
              _BonusItem(
                iconPath: 'assets/icons/ic_arrow.png',
                label: 'Öne\nÇıkarma',
              ),
              _BonusItem(
                iconPath: 'assets/icons/ic_heart.png',
                label: 'Daha Fazla\nBeğeni',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPackageSelectionSection() {
    return const Column(
      children: [
        Text(
          'Kilidi açmak için bir jeton paketi seçin',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 15,
          ),
        ),
        SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: _PackageItem(
                discount: '+10%',
                originalPrice: '200',
                discountedPrice: '330',
                price: '99,99',
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: _PackageItem(
                discount: '+70%',
                originalPrice: '2.000',
                discountedPrice: '3.375',
                price: '799,99',
                isFeatured: true,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: _PackageItem(
                discount: '+35%',
                originalPrice: '1.000',
                discountedPrice: '1.350',
                price: '399,99',
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSeeAllButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFE50914),
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: const Text(
          'Tüm Jetonları Gör',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}

class _BonusItem extends StatelessWidget {
  final String iconPath;
  final String label;
  
  const _BonusItem({
    required this.iconPath,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 56,
          width: 56,
          decoration: BoxDecoration(
            color: const Color(0xFF6F060B),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                offset: const Offset(-1, -1),
                blurRadius: 7,
                color: Colors.white.withValues(alpha: 0.2),
              ),
              BoxShadow(
                offset: const Offset(1, 1),
                blurRadius: 7,
                color: Colors.black.withValues(alpha: 0.3),
              ),
            ],
          ),
          child: Image.asset(
            iconPath,
            width: 24,
            height: 24,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}

class _PackageItem extends StatelessWidget {
  final String discount;
  final String originalPrice;
  final String discountedPrice;
  final String price;
  final bool isFeatured;

  const _PackageItem({
    required this.discount,
    required this.originalPrice,
    required this.discountedPrice,
    required this.price,
    this.isFeatured = false,
  });

  @override
  Widget build(BuildContext context) {
    final badge = Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: isFeatured ? const Color(0xFF5949E6) : const Color(0xFF6F060B),
        borderRadius: BorderRadius.circular(18.5),
        boxShadow: [
          BoxShadow(
            offset: const Offset(-1, -1),
            blurRadius: 5,
            color: Colors.white.withValues(alpha: 0.2),
          ),
          BoxShadow(
            offset: const Offset(1, 1),
            blurRadius: 5,
            color: Colors.black.withValues(alpha: 0.3),
          ),
        ],
      ),
      child: Text(
        discount,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
      ),
    );

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        Container(
          height: 215,
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            gradient: RadialGradient(
              center: Alignment.topLeft,
              radius: 2.2,
              colors: [
                isFeatured ? const Color(0xFF5949E6) : const Color(0xFF6F060B),
                const Color(0xFFE50914),
              ],
            ),
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                offset: const Offset(-1, -1),
                blurRadius: 5,
                color: Colors.white.withValues(alpha: 0.2),
              ),
              BoxShadow(
                offset: const Offset(1, 1),
                blurRadius: 5,
                color: Colors.black.withValues(alpha: 0.3),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Opacity(opacity: 0.0, child: badge),
              Column(
                children: [
                  Text(
                    originalPrice,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  Text(
                    discountedPrice,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                      height: 0.7,
                    ),
                  ),
                  const Text(
                    'Jeton',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Divider(
                    color: Colors.white.withValues(alpha: 0.2),
                    indent: 10,
                    endIndent: 10,
                  ),
                  const SizedBox(height: 4),
                  RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: '₺',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        TextSpan(
                          text: price,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Text(
                    'Başına haftalık',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(top: -11, child: badge),
      ],
    );
  }
}
