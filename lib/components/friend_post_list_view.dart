import 'package:flutter/material.dart';

import '../models/models.dart';
import 'components.dart';

class FrienPostListView extends StatelessWidget {
  final List<Post> friendPosts;

  const FrienPostListView({
    Key? key,
    required this.friendPosts,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Social Chefs', style: Theme.of(context).textTheme.headline1),
          const SizedBox(height: 16),
          ListView.separated(
              // It's good idea to set primary to false,
              // because we nesting listview
              primary: false,
              physics: const NeverScrollableScrollPhysics(),
              // shrinkWrap to create a Fixed-Length scrollable list of items.
              // note that if this were false,
              // it gives an unbounded height error.
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                final post = friendPosts[index];
                return FriendPostTile(post: post);
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 16);
              },
              itemCount: friendPosts.length),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
