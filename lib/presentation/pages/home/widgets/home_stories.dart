import 'package:avo/presentation/const/app_dimens.dart';
import 'package:avo/presentation/pages/home/core/data/story_data_draft.dart';
import 'package:avo/presentation/widgets/image/cashed_image.dart';
import 'package:avo/presentation/widgets/image/shimmer/shimmer_story_card.dart';
import 'package:flutter/material.dart';

class HomeStories extends StatelessWidget {
  const HomeStories({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppDimens.paddingLarge),
      child: FutureBuilder(
        future: Future.delayed(const Duration(seconds: 2)),
        builder: (context, asyncSnapshot) {
          if (asyncSnapshot.connectionState == ConnectionState.waiting) {
            return const StoryLoading();
          }
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimens.paddingHorizontal,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                spacing: 16,
                children: List.generate(StoryDataDraft.storyDataDraft.length, (
                  index,
                ) {
                  final story = StoryDataDraft.storyDataDraft[index];
                  return GestureDetector(
                    onTap: () {
                      // showModalBottomSheet(
                      //   useRootNavigator: true,
                      //   isScrollControlled: true,
                      //   context: context,
                      //   useSafeArea: true,
                      //   builder: (context) => StoryPage(
                      //     // stories: stories,
                      //   ),
                      // );
                    },
                    child: Container(
                      width: 112,
                      height: 124,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: theme.disabledColor.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: theme.primaryColor,
                            width: 2,
                          ),
                        ),
                        child: CashedImages(
                          imageUrl: story.image ?? "",
                          imageRadius: 16,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          );
        },
      ),
    );
  }
}
