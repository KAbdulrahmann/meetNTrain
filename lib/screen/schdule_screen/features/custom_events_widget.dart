import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:meet_n_train/cubit/app_cubit.dart';
import '../../../cubit/app_states.dart';
import '../../../models/event_model.dart';
import '../../../shared/colors.dart';
import '../../../shared/data.dart';
import '../../../shared/font_style.dart';
import 'joined_users_widget.dart';

class CustomEventsWidget extends StatefulWidget {
  const CustomEventsWidget({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  State<CustomEventsWidget> createState() => _CustomEventsWidgetState();
}

class _CustomEventsWidgetState extends State<CustomEventsWidget> {
  @override
  Widget build(BuildContext context) {
    AppCubit cubit = AppCubit.get(context);
    EventsModel event = cubit.eventsList[widget.index];
    String dayName = (DateFormat('EEE').format(event.date!));
    String dayNumber = (DateFormat('d').format(event.date!));
    String eventDate = DateFormat('EEEE, d MMM y').add_jm().format(event.date!);
    String finishDate =
        event.finishDate!.difference(DateTime.now()).inDays.toString();
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Row(
          children: [
            SizedBox(
              height: 340.h,
              width: 50.w,
              child: Stack(
                children: [
                  // -------------------------------------------- for vertical line
                  Positioned(
                    left: 18.w,
                    bottom: 0,
                    top: 0.h,
                    child: Container(
                      width: 1.w,
                      color: Colors.black,
                    ),
                  ),
                  // -------------------------------------------- for date container
                  Positioned(
                    left: 0.w,
                    top: 21.h,
                    child: Container(
                      width: 36.w,
                      height: 72.w,
                      decoration: BoxDecoration(
                          color: mainColor,
                          borderRadius: BorderRadius.circular(10.r)),
                      child: Center(
                        child: Text.rich(
                          TextSpan(
                            style: blackTextStyle.copyWith(
                              fontSize: 13.0.sp,
                              color: Colors.white,
                            ),
                            children: [
                              TextSpan(
                                text: '$dayNumber \n',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              TextSpan(
                                text: dayName,
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 11.0.sp,
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            // ----------------------------------- for events
            Expanded(
              child: SizedBox(
                width: 280.0.w,
                height: 320.0.h,
                child: Container(
                  width: 280.0.w,
                  height: 281.0.h,
                  margin: EdgeInsets.only(right: 10.w, bottom: 10.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.21),
                        offset: const Offset(0, 2.0),
                        blurRadius: 10.0,
                      ),
                    ],
                  ),
                  //--------------------------------------  content inside event container
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 14.0.w,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // image
                        Container(
                          width: 252.0.w,
                          height: 150.0.h,
                          margin: EdgeInsets.only(top: 5.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(13.0.r),
                            image: DecorationImage(
                              image: NetworkImage(Shared.imageLink(
                                  imageKey: event.featuredImage!,
                                  width: 252.w,
                                  height: 150.0.h)),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Stack(
                            children: [
                              //  -------------------------------  interest container
                              Positioned(
                                left: 11.w,
                                top: 13.h,
                                child: Container(
                                  width: 94.0.w,
                                  height: 31.0.h,
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 5.w),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(13.0.r),
                                    color: interestContainerColor
                                        .withOpacity(0.70),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 20.0.w,
                                        height: 20.0.h,
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 3.w),
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage(
                                                Shared.imageLink(
                                                    imageKey: event.tag!.icon!,
                                                    width: 252.w,
                                                    height: 130.0.h)),
                                            fit: BoxFit.cover,
                                          ),
                                          shape: BoxShape.circle,
                                          color: Colors.transparent,
                                        ),
                                      ),
                                      Text(
                                        event.tag!.title ?? '',
                                        style: blackTextStyle,
                                        textAlign: TextAlign.center,
                                        softWrap: true,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              // -----------------------------------   spots left container
                              Positioned(
                                left: 11.w,
                                bottom: 13.h,
                                child: Container(
                                  width: 77.0.w,
                                  height: 24.0.h,
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 3.w),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: Colors.white.withOpacity(0.70),
                                  ),
                                  child: Center(
                                    child: FittedBox(
                                      child: Text(
                                        event.spots == 0
                                            ? 'Unlimited Spots'
                                            : '${event.spots!} Spots left',
                                        style: mainColorTextStyle,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        // -------------------------- Event Info
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 120.h,
                              width: 170.w,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    height: 3.h,
                                  ),
                                  Text(
                                    eventDate,
                                    style: blackWithHalfOpacityTextStyle,
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    event.title ?? '',
                                    style: blackTextStyle.copyWith(
                                        fontSize: 16.sp),
                                    textAlign: TextAlign.center,
                                    softWrap: true,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    semanticsLabel: '',
                                    textScaleFactor: 0.9,
                                  ),
                                  Text(
                                    event.placeName ?? '',
                                    style: blackWithHalfOpacityTextStyle,
                                    maxLines: 2,
                                    textAlign: TextAlign.center,
                                    softWrap: true,
                                    overflow: TextOverflow.ellipsis,
                                  ),

                                  Text(
                                    '$finishDate Days Left',
                                    style: blackTextStyle.copyWith(
                                      color: mainColor.withOpacity(0.5),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),

                                  // ------------------------ joined users Icons ------------------
                                  event.users!.isEmpty
                                      ? Container()
                                      : SizedBox(
                                          width: 34.0.w,
                                          height: 25.0.h,
                                          child: Stack(
                                            children: <Widget>[
                                              JoinedUsersContainer(
                                                event: event,
                                                index: 0,
                                              ),
                                              Positioned(
                                                right: 0,
                                                child: JoinedUsersContainer(
                                                  event: event,
                                                  index: 1,
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                ],
                              ),
                            ),
                            // --------------------- payment and price -----------------------
                            SizedBox(
                              height: 120.h,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.monetization_on_outlined,
                                        color: mainColor,
                                        size: 20.sp,
                                      ),
                                      Icon(
                                        Icons.payment,
                                        size: 20.sp,
                                        color: mainColor,
                                      ),
                                      Icon(
                                        Icons.wallet_membership,
                                        color: mainColor,
                                        size: 20.sp,
                                      )
                                    ],
                                  ),
                                  Text(
                                    event.price == 0
                                        ? 'Free'
                                        : 'AED ${event.price?.toStringAsFixed(1)}',
                                    style: mainColorTextStyle.copyWith(
                                        fontSize: 15.sp),
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
