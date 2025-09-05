import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/svg.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../application/map/map_cubit.dart';
import '../../domain/core/configs/app_config.dart';
import '../../domain/core/constants/asset_constants.dart';
import '../widgets/custom_textfield.dart';
import 'widgets/search_appbar.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppConfig appConfig = AppConfig.of(context)!;
    AppStateNotifier appStateNotifier = Provider.of<AppStateNotifier>(context);
    return BlocProvider(
      create: (context) => MapCubit(MapState.initial(
          appStateNotifier: appStateNotifier,
          serverUrl: appConfig.serverUrl,
          mapsApiKey: appConfig.googleMapsApiKey))
        ..init(),
      child: MapScreenConsumer(),
    );
  }
}

class MapScreenConsumer extends StatefulWidget {
  const MapScreenConsumer({super.key});

  @override
  State<MapScreenConsumer> createState() => _MapScreenConsumerState();
}

class _MapScreenConsumerState extends State<MapScreenConsumer>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return BlocBuilder<MapCubit, MapState>(
      builder: (context, state) {
        return Scaffold(
          appBar: SearchAppBar(onSearch: (v) {}),
          body: state.isLoading
              ? Center(
                  child: CircularProgressIndicator(
                    color: colorScheme.primary,
                  ),
                )
              : Stack(
                  children: [
                    // Full screen map
                    FlutterMap(
                      mapController: state.mapController,
                      options: MapOptions(
                        onTap: (tapPosition, point) {
                          // Handle map tap
                          // context.read<MapCubit>().updateSelectedLocation(point);
                        },
                        initialCenter: LatLng(state.savedLocation.latitude,
                            state.savedLocation.longitude),
                        initialZoom: 13,
                        interactionOptions: const InteractionOptions(
                          // enableScrollWheel: true,
                          enableMultiFingerGestureRace: true,
                          flags: InteractiveFlag.all,
                        ),
                      ),
                      children: [
                        // Map Tile Layer
                        TileLayer(
                            urlTemplate:
                                'https://api.mapbox.com/styles/v1/sahul123/cm5yzya7r001f01sbcacneg7v/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1Ijoic2FodWwxMjMiLCJhIjoiY20zc25jc2h6MGthOTJpcjBkY2U2ZjhtNiJ9.PxYibv96Tt8ezsHB5dHWbA'),
                        // Markers Layer
                        MarkerLayer(
                          markers: [
                            ...state.eventMarkers
                          ],
                        ),
                      ],
                    ),
                    // Search Bar at the top
                  ],
                ),
          // Floating action button for current location
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Left FAB (Navigation button)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(
                  shape: CircleBorder(),
                  onPressed: () {
                    context.read<MapCubit>().animatedMapMove(
                        LatLng(state.savedLocation.latitude,
                            state.savedLocation.longitude),
                        13,
                        controller);
                  },
                  heroTag: 'left_fab',
                  child: SvgPicture.asset(
                    AssetConstants.compassIcon,
                    color: Colors.white,
                    height: 30,
                    width: 30,
                  ),
                ),
              ),
              // Right FAB (Normal button)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(
                  backgroundColor: colorScheme.primary,
                  shape: CircleBorder(),
                  onPressed: () {
                    // Handle normal action
                    // Example: context.read<MapCubit>().getCurrentLocation();
                  },
                  child: const Icon(
                    Icons.navigation,
                    color: Colors.white,
                  ),
                  heroTag: 'right_fab',
                ),
              ),
            ],
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation
              .centerFloat, // Position the buttons to the center
        );
      },
    );
  }
}
