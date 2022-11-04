import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meet_n_train/cubit/app_states.dart';

import '../api/repository.dart';
import '../models/event_model.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  final List<EventsModel> _eventsList = [];

  List<EventsModel> _events = [];
  List<EventsModel> get eventsList => _eventsList;

  bool isLastPage = false;
  int currentPage = 1;
  bool isLoading = false;

  Future<void> getEvents() async {
    isLoading = true;
    emit(GetEventsLoadingState());
    try {
      if (!isLastPage) {
        _events = await Repo.getEventsModel(currentPage) ?? [];

        _events.isNotEmpty
            ? {_eventsList.addAll(_events), _events = []}
            : isLastPage = true;
      }
      isLoading = false;
      emit(GetEventsSuccessState());
      currentPage += 1;
    } catch (error) {
      emit(GetEventsErrorState(error.toString()));
    }
  }

  void refreshData() {
    isLoading = false;
    isLastPage = false;
    currentPage = 1;
    _events.clear();

    emit(RefreshDataSuccessfully());
  }
}
