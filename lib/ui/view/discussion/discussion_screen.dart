import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:share_study_app/data/domain/question.dart';

class DiscussionScreen extends StatefulHookConsumerWidget {
  const DiscussionScreen({super.key, required this.question});
  final Question question;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DiscussionScreenState();
}

class _DiscussionScreenState extends ConsumerState<DiscussionScreen> {
  @override
  Widget build(BuildContext context) {
    final quesiton = widget.question;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                quesiton.title,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 16),
              Card(
                color: Theme.of(context).colorScheme.secondaryContainer,
                elevation: 3,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: quesiton.questioner.imageUrl != null
                          ? CircleAvatar(
                              backgroundImage:
                                  NetworkImage(quesiton.questioner.imageUrl!),
                              radius: 40,
                            )
                          : Icon(
                              Icons.person_outline_outlined,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSecondaryContainer,
                              size: 40,
                            ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 8, right: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              quesiton.questioner.nickname,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color:
                                    Theme.of(context).colorScheme.onBackground,
                                letterSpacing: 2,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              quesiton.content,
                              style: TextStyle(
                                fontSize: 16,
                                color:
                                    Theme.of(context).colorScheme.onBackground,
                                letterSpacing: 2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
