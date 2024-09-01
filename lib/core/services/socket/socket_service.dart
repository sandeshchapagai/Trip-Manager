import 'package:flutter/material.dart';

import '../../app/app_states/app_states.dart';

class SocketService {
  static final SocketService _instance = SocketService._internal();
  static BuildContext context =
      AppStates.globalKey.currentContext as BuildContext;
  // io.Socket? orderSockets;
  factory SocketService() => _instance;
  SocketService._internal();
  //
  // disconnectOrderSocket() {
  //   orderSockets?.dispose();
  //   orderSockets?.disconnect();
  // }

  // disconnectSockets() => disconnectOrderSocket();

  // initSockets() => orderSocket();

  // orderSocket() async {
  //   var orderBloc = context.read<OrderBloc>();
  //
  //   orderSockets = await socketConnection(url: ApiConfig.orderSocketUrl)
  //     ..dispose()
  //     ..connect();
  //
  //   orderSockets?.on(OrderSocket.orderCreated.value, (value) {
  //     var orderId = value[OrderSocket.orderId.value];
  //     orderBloc.add(OrderViaSocketFetched(id: orderId));
  //   });
  //
  //   orderSockets?.on(OrderSocket.itemUpdated.value, (value) {
  //     var orderId = value[OrderSocket.orderId.value];
  //     orderBloc.add(OrderViaSocketFetched(id: orderId));
  //   });
  //
  //   orderSockets?.on(OrderSocket.kotUpdated.value, (value) {
  //     var orderId = value[OrderSocket.orderId.value];
  //     orderBloc.add(OrderViaSocketFetched(id: orderId));
  //   });
  //
  //   orderSockets?.on(OrderSocket.typeUpdated.value, (value) {
  //     var orderId = value[OrderSocket.orderId.value];
  //     orderBloc.add(OrderViaSocketFetched(id: orderId));
  //   });
  // }

  // Future<io.Socket> socketConnection({required String url}) async {
  //   return io.io(
  //       url,
  //       io.OptionBuilder()
  //           .setTransports(ApiConfig.socketTransport)
  //           .disableAutoConnect()
  //           .setExtraHeaders({
  //         HttpHeaders.authorizationHeader:
  //         "${ApiConfig.bearer} ${await secureStorage.getToken}"
  //       })
  //           .enableForceNew()
  //           .build());
  // }
}
