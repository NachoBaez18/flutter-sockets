import 'package:band_named_app/services/socket.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StatusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final socketServices = Provider.of<SocketServices>(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('ServicesStatus: ${socketServices.serverStatus}')],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.message),
        onPressed: () {
          socketServices.emit('emitir-flutter', {
            'nombre': 'flutter',
            'mensaje': 'hola desde fluuter',
          });
        },
      ),
    );
  }
}
