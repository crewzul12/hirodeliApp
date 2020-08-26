import 'package:HiroDeli/models/place.dart';
import 'package:http/http.dart' as http; // Package to use all http methods such as get and post method
import 'dart:convert' as convert; // Package to use jsonDecode

class PlacesService {
  final key = 'AIzaSyCCO-E6cMBlhMEtKBoCYzDKcmsP42OxUxw'; // API key for Google Cloud Platform service

  // Next page token for next page of list of places
  String pageToken =
      'CrQCIQEAAL2El1amGzJ8n8RUdZZOME9-foXjPpoIRsrKEbSuZCDpSOiAhyNJXM7tgzky-kbPxch8AA_B8-bOwlZqU2vtr4jJGSRHby1MGZMHYbwk1ERRxwGQ_QuxP8yACFepLv1WW2awltpseZFWDnDca3wmplF34vtiaHNkiAaSX3dCPg9gfq3yArcWhk1SDdCjz92UviXAZAu2nQZ92bXLxEM823zEUUuWxBv8J189fkuSGInrFQu7w1N4Xc0HI3pFPdQN6XEzlxObMhPMoZG-FbWYm2wQaLwfWt_7VLSoPVUMGDxa-1qHdaGEGEChciseTyzhL11JM0T5z6tO9N0eKYQOLcXypIYH2FlFfnze9fLjUUogQhEwOwgL9ke2znlG5vUE-6bVYglykHwMykJBxuYpXD0SEJ6_b2Hky2ZzTfoc1ToZk3MaFOnl8Etd685rgxXdl4SYum8_x_n7';

  // Future that return list of places based on latitude and longitude
  Future<List<Place>> getPlaces(double lat, double lng) async {
    var response = await http.get(
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$lat,$lng&type=restaurant&rankby=distance&key=$key&pagetoken=$pageToken'); // Get request from google places API by specify output and parameters
    var json = convert.jsonDecode(response.body); // convert JSON object from body of response to Dart object, so that we can use
    var jsonResults = json['results'] as List; // initialize object from key named "results" that retrieve from google maps endpoint response in body as a List
    return jsonResults.map((place) => Place.fromJson(place)).toList(); // Return a List that contain list of places nearby from mapping jsonResults list
  }
}
