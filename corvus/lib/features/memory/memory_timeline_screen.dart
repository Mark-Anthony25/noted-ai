import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:corvus/core/constants/spacing.dart';
import 'package:corvus/core/theme/context_colors.dart';
import 'package:corvus/core/constants/placeholder_data.dart';
import 'package:corvus/core/theme/text_styles.dart';
import 'package:corvus/shared/widgets/memory_card.dart';
import 'package:intl/intl.dart';

class MemoryTimelineScreen extends StatelessWidget {
  const MemoryTimelineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final memories = PlaceholderData.memories;

    return Scaffold(
      appBar: AppBar(title: const Text('Memory Timeline')),
      body: ListView.builder(
        padding: const EdgeInsets.fromLTRB(Spacing.lg, Spacing.sm, Spacing.lg, 100),
        itemCount: memories.length + memories.length,
        itemBuilder: (context, index) {
          if (index.isEven) {
            final memoryIndex = index ~/ 2;
            if (memoryIndex >= memories.length) return const SizedBox();
            final memory = memories[memoryIndex];
            final showDate = memoryIndex == 0 ||
                memories[memoryIndex].timestamp.day != memories[memoryIndex - 1].timestamp.day;
            if (!showDate) return const SizedBox.shrink();
            return Padding(
              padding: const EdgeInsets.only(bottom: Spacing.sm),
              child: Row(
                children: [
                  Text(DateFormat('MMMM d, yyyy').format(memory.timestamp),
                      style: AppTextStyles.titleMedium.copyWith(color: context.cp.primary)),
                  const SizedBox(width: Spacing.sm),
                  Expanded(child: Container(height: 1, color: context.cp.divider)),
                ],
              ),
            );
          }
          final memoryIndex = index ~/ 2;
          final memory = memories[memoryIndex];
          if (memoryIndex >= memories.length) return const SizedBox();
          return Padding(
            padding: const EdgeInsets.only(bottom: Spacing.sm),
            child: MemoryCard(memory: memory, onTap: () => context.push('/memory/${memory.id}')),
          );
        },
      ),
    );
  }
}
