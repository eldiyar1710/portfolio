import 'package:flutter/material.dart';
import 'package:flutter_portfolio/view/projects/components/project_deatail.dart';
import '../../../model/project_model.dart';
import '../../../res/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../view model/riverpod/projects_provider.dart';
import 'image_viewer.dart';
import '../../common/glass_container.dart';

class ProjectStack extends ConsumerWidget {
  const ProjectStack({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hovers = ref.watch(hoversProvider);
    final hovered = index < hovers.length && hovers[index];
    return InkWell(
          onHover: (value) {
            ref.read(hoversProvider.notifier).setHover(index, value);
          },
          onTap: () {
            ImageViewer(context, projectList[index].image);
          },
          borderRadius: BorderRadius.circular(30),
          child: AnimatedScale(
            scale: hovered ? 1.02 : 1.0,
            duration: const Duration(milliseconds: 200),
            child: GlassContainer(
              padding: const EdgeInsets.only(left: defaultPadding, right: defaultPadding, top: defaultPadding),
              borderRadius: 30,
              child: ProjectDetail(index: index),
            ),
          ),
        );
  }
}
