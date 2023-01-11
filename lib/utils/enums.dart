enum BackdropSizes { w300, w780, w1280, original }

enum LogoSizes { w45, w92, w154, w185, w300, w500, original }

enum PosterSizes { w92, w154, w185, w342, w500, w780, original }

enum ProfileSizes { w45, w185, h632, original }

enum RouteNames {
  root('home'),
  movieDetails('movie'),
  player('play'),
  personDetails('person');

  final String name;

  const RouteNames(String name) : name = '/$name';
}
