import '../../domain/entities/movie.dart';

class MovieModel {
  final String? id;
  final String? title;
  final String? year;
  final String? rated;
  final String? released;
  final String? runtime;
  final String? genre;
  final String? director;
  final String? writer;
  final String? actors;
  final String? plot;
  final String? language;
  final String? country;
  final String? awards;
  final String? posterUrl;
  final String? metascore;
  final String? imdbRating;
  final String? imdbVotes;
  final String? imdbID;
  final String? type;
  final List<String>? images;
  final bool? comingSoon;
  final bool? isFavorite;

  const MovieModel({
    this.id,
    this.title,
    this.year,
    this.rated,
    this.released,
    this.runtime,
    this.genre,
    this.director,
    this.writer,
    this.actors,
    this.plot,
    this.language,
    this.country,
    this.awards,
    this.posterUrl,
    this.metascore,
    this.imdbRating,
    this.imdbVotes,
    this.imdbID,
    this.type,
    this.images,
    this.comingSoon,
    this.isFavorite,
  });

  factory MovieModel.fromJson(Object? json) {
    if (json is! Map<String, dynamic>) {
      throw ArgumentError('Invalid JSON format for MovieModel');
    }
    return MovieModel(
      id: json['_id'] ?? json['id'] ?? '',
      title: json['Title'] ?? '',
      year: json['Year'] ?? '',
      rated: json['Rated'],
      released: json['Released'],
      runtime: json['Runtime'],
      genre: json['Genre'],
      director: json['Director'],
      writer: json['Writer'],
      actors: json['Actors'],
      plot: json['Plot'],
      language: json['Language'],
      country: json['Country'],
      awards: json['Awards'],
      posterUrl: (json['Poster'] as String? ?? '').replaceFirst('http://', 'https://'),
      metascore: json['Metascore'],
      imdbRating: json['imdbRating'],
      imdbVotes: json['imdbVotes'],
      imdbID: json['imdbID'],
      type: json['Type'],
      images: (json['Images'] as List<dynamic>?)?.cast<String>() ?? [],
      comingSoon: json['ComingSoon'] ?? false,
      isFavorite: json['isFavorite'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'Title': title,
      'Year': year,
      'Rated': rated,
      'Released': released,
      'Runtime': runtime,
      'Genre': genre,
      'Director': director,
      'Writer': writer,
      'Actors': actors,
      'Plot': plot,
      'Language': language,
      'Country': country,
      'Awards': awards,
      'Poster': posterUrl,
      'Metascore': metascore,
      'imdbRating': imdbRating,
      'imdbVotes': imdbVotes,
      'imdbID': imdbID,
      'Type': type,
      'Images': images,
      'ComingSoon': comingSoon,
      'isFavorite': isFavorite,
    };
  }

  MovieEntity toEntity() {
    return MovieEntity(
      id: id,
      title: title,
      year: year,
      rated: rated,
      released: released,
      runtime: runtime,
      genre: genre,
      director: director,
      writer: writer,
      actors: actors,
      plot: plot,
      language: language,
      country: country,
      awards: awards,
      posterUrl: posterUrl,
      metascore: metascore,
      imdbRating: imdbRating,
      imdbVotes: imdbVotes,
      imdbID: imdbID,
      type: type,
      images: images,
      comingSoon: comingSoon,
      isFavorite: isFavorite,
    );
  }
}
