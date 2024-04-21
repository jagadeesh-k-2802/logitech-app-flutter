import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logitech/config/constants.dart';
import 'package:logitech/models/user.dart';
import 'package:logitech/state/profile/driver_profile_provider.dart';
import 'package:logitech/theme/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class DriverProfileScreen extends ConsumerStatefulWidget {
  final String profileId;
  const DriverProfileScreen({super.key, required this.profileId});

  @override
  ConsumerState<DriverProfileScreen> createState() =>
      _DriverProfileScreenState();
}

class _DriverProfileScreenState extends ConsumerState<DriverProfileScreen> {
  @override
  void initState() {
    super.initState();
  }

  Widget buildReviewItem(ProfileReviewData? reviewData) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return ListTile(
      title: Text('${reviewData?.createdBy.name} Says'),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(reviewData?.comment ?? ''),
          const SizedBox(height: 8.0),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                reviewData?.rating.toString() ?? '',
                style: textTheme.bodyLarge,
              ),
              const SizedBox(width: 5.0),
              const Icon(Icons.star),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildBodyContent(GetProfileResponseData data) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 120,
              width: 120,
              child: CircleAvatar(
                radius: 100,
                child: ClipOval(
                  child: Image.network('$apiUrl/avatar/${data.avatar}'),
                ),
              ),
            ),
            Text(
              data.name,
              style: textTheme.headlineLarge,
              maxLines: 2,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
        const SizedBox(height: 20.0),
        InkWell(
          onTap: () async {
            await launchUrl(Uri.parse('tel:${data.phone}'));
          },
          child: Card(
            margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
            child: ListTile(
              leading: const Icon(Icons.phone, color: primaryColor),
              title: Text(data.phone ?? ''),
            ),
          ),
        ),
        Card(
          margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
          child: ListTile(
            leading: const Icon(Icons.email, color: primaryColor),
            title: Text(data.email),
          ),
        ),
        Card(
          margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
          child: ListTile(
            leading: const Icon(Icons.local_shipping, color: primaryColor),
            title: Text('Completed Orders: ${data.completedOrders}'),
          ),
        ),
        Card(
          margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
          child: ListTile(
            leading: const Icon(Icons.star, color: primaryColor),
            title: Text('Average Rating: ${data.averageRating}'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 32.0, bottom: 16.0),
          child: Row(
            children: [
              Text(
                'User Reviews',
                style: textTheme.titleLarge,
              ),
              const SizedBox(width: 8.0),
              const Icon(Icons.reviews_outlined),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildBody(GetProfileResponseData data) {
    return RefreshIndicator(
      onRefresh: () async => ref.invalidate(
        driverProfileProvider(widget.profileId),
      ),
      child: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          const SliverAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: defaultPagePadding,
                  ),
                  child: buildBodyContent(data),
                ),
              ],
            ),
          ),
          SliverList.separated(
            itemCount: data.reviews.length,
            itemBuilder: (context, index) {
              return buildReviewItem(data.reviews[index]);
            },
            separatorBuilder: (context, index) {
              return const Divider();
            },
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(driverProfileProvider(widget.profileId));

    return Scaffold(
      body: SafeArea(
        child: provider.when(
          data: (data) => buildBody(data),
          error: (error, stackTrace) {
            return const Center(child: Text('Something went wrong'));
          },
          loading: () {
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
