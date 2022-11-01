class Shared {
  static String token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOjgzNTcsImlzQWRtaW4iOmZhbHNlLCJpYXQiOjE2NjQ5NzU4OTN9.1msUlsgpO4dRbj55VhJsX0eyNDcLjsCiRfj26Z54zGE";

  static int userId = 8357;

  static String imageLink(
      {required String imageKey,
      required double width,
      required double height}) {
    return 'https://ik.imagekit.io/tnc8pizf9e/$imageKey?tr=w-$width,h-$height';
  }

  static String apiLink({
    required int page,
  }) {
    return 'http://test.meetntrain.com/v1/profile/events/upcoming/$userId/?page=$page&date_gte=${DateTime.now().toIso8601String()}';
  }
}
