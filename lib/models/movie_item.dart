// To parse this JSON data, do
//
//     final movieItem = movieItemFromJson(jsonString);
import 'dart:convert';

MovieItem movieItemFromJson(String str) => MovieItem.fromJson(json.decode(str));

String movieItemToJson(MovieItem data) => json.encode(data.toJson());

class MovieItem {
  MovieItem({
    required this.backdropPath,
    required this.adult,
    required this.belongsToCollection,
    required this.budget,
    required this.genres,
    required this.homepage,
    required this.id,
    required this.imdbId,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.productionCompanies,
    required this.productionCountries,
    required this.releaseDate,
    required this.revenue,
    required this.runtime,
    required this.spokenLanguages,
    required this.status,
    required this.tagline,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  final bool adult;
  final String backdropPath;
  final dynamic belongsToCollection;
  final int budget;
  final List<Genre> genres;
  final String homepage;
  final int id;
  final String imdbId;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final dynamic posterPath;
  final List<ProductionCompany> productionCompanies;
  final List<ProductionCountry> productionCountries;
  final String releaseDate;
  final int revenue;
  final int runtime;
  final List<SpokenLanguage> spokenLanguages;
  final String status;
  final String tagline;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  factory MovieItem.fromJson(Map<String, dynamic> json) => MovieItem(
        adult: json["adult"] ?? false,
        backdropPath: json["backdrop_path"] ?? '',
        belongsToCollection: json["belongs_to_collection"],
        budget: json["budget"] ?? 0,
        genres: json["genres"] == null
            ? []
            : List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x))),
        homepage: json["homepage"] ?? '',
        id: json["id"] ?? -1,
        imdbId: json["imdb_id"] ?? '',
        originalLanguage: json["original_language"] ?? '',
        originalTitle: json["original_title"] ?? '',
        overview: json["overview"] ?? '',
        popularity: json["popularity"] ?? 0.0,
        posterPath: json["poster_path"],
        productionCompanies: json["production_companies"] == null
            ? []
            : List<ProductionCompany>.from(json["production_companies"]
                .map((x) => ProductionCompany.fromJson(x))),
        productionCountries: json["production_countries"] == null
            ? []
            : List<ProductionCountry>.from(json["production_countries"]
                .map((x) => ProductionCountry.fromJson(x))),
        releaseDate: json["release_date"] ?? '',
        revenue: json["revenue"] ?? -1,
        runtime: json["runtime"] ?? -1,
        spokenLanguages: json["spoken_languages"] == null
            ? []
            : List<SpokenLanguage>.from(json["spoken_languages"]
                .map((x) => SpokenLanguage.fromJson(x))),
        status: json["status"] ?? '',
        tagline: json["tagline"] ?? '',
        title: json["title"] ?? '',
        video: json["video"] ?? false,
        voteAverage: double.parse(json["vote_average"].toString()),
        voteCount: json["vote_count"] ?? -1,
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "belongs_to_collection": belongsToCollection,
        "budget": budget,
        "genres": genres,
        "homepage": homepage,
        "id": id,
        "imdb_id": imdbId,
        "original_language": originalLanguage,
        "original_title": originalTitle,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "production_companies": productionCompanies,
        "production_countries": productionCountries,
        "release_date": releaseDate == releaseDate,
        "revenue": revenue,
        "runtime": runtime,
        "spoken_languages": spokenLanguages,
        "status": status,
        "tagline": tagline,
        "title": title,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };
}

class Genre {
  Genre({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;

  factory Genre.fromJson(Map<String, dynamic> json) => Genre(
        id: json["id"] ?? -1,
        name: json["name"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class ProductionCompany {
  ProductionCompany({
    required this.id,
    required this.logoPath,
    required this.name,
    required this.originCountry,
  });

  final int id;
  final String logoPath;
  final String name;
  final String originCountry;

  factory ProductionCompany.fromJson(Map<String, dynamic> json) =>
      ProductionCompany(
        id: json["id"] ?? -1,
        logoPath: json["logo_path"] ?? '',
        name: json["name"] ?? '',
        originCountry: json["origin_country"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "logo_path": logoPath,
        "name": name,
        "origin_country": originCountry,
      };
}

class ProductionCountry {
  ProductionCountry({
    required this.iso31661,
    required this.name,
  });

  final String iso31661;
  final String name;

  factory ProductionCountry.fromJson(Map<String, dynamic> json) =>
      ProductionCountry(
        iso31661: json["iso_3166_1"] ?? '',
        name: json["name"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "iso_3166_1": iso31661,
        "name": name,
      };
}

class SpokenLanguage {
  SpokenLanguage({
    required this.iso6391,
    required this.name,
  });

  final String iso6391;
  final String name;

  factory SpokenLanguage.fromJson(Map<String, dynamic> json) => SpokenLanguage(
        iso6391: json["iso_639_1"] ?? '',
        name: json["name"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "iso_639_1": iso6391,
        "name": name,
      };
}
