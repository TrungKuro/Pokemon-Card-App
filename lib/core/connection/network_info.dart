import 'package:data_connection_checker_tv/data_connection_checker.dart';

/* ------------------------------------------------------------------------- */

abstract class NetworkInfo {
  Future<bool>? get isConnected;
}

/* ------------------------------------------------------------------------- */

class NetworkInfoImpl implements NetworkInfo {
  final DataConnectionChecker connectionChecker;

  //! Sử dụng tính năng của gói "data_connection_checker_tv"
  NetworkInfoImpl(this.connectionChecker);

  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;
}
