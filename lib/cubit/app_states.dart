abstract class AppStates {}

class InitialState extends AppStates {}

class GetEventsLoadingState extends AppStates {}

class GetEventsSuccessState extends AppStates {}

class GetEventsErrorState extends AppStates {
  String error;

  GetEventsErrorState(this.error);
}
