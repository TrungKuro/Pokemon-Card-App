import 'package:dartz/dartz.dart';

import '../../../../../core/connection/network_info.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../core/params/params.dart';
import '../../business/repositories/pokemon_repository.dart';
import '../datasources/pokemon_local_data_source.dart';
import '../datasources/pokemon_remote_data_source.dart';
import '../models/pokemon_model.dart';

/* ------------------------------------------------------------------------- */

class PokemonRepositoryImpl implements PokemonRepository {
  // Object
  final PokemonRemoteDataSource remoteDataSource;
  final PokemonLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  // Hàm xây dựng
  PokemonRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, PokemonModel>> getPokemon({required PokemonParams params}) async {
    /* ---------------------- Nếu có kết nối Internet ---------------------- */
    if (await networkInfo.isConnected!) {
      /* ------------------------ Server có phản hồi ----------------------- */
      try {
        // Nhận data từ Server gửi về
        final remotePokemon = await remoteDataSource.getPokemon(params: params);
        // Cho lưu data mới nhất vào CACHE
        localDataSource.cachePokemon(remotePokemon);
        // Trả về [PokemonModel]
        return Right(remotePokemon);
      }
      /* ---------------------- Server ko có phản hồi ---------------------- */
      on ServerException {
        // Trả về [Failure [ServerFailure] ]
        return Left(ServerFailure(errorMessage: 'This is a server exception'));
      }
    }
    /* --------------------- Nếu ko có kết nối Internet -------------------- */
    else {
      /* ---------------------- Nếu CACHE có lưu data ---------------------- */
      try {
        // Lấy data trong CACHE
        final localPokemon = await localDataSource.getLastPokemon();
        // Trả về [PokemonModel]
        return Right(localPokemon);
      }
      /* --------------------- Nếu CACHE ko có lưu data -------------------- */
      on CacheException {
        // Trả về [Failure [CacheFailure] ]
        return Left(CacheFailure(errorMessage: 'No local data found'));
      }
    }
    /* --------------------------------------------------------------------- */
  }
}
