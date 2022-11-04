import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meet_n_train/models/event_model.dart' as ev;

import '../../../shared/data.dart';

class JoinedUsersContainer extends StatelessWidget {
  const JoinedUsersContainer(
      {Key? key, required this.event, required this.index})
      : super(key: key);

  final ev.EventsModel event;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 21.0.w,
      height: 21.0.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13.0.r),
        border: Border.all(width: 1, color: Colors.white),
        image: DecorationImage(
          image: NetworkImage(
            Shared.imageLink(
                imageKey: event.users![index].profilePicture!,
                width: 21.0.w,
                height: 21.0.w),
          ),
          fit: BoxFit.cover,
          onError: (obj, trace) {},
        ),
      ),
    );
  }
}
