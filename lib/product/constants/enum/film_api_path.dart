enum FilmApiPath {
  nowPlaying('movie/now_playing'),
  popular('movie/popular'),
  genreMovie('genre/movie/list'),
  detail('movie'),
  search('search/movie'),
  results('results');

  const FilmApiPath(this.value);

  final String value;
}
