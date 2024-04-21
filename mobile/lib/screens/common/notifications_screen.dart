import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:logitech/config/constants.dart';
import 'package:logitech/models/notification.dart';
import 'package:logitech/router/routes.dart';
import 'package:logitech/state/global_state_provider.dart';
import 'package:logitech/state/notification/notifications_provider.dart';
import 'package:logitech/theme/theme.dart';
import 'package:moment_dart/moment_dart.dart';
import 'package:riverpod_infinite_scroll/riverpod_infinite_scroll.dart';
import 'package:visibility_detector/visibility_detector.dart';

class NotificationsScreen extends ConsumerStatefulWidget {
  const NotificationsScreen({super.key});

  @override
  ConsumerState<NotificationsScreen> createState() =>
      _NotificationsScreenState();
}

class _NotificationsScreenState extends ConsumerState<NotificationsScreen> {
  Widget buildInfoType(GetNotificationsResponseData data) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return InkWell(
      onTap: () {
        if (data.data?.user != null) {
          // For users seeing a driver profile
          context.push(Routes.driverProfilePath(data.data?.user?.id ?? ''));
        } else if (data.data?.order != null) {
          // For drivers accepting a order
          context
              .push(Routes.orderAcceptDetailPath(data.data?.order?.id ?? ''));
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: defaultPagePadding,
          vertical: 4.0,
        ),
        child: Row(
          children: [
            Visibility(
              visible: data.data?.user != null,
              child: CircleAvatar(
                radius: 24.0,
                child: ClipOval(
                  child: CachedNetworkImage(
                    imageUrl: '$apiUrl/avatar/${data.data?.user?.avatar}',
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 1.5,
                        child: Text(
                          data.content,
                          style: textTheme.bodyMedium,
                          maxLines: 5,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        data.createdAt.toMoment().fromNow(
                              form: Abbreviation.full,
                              dropPrefixOrSuffix: true,
                            ),
                        style: textTheme.labelMedium,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildNotificationItem(GetNotificationsResponseData data) {
    switch (data.type) {
      case NotificationType.info:
        return buildInfoType(data);
      default:
        throw Exception(
          'NotifcationsScreen: invalid notification type ${data.type}',
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const Key('NotificationsScreen'),
      onVisibilityChanged: (visibilityInfo) {
        var visiblePercentage = visibilityInfo.visibleFraction * 100;

        if (visiblePercentage == 100 && mounted) {
          ref.read(globalStateProvider.notifier).readNotifications();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Notifications'),
          automaticallyImplyLeading: false,
        ),
        body: RiverPagedBuilder.autoDispose(
          firstPageKey: 1,
          limit: 20,
          pullToRefresh: true,
          provider: notificationsProvider,
          itemBuilder: (context, item, index) => buildNotificationItem(item),
          noItemsFoundIndicatorBuilder: (context, controller) {
            return const Center(child: Text('No Notifications'));
          },
          pagedBuilder: (controller, builder) => PagedListView.separated(
            pagingController: controller,
            builderDelegate: builder,
            separatorBuilder: (context, index) => const Divider(),
          ),
        ),
      ),
    );
  }
}
