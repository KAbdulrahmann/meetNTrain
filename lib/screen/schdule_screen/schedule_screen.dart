import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meet_n_train/cubit/app_cubit.dart';
import 'package:meet_n_train/cubit/app_states.dart';
import 'package:meet_n_train/shared/colors.dart';
import 'features/custom_app_bar.dart';
import 'features/custom_events_widget.dart';
import 'features/scroll_delegate.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  double indexOfScroll = 0;

  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    AppCubit.get(context).getEvents();

    _scrollController = ScrollController(
      keepScrollOffset: false,
    )..addListener(scrollListner);
  }

  void scrollListner() {
    if (AppCubit.get(context).isLoading) return;
    if (_scrollController.offset ==
        _scrollController.position.maxScrollExtent) {
      AppCubit.get(context).getEvents();
    }
    setState(() {
      // 340 is the height of event widget
      indexOfScroll = (_scrollController.position.pixels / 340.h);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AppCubit cubit = AppCubit.get(context);
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: state is GetEventsLoadingState
                ? const Center(
                    child: CircularProgressIndicator(
                      color: mainColor,
                    ),
                  )
                : RefreshIndicator(
                    color: mainColor,
                    onRefresh: () async {
                      cubit.refreshData();
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 21.0.w,
                      ),
                      child: Column(
                        children: [
                          const CustomAppBar(),
                          Flexible(
                            child: CustomScrollView(
                              controller: _scrollController,
                              physics: const BouncingScrollPhysics(),
                              slivers: [
                                SliverPersistentHeader(
                                  pinned: true,
                                  floating: true,
                                  delegate: Delegate(
                                    indexOfScroll > 0.15.h
                                        ? cubit
                                            .eventsList[indexOfScroll.toInt()]
                                            .date!
                                        : DateTime.now(),
                                  ),
                                ),
                                SliverList(
                                  delegate: SliverChildBuilderDelegate(
                                    (context, index) {
                                      return index == cubit.eventsList.length
                                          // check last index in [listView] to show [message] or [CircularIndecator]
                                          ? cubit.isLastPage
                                              ? SizedBox(
                                                  height: 30.h,
                                                  child: const Center(
                                                    child: Text(
                                                        'All Data Fetched'),
                                                  ),
                                                )
                                              : SizedBox(
                                                  height: 100.h,
                                                  child: const Center(
                                                    child:
                                                        CircularProgressIndicator(
                                                      color: mainColor,
                                                    ),
                                                  ),
                                                )
                                          : CustomEventsWidget(
                                              index: index,
                                            );
                                    },
                                    childCount: cubit.eventsList.length + 1,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
          );
        });
  }
}
