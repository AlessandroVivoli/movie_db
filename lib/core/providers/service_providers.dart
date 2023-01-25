import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../services/account_avatar_service.dart';
import '../services/account_service.dart';
import '../services/auth_service.dart';
import '../services/genre_service.dart';
import '../services/image_service.dart';
import '../services/movie_service.dart';
import '../services/person_service.dart';
import '../services/video_service.dart';

final authServiceProvider = Provider((ref) => AuthService());
final accountServiceProvider = Provider((ref) => AccountService());
final accountAvatarServiceProvider = Provider((ref) => AccountAvatarService());
final genreServiceProvider = Provider((ref) => GenreService());
final imageServiceProvider = Provider((ref) => ImageService());
final movieServiceProvider = Provider((ref) => MovieService());
final personServiceProvider = Provider((ref) => PersonService());
final videoServiceProvider = Provider((ref) => VideoService());
