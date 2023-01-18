import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/models/account/account_details.dart';
import '../../../core/providers/session_provider.dart';
import '../../../core/services/account_service.dart';
import '../../../core/services/auth_service.dart';
import '../../../core/services/movie_service.dart';
import '../../shared/widgets/account_drawer/account_drawer.dart';
import '../../shared/widgets/carousel/movie_carousel/movie_carousel.dart';
import '../../shared/widgets/errors/error_snack_bar_content.dart';
import '../../shared/widgets/errors/error_text.dart';
import '../../shared/widgets/genre_tab/genre_tab.dart';
import 'home_wrapper/home_wrapper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AccountDetails? _accountDetails;
  String? _sessionId;

  late final GlobalKey<ScaffoldState> _scaffoldKey;

  @override
  void initState() {
    _sessionId = SessionProvider.sessionId;
    _scaffoldKey = GlobalKey();
    _accountDetails = null;

    if (_sessionId != null) {
      AccountService.getAccountDetails(sessionId: _sessionId!).then(
        (value) => setState(() {
          _accountDetails = value;
        }),
      );
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        key: _scaffoldKey,
        drawer: Drawer(
          child: AccountDrawer(
            accountDetails: _accountDetails,
            onLogin: () async {
              if (_scaffoldKey.currentState != null) {
                _scaffoldKey.currentState!.closeDrawer();
              }

              _sessionId = SessionProvider.sessionId;

              final newAccountDetails = await AccountService.getAccountDetails(
                sessionId: _sessionId!,
              );

              setState(() {
                _accountDetails = newAccountDetails;
              });
            },
            onLogout: () async {
              bool success = await AuthService.logout(
                sessionId: _sessionId!,
              );

              if (success) {
                await SessionProvider.deleteSession();

                return setState(() {
                  _sessionId = null;
                  _accountDetails = null;
                });
              }

              WidgetsBinding.instance.addPostFrameCallback((_) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: ErrorSnackBarContent(
                      message: 'Could not logout.',
                    ),
                  ),
                );
              });
            },
          ),
        ),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarColor: Colors.transparent,
              ),
              title: Text(widget.title),
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search),
                ),
              ],
              expandedHeight: 200,
              pinned: true,
              flexibleSpace: const FlexibleSpaceBar(
                background: _TrendingMoviesBuilder(),
              ),
            ),
            SliverToBoxAdapter(
              child: LimitedBox(
                maxHeight: 300,
                child: GenreTab(
                  includeAdult: _accountDetails?.includeAdult,
                ),
              ),
            ),
            const SliverToBoxAdapter(child: HomeWrapper()),
          ],
        ),
      ),
    );
  }
}

class _TrendingMoviesBuilder extends StatelessWidget {
  const _TrendingMoviesBuilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: MovieService.getTrendingMovies(timeWindow: 'week'),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.isEmpty) {
            return const Center(
              child: Text('Nothing found.'),
            );
          }

          return MovieCarousel(
            movies: (snapshot.data!).take(6).toList(),
          );
        } else if (snapshot.hasError) {
          WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Theme.of(context).colorScheme.surface,
                content: const ErrorSnackBarContent(
                  message: 'Could not get trending movies.',
                ),
              ),
            );
          });

          return const Center(
            child: ErrorText('Something went wrong.'),
          );
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
