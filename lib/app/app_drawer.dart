// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:logger/logger.dart';
// import 'package:share_study_app/ui/state/my_profile_state.dart';

// class AppDrawer extends HookConsumerWidget {
//   const AppDrawer({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final myProfileState = ref.watch(myProfileStateProvider).asData?.value;
//     return Drawer(
//       width: MediaQuery.of(context).size.width * 0.8,
//       child: ListView(
//         padding: EdgeInsets.zero,
//         children: [
//           DrawerHeader(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 myProfileState?.imageUrl != null
//                     ? CircleAvatar(
//                         radius: 60,
//                         backgroundImage:
//                             NetworkImage(myProfileState!.imageUrl!),
//                       )
//                     : Icon(
//                         Icons.account_circle_outlined,
//                         size: 60,
//                         color: Theme.of(context).colorScheme.onPrimaryContainer,
//                       ),
//                 Text(
//                   myProfileState?.nickname ?? '',
//                   style: TextStyle(
//                     color: Theme.of(context).colorScheme.onPrimaryContainer,
//                     fontSize: 20,
//                   ),
//                 ),
//                 const SizedBox(height: 4),
//                 myActivityState.when(
//                   data: (myActivity) {
//                     return Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Text.rich(
//                           TextSpan(
//                             children: [
//                               WidgetSpan(
//                                 child: Text(
//                                   myActivity.followCount.toString(),
//                                   style: TextStyle(
//                                     color: Theme.of(context)
//                                         .colorScheme
//                                         .onPrimaryContainer,
//                                     fontSize: 18,
//                                   ),
//                                 ),
//                                 alignment: PlaceholderAlignment.middle,
//                               ),
//                               WidgetSpan(
//                                 child: Text(
//                                   ' フォロー',
//                                   style: TextStyle(
//                                     color: Theme.of(context)
//                                         .colorScheme
//                                         .onPrimaryContainer,
//                                     fontSize: 12,
//                                   ),
//                                 ),
//                                 alignment: PlaceholderAlignment.middle,
//                               ),
//                               const WidgetSpan(child: SizedBox(width: 4)),
//                               WidgetSpan(
//                                 child: Text(
//                                   myActivity.followerCount.toString(),
//                                   style: TextStyle(
//                                     color: Theme.of(context)
//                                         .colorScheme
//                                         .onPrimaryContainer,
//                                     fontSize: 18,
//                                   ),
//                                 ),
//                                 alignment: PlaceholderAlignment.middle,
//                               ),
//                               const WidgetSpan(child: SizedBox(width: 4)),
//                               WidgetSpan(
//                                 child: Text(
//                                   'フォロワー',
//                                   style: TextStyle(
//                                     color: Theme.of(context)
//                                         .colorScheme
//                                         .onPrimaryContainer,
//                                     fontSize: 12,
//                                   ),
//                                 ),
//                                 alignment: PlaceholderAlignment.middle,
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     );
//                   },
//                   error: (error, stackTrace) {
//                     Logger().e({error, stackTrace});
//                     return const Text('エラーが発生しました');
//                   },
//                   loading: () {
//                     return const Text('読み込み中');
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
