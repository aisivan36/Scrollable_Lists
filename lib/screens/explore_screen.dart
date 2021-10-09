import 'package:flutter/material.dart';
import '../components/components.dart';
import '../api/mock_fooderlich_service.dart';
import '../models/explore_data.dart';

class ExploreScreen extends StatelessWidget {
  final mockService = MockFooderlichService();

  ExploreScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      /// The [FutureBuilder] takes in a [Future] as a parameter.
      ///  [getExploreData()]
      /// creates a future that will, in turn, return an [ExploreData] instance.
      ///  That instance will contain two lists, todayRecipes and friendPosts.
      future: mockService.getExploreData(),

      /// Within builder, you use snapshot to check the current state
      ///  of the Future.
      builder: (context, AsyncSnapshot<ExploreData> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return ListView(
            scrollDirection: Axis.vertical,
            children: [
              /// [TodayRecipeListView] marks as a null with data? to ensures
              /// when there is no data it would be shown the default value of
              /// an empty list with ?? [], to avoid runtime error.
              TodayRecipeListView(recipes: snapshot.data?.todayRecipes ?? []),
              const SizedBox(height: 16),
              //
              FrienPostListView(friendPosts: snapshot.data?.friendPosts ?? []),
            ],
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
