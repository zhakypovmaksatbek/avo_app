import 'package:avo/presentation/const/app_dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_skeleton_ui/flutter_skeleton_ui.dart';

class ShimmerStoryCard extends StatefulWidget {
  const ShimmerStoryCard({super.key});

  @override
  State<ShimmerStoryCard> createState() => _ShimmerStoryCardState();
}

class _ShimmerStoryCardState extends State<ShimmerStoryCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 112,
      height: 124,
      child: SkeletonItem(
        child: SkeletonAvatar(
          style: SkeletonAvatarStyle(
            width: double.infinity,
            height: double.infinity,
            padding: EdgeInsets.zero,
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ),
    );
  }
}

class StoryLoading extends StatelessWidget {
  const StoryLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimens.paddingHorizontal,
      ),
      child: Row(
        spacing: 8,
        children: [for (var i = 0; i < 10; i++) ShimmerStoryCard()],
      ),
    );
  }
}
