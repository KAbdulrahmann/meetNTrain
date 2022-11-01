import '../models/event_model.dart';
import 'package:http/http.dart' as http;
import '../shared/data.dart';

class Repo {
  // to get Events From Api
  static Future<List<EventsModel>?>? getEventsModel(int page) async {
    final List<EventsModel> eventsModel;

    var headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'authorization': Shared.token
    };
    var request = http.Request('GET', Uri.parse(Shared.apiLink(page: page)));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      eventsModel = eventsModelFromJson(await response.stream.bytesToString());
      return eventsModel;
    } else {
      throw Exception('Failed to load events');
    }
  }
}
