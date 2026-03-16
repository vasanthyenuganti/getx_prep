import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:getx_prep/cart/add_to_cart_page.dart';
import 'package:getx_prep/color_shade/color_shade_page.dart';
import 'package:getx_prep/counter_increment/counter_increment_page.dart';
import 'package:getx_prep/image_genrator/image_generator_page.dart';
import 'package:getx_prep/image_picker/image_picker_page.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final List<_FeatureItem> _features = const [
    _FeatureItem(
      title: 'Counter',
      subtitle: 'Increment & decrement\nacross screens',
      icon: Icons.exposure,
      color: Color(0xFF1565C0),
      page: CounterIncrementScr1(),
    ),
    _FeatureItem(
      title: 'Color Shade',
      subtitle: 'Opacity & range\nsliders',
      icon: Icons.color_lens_outlined,
      color: Color(0xFF6A1B9A),
      page: ColorShadepage(),
    ),
    _FeatureItem(
      title: 'Favourites',
      subtitle: 'Add items to\nyour cart',
      icon: Icons.favorite_outline,
      color: Color(0xFFC62828),
      page: AddToCartPage(),
    ),
    _FeatureItem(
      title: 'Image Picker',
      subtitle: 'Pick from gallery\nor camera',
      icon: Icons.photo_library_outlined,
      color: Color(0xFF00695C),
      page: ImagePickerPage(),
    ),
    _FeatureItem(
      title: 'MAYA AI',
      subtitle: 'AI image\ngenerator',
      icon: Icons.auto_awesome,
      color: Color(0xFFE65100),
      page: ImageGeneratorPage(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 160,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const EdgeInsets.only(left: 20, bottom: 16),
              title: const Text(
                'GetX Prep',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      scheme.primary,
                      scheme.primaryContainer,
                    ],
                  ),
                ),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 24, top: 24),
                    child: Icon(
                      Icons.widgets_outlined,
                      size: 80,
                      color: scheme.onPrimary.withOpacity(0.2),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverToBoxAdapter(
              child: Text(
                'Features',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: scheme.onSurfaceVariant,
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) => _FeatureCard(item: _features[index]),
                childCount: _features.length,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 1.1,
              ),
            ),
          ),
          const SliverPadding(padding: EdgeInsets.only(bottom: 24)),
        ],
      ),
    );
  }
}

class _FeatureItem {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final Widget page;

  const _FeatureItem({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.page,
  });
}

class _FeatureCard extends StatelessWidget {
  final _FeatureItem item;
  const _FeatureCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => Get.to(() => item.page),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: item.color.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(item.icon, color: item.color, size: 26),
              ),
              const Spacer(),
              Text(
                item.title,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 2),
              Text(
                item.subtitle,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                      height: 1.3,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}