import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:getx_prep/counter_increment/counter_controller.dart';

class CounterIncrementScr1 extends StatelessWidget {
  const CounterIncrementScr1({super.key});

  @override
  Widget build(BuildContext context) {
    final CounterController counterController = Get.put(CounterController());
    final scheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
        actions: [
          IconButton(
            tooltip: 'Screen 2',
            icon: const Icon(Icons.navigate_next),
            onPressed: () => Get.to(() => const CounterIncrementScr2()),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Card(
                margin: const EdgeInsets.symmetric(horizontal: 40),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 40, horizontal: 32),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Count',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(color: scheme.onSurfaceVariant),
                      ),
                      const SizedBox(height: 12),
                      Obx(() => Text(
                            counterController.counter.value.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge
                                ?.copyWith(
                                  color: scheme.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                          )),
                      const SizedBox(height: 8),
                      Text(
                        'Screen 1',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: scheme.outline),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 40, left: 32, right: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _CounterButton(
                  icon: Icons.refresh,
                  label: 'Reset',
                  color: scheme.error,
                  onTap: counterController.counterReset,
                ),
                _CounterButton(
                  icon: Icons.remove,
                  label: 'Minus',
                  color: scheme.tertiary,
                  onTap: counterController.counterDec,
                ),
                _CounterButton(
                  icon: Icons.add,
                  label: 'Plus',
                  color: scheme.primary,
                  onTap: counterController.counterInc,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CounterIncrementScr2 extends StatelessWidget {
  const CounterIncrementScr2({super.key});

  @override
  Widget build(BuildContext context) {
    final CounterController counterController = Get.put(CounterController());
    final scheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Counter')),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Card(
                margin: const EdgeInsets.symmetric(horizontal: 40),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 40, horizontal: 32),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Count',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(color: scheme.onSurfaceVariant),
                      ),
                      const SizedBox(height: 12),
                      Obx(() => Text(
                            counterController.counter.value.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge
                                ?.copyWith(
                                  color: scheme.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                          )),
                      const SizedBox(height: 8),
                      Text(
                        'Screen 2',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: scheme.outline),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 40, left: 32, right: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _CounterButton(
                  icon: Icons.refresh,
                  label: 'Reset',
                  color: scheme.error,
                  onTap: counterController.counterReset,
                ),
                _CounterButton(
                  icon: Icons.remove,
                  label: 'Minus',
                  color: scheme.tertiary,
                  onTap: counterController.counterDec,
                ),
                _CounterButton(
                  icon: Icons.add,
                  label: 'Plus',
                  color: scheme.primary,
                  onTap: counterController.counterInc,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CounterButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _CounterButton({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FloatingActionButton(
          heroTag: label,
          backgroundColor: color,
          foregroundColor: Colors.white,
          onPressed: onTap,
          child: Icon(icon),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: Theme.of(context)
              .textTheme
              .labelSmall
              ?.copyWith(color: color, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}