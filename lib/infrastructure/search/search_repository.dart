import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/core/constants/api_constants.dart';
import '../../domain/core/constants/string_constants.dart';
import '../../domain/core/services/network_service/rest_service.dart';
import 'dtos/search results/search_results.dart';

class ISearchRepository {
  final String serverUrl;
  ISearchRepository({required this.serverUrl});

  Future<SearchResults> getSearchResults(String query) async {
    try {
      final url = '$serverUrl${SearchApiConstants.SEARCH}';
      String? token = await FirebaseAuth.instance.currentUser!.getIdToken(true);
      final response = await RESTService.performGETRequest(
          httpUrl: url, token: token!, isAuth: true, param: {'search': query});
      if (response.statusCode != 200) {
        throw ErrorConstants.unknownNetworkError;
      }
      final parsedBody = jsonDecode(response.body);
     // print(parsedBody['results']['events'][0]);
      if (parsedBody['results'] != null) {
        var results = parsedBody['results'];
        return SearchResults.fromJson(results);
      }
      return const SearchResults(pubs: [], events: [], artists: [], users: []);
    } catch (e) {
      print(e.toString());
      return const SearchResults(pubs: [], events: [], artists: [], users: []);
    }
  }
}
