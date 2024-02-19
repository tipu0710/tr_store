import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tr_store/presentation/bloc/network/network_bloc.dart';
import 'package:tr_store/presentation/bloc/network/network_state.dart';

class Network extends StatelessWidget {
  const Network({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NetworkBloc, NetworkState>(
      builder: (context, state) {
        if (state is NetworkDisconnected) {
          return Container(
            height: 20,
            width: double.infinity,
            color: Colors.red,
            child: const Center(
              child: Text(
                'No connection!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
