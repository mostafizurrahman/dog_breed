import 'dart:async';
import 'dart:ui';
import 'package:dog_breed/ui/image/random_image_page.dart';
import 'package:dog_breed/ui/widgets/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../config/service_locator.dart';
import '../../domain/domain.dart';
import '../image/image_list_page.dart';
import '../widgets/dog_scaffold.dart';
import 'bloc/base_equatable.dart';
import 'bloc/dashboard_bloc.dart';
import 'breed_list_view.dart';

class BreedDashboardPage extends StatefulWidget {
  static const String path = 'breed/dashboard';

  const BreedDashboardPage({super.key});
  @override
  State<StatefulWidget> createState() => _BreedDashboardState();
}

class _BreedDashboardState extends State<BreedDashboardPage> {
  final _dashboardBloc = DashboardBloc();
  final _notifier = StreamController<NetworkEntity>();
  late final StreamSubscription<NetworkEntity> _apiSubscriber;

  @override
  void initState() {
    super.initState();
    _initStateData();
  }

  void _initStateData() {
    _apiSubscriber = _notifier.stream.listen(_onApiStatus);
    initImageService(notifier: _notifier)
        .then(_onInitService)
        .onError(_onErrorInit);
  }

  void _onInitService(_) {
    _dashboardBloc.add(GetDogBreedList());
  }

  void _onErrorInit(final error, final stack) {}

  void _onApiStatus(NetworkEntity networkEntity) {
    if (networkEntity.status == ApiStatus.progress) {
      ThemeProvider.showLoader(context);
    } else {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return DogScaffold(
      body: _getBody(),
    );
  }

  Widget _getBody() {
    return BlocConsumer(
      listener: _listenToDashboard,
      builder: _onDashboardStateChanged,
      bloc: _dashboardBloc,
      buildWhen: _stopBuildingBloc,
    );
  }

  void _listenToDashboard(BuildContext ctx, DashboardState state) {
    if (state is DogImageListState) {
      _navigateToListImagePage(state);
    } else if (state is RandomDogImageState) {
      _navigateRandomImagePage(state);
    }
  }

  void _navigateRandomImagePage(RandomDogImageState state) {
    final args = {
      DogRandomImagePage.keyTitle: _getTitle(state),
      DogRandomImagePage.keyPath: state.dogData.dogs,
    };
    _pushPage(DogRandomImagePage.path, args);
  }

  void _navigateToListImagePage(DogImageListState state) {
    final args = {
      DogImageListPage.keyTitle: _getTitle(state),
      DogImageListPage.keyData: state.dogData,
    };
    _pushPage(DogImageListPage.path, args);
  }

  String _getTitle(final BreedEquatableState state) {
    String title = 'Breed : ${state.breed?.breed}';
    if (state.breed?.subBreed.isNotEmpty ?? false) {
      title = '$title - SubBreed : ${state.breed?.subBreed}';
    }
    return title;
  }

  void _pushPage(final String path, final Map args) {
    Navigator.pushNamed(
      context,
      path,
      arguments: args,
    );
  }

  bool _stopBuildingBloc(
    final DashboardState oldState,
    final DashboardState newState,
  ) {
    return newState is! DogImageListState && newState is! RandomDogImageState;
  }

  Widget _onDashboardStateChanged(
    final BuildContext ctx,
    DashboardState state,
  ) {
    if (state is DashboardLoadingState) {
      return _getLoadingView();
    }

    if (state is BreedListState) {
      return BlocProvider.value(
        value: _dashboardBloc,
        child: BreedListView(breedList: state.dogData as BreedList),
      );
    }
    if (state is DashboardErrorState) {
      return _getErrorView(state.error);
    }
    return const SizedBox();
  }

  Widget _getLoadingView() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Padding(
            padding: EdgeInsets.all(12),
            child: CircularProgressIndicator(),
          ),
          Text('Loading Dashboard! Please Wait...'),
        ],
      ),
    );
  }

  Widget _getErrorView(final String errorMsg) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(12),
            child: Icon(
              Icons.warning_amber_rounded,
              color: Colors.redAccent,
              size: 40,
            ),
          ),
          Text(errorMsg),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _dashboardBloc.close();
    _apiSubscriber.cancel();
    super.dispose();
  }
}
