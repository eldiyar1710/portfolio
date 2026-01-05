import 'package:flutter/material.dart';
import 'package:flutter_portfolio/view/projects/components/project_info.dart';
import '../../../model/project_model.dart';
import '../../../res/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../view model/riverpod/projects_provider.dart';
import '../../../view model/day_night_controller.dart';
import 'package:flutter/scheduler.dart';
import '../../../theme/gradients.dart';
class ProjectGrid extends ConsumerWidget {
  final int crossAxisCount;
  final double ratio;
  ProjectGrid({super.key, this.crossAxisCount = 3,  this.ratio=1.3});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      itemCount: projectList.length,
      gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount, childAspectRatio: ratio),
      itemBuilder: (context, index) {
        final mode = DayNightController.effectiveMode(SchedulerBinding.instance.platformDispatcher.platformBrightness);
        final hovers = ref.watch(hoversProvider);
        return AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            margin: const EdgeInsets.symmetric(
                vertical: defaultPadding, horizontal: defaultPadding),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: AppGradients.primary(mode),
                boxShadow:  [
                  BoxShadow(
                    color: Colors.pink,
                    offset: const Offset(-2, 0),
                    blurRadius: (index < hovers.length && hovers[index]) ? 20 : 10,
                  ),
                  BoxShadow(
                      color: Colors.blue,
                      offset: const Offset(2, 0),
                      blurRadius: (index < hovers.length && hovers[index]) ? 20 : 10,),
                ]),
            child: ProjectStack(index: index)
        );
      },
    );
  }
}
