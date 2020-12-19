
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:sixth_soloution_test/features/venues/data/models/list_model.dart';
import 'package:sixth_soloution_test/features/venues/domain/entities/venue.dart';
import '../../../../core/util/constants.dart';
import '../../../../features/venues/data/models/detail_model.dart';
import '../../../../core/error/exceptions.dart';

abstract class VenueRemoteDataSource {
  /// Calls the https://api.foursquare.com/v2/venues/explore endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<Venue>> getVenuesList(
      int limit, double lat, double lng, String query);

  /// Calls the https://api.foursquare.com/v2/venues/{id} endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<Venue> getVenueDetail(String id);
}

class VenueRemoteDataSourceImpl implements VenueRemoteDataSource {
  final http.Client client;

  VenueRemoteDataSourceImpl({@required this.client});

  static BaseOptions options = new BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 30000,
      receiveTimeout: 30000,
      responseType: ResponseType.plain);

  final Dio _dio = Dio(options);

  @override
  Future<List<Venue>> getVenuesList(
      int limit, double lat, double lng, String query) async {
    final response = await _dio.get("/explore", queryParameters: {
      "client_id": clientId,
      "client_secret": clientSecret,
      "v": version,
      "ll": "$lat,$lng",
      "query": query,
      "limit": limit,
    });

    if (response.statusCode == 200) {
      List<VenueListModel> list = [];
      try {
        var result = listModelFromJson(response.data.toString());
        for (var element in result.response.groups[0].items) {
          list.add(element.venue);
        }
        return list;
      } catch (error) {
        throw JsonParseException();
      }
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Venue> getVenueDetail(String id) async {
    final response = await _dio.get("$id", queryParameters: {
      "client_id": clientId,
      "client_secret": clientSecret,
      "v": version,
    });

    if (response.statusCode == 200) {
      try {
        var result = detailModelFromJson(response.data.toString());
        return result.response.venue;
      } catch (error) {
        throw JsonParseException();
      }
    } else {
      throw ServerException();
    }
  }
}
