import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_study_app/data/domain/profile.dart';
import 'package:share_study_app/data/repository/di/repository_providers.dart';
import 'package:share_study_app/ui/state/is_following_state.dart';
import 'package:share_study_app/ui/util/limit_text_ten_chars.dart';

class FollowItem extends HookConsumerWidget {
  const FollowItem({super.key, required this.profile, required this.onPressed});
  final Profile profile;
  final Function() onPressed;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => onPressed(),
      child: Padding(
        padding: const EdgeInsets.only(top: 4),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: profile.imageUrl != null
                    ? CircleAvatar(
                        backgroundImage: NetworkImage(profile.imageUrl!),
                        //サイズ
                        radius: 20,
                      )
                    : Icon(
                        Icons.person_outline_outlined,
                        size: 40,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          limitTextTenChars(profile.nickname),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                          softWrap: false,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(width: 8),
                        ref
                                    .watch(userAuthRepositoryProvider)
                                    .getCurrentUser()!
                                    .id ==
                                profile.id
                            ? const SizedBox()
                            : ref
                                .watch(isFollowingStateProvider(profile.id))
                                .when(
                                  skipError: true,
                                  skipLoadingOnRefresh: true,
                                  skipLoadingOnReload: true,
                                  data: (isFollowing) => isFollowing
                                      ? ElevatedButton(
                                          onPressed: () async {
                                            await ref
                                                .watch(
                                                    profileRepositoryProvider)
                                                .unfollow(profile.id)
                                                .then((value) => ref.refresh(
                                                    isFollowingStateProvider(
                                                        profile.id)));
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Theme.of(context)
                                                .colorScheme
                                                .inversePrimary,
                                            elevation: 4,
                                          ),
                                          child: Text(
                                            'フォロー中',
                                            style: TextStyle(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onBackground,
                                            ),
                                          ),
                                        )
                                      : ElevatedButton(
                                          onPressed: () async {
                                            await ref
                                                .watch(
                                                    profileRepositoryProvider)
                                                .follow(profile.id)
                                                .then((value) => ref.refresh(
                                                    isFollowingStateProvider(
                                                        profile.id)));
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Theme.of(context)
                                                .colorScheme
                                                .onSurface,
                                          ),
                                          child: Text(
                                            'フォローする',
                                            style: TextStyle(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .background,
                                            ),
                                          ),
                                        ),
                                  error: (e, s) => const SizedBox(),
                                  loading: () => const SizedBox(),
                                ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      profile.bio ?? '',
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
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
