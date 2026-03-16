import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:getx_prep/color_shade/color_shade_controller.dart';

class ColorShadepage extends StatelessWidget {
  const ColorShadepage({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorShadeController ctrl = Get.put(ColorShadeController());
    final scheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Color Shade')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Opacity',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    _ColorBlock(ctrl: ctrl, color: Colors.red, label: 'Red'),
                    const SizedBox(height: 8),
                    _ColorBlock(
                        ctrl: ctrl, color: Colors.green, label: 'Green'),
                    const SizedBox(height: 8),
                    _ColorBlock(
                        ctrl: ctrl, color: Colors.amber, label: 'Amber'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Card(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Opacity',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        Obx(() => Text(
                              '${(ctrl.opacity.value * 100).toInt()}%',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(color: scheme.primary),
                            )),
                      ],
                    ),
                    Obx(() => Slider(
                          value: ctrl.opacity.value,
                          onChanged: ctrl.getUpdate,
                        )),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Range',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            Card(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Select Range',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        Obx(() => Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(
                                color: scheme.primaryContainer,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                '${ctrl.start.value.toInt()} – ${ctrl.end.value.toInt()}',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium
                                    ?.copyWith(
                                        color: scheme.onPrimaryContainer),
                              ),
                            )),
                      ],
                    ),
                    Obx(() => RangeSlider(
                          min: 1.0,
                          max: 100.0,
                          values: RangeValues(
                              ctrl.start.value, ctrl.end.value),
                          onChanged: ctrl.getRange,
                        )),
                    Obx(() => Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('${ctrl.start.value.toInt()}',
                                style: Theme.of(context).textTheme.bodySmall),
                            Text('${ctrl.end.value.toInt()}',
                                style: Theme.of(context).textTheme.bodySmall),
                          ],
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ColorBlock extends StatelessWidget {
  final ColorShadeController ctrl;
  final Color color;
  final String label;

  const _ColorBlock(
      {required this.ctrl, required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 52,
          child: Text(label,
              style: Theme.of(context).textTheme.bodySmall),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Obx(() => AnimatedContainer(
                  duration: const Duration(milliseconds: 150),
                  height: 48,
                  color: color.withOpacity(ctrl.opacity.value),
                )),
          ),
        ),
      ],
    );
  }
}