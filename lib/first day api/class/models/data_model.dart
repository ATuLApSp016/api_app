import 'package:api_app/first%20day%20api/class/models/quote_model.dart';

class DataModel {
  List<QuoteModel>? quotes;
  int? total;
  int? skip;
  int? limit;

  DataModel({
    required this.quotes,
    required this.total,
    required this.skip,
    required this.limit,
  });

  ///map -> model
  factory DataModel.fromJson(Map<String, dynamic> json) {
    List<QuoteModel> mQuotes = [];

    for (Map<String, dynamic> eachQuote in json['quotes']) {
      QuoteModel model = QuoteModel.fromJson(eachQuote);
      mQuotes.add(model);
    }

    return DataModel(
      quotes: mQuotes,
      total: json['total'],
      skip: json['skip'],
      limit: json['limit'],
    );
  }
}
