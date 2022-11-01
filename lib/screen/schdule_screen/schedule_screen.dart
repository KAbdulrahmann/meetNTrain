import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meet_n_train/cubit/app_cubit.dart';
import 'package:meet_n_train/cubit/app_states.dart';
import 'package:meet_n_train/shared/colors.dart';
import 'features/custom_app_bar.dart';
import 'features/custom_events_widget.dart';
import 'features/custom_today_calendar_widget.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  @override
  void initState() {
    super.initState();
    AppCubit.get(context).getEvents();

    _scrollController = ScrollController(
      keepScrollOffset: false,
    )..addListener(scrollListner);
  }

  late ScrollController _scrollController;

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  String message = 'aaa';

  void scrollListner() {
    if (AppCubit.get(context).isLoading) return;
    if (_scrollController.offset ==
        _scrollController.position.maxScrollExtent) {
      AppCubit.get(context).getEvents();
    }
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
                  : Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 21.0.w,
                      ),
                      child: Column(
                        children: [
                          const CustomAppBar(),
                          SizedBox(
                            height: 10.h,
                          ),
                          Expanded(
                            child: Scrollbar(
                              controller: _scrollController,
                              radius: Radius.circular(10.r),
                              interactive: true,
                              thickness: 10,
                              child: ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  controller: _scrollController,
                                  // check if we want to show circular indecator if data is loading or not
                                  itemCount: cubit.eventsList.length + 2,
                                  itemBuilder: (context, index) {
                                    return index == 0
                                        // -------------- [ for Today Date ] --------------
                                        ? const CustomTodayCalendarWidget()
                                        :
                                        // -------------- [for coming Dates and Events] --------------
                                        index == cubit.eventsList.length + 1
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
                                                index: index - 1,
                                              );
                                  }),
                            ),
                          ),
                        ],
                      ),
                    ));
        });
  }
}
