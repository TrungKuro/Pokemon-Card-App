import 'package:dartz/dartz.dart';

import '../../../../../core/connection/network_info.dart';
import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/params/params.dart';
import '../../business/repositories/pokemon_image_repository.dart';
import '../datasources/pokemon_image_local_data_source.dart';
import '../datasources/pokemon_image_remote_data_source.dart';
import '../models/pokemon_image_model.dart';

/* ------------------------------------------------------------------------- */

class PokemonImageRepositoryImpl implements PokemonImageRepository {
  // Object
  final PokemonImageRemoteDataSource remoteDataSource;
  final PokemonImageLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  // Hàm xây dựng
  PokemonImageRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, PokemonImageModel>> getPokemonImage({required PokemonImageParams pokemonImageParams}) async {
    /* ---------------------- Nếu có kết nối Internet ---------------------- */
    if (await networkInfo.isConnected!) {
      /* ------------------------ Server có phản hồi ----------------------- */
      try {
        // Nhận data từ Server gửi ve62
        PokemonImageModel remotePokemonImage =
            await remoteDataSource.getPokemonImage(pokemonImageParams: pokemonImageParams);
        // Cho lưu data mới nhất vào CACHE
        localDataSource.cachePokemonImage(pokemonImageToCache: remotePokemonImage);
        // Trả về [PokemonImageModel]
        return Right(remotePokemonImage);
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
        PokemonImageModel localPokemonImage = await localDataSource.getLastPokemonImage();
        // Trả về [PokemonImageModel]
        return Right(localPokemonImage);
      }
      /* --------------------- Nếu CACHE ko có lưu data -------------------- */
      on CacheException {
        // Trả về [Failure [CacheFailure] ]
        return Left(CacheFailure(errorMessage: 'This is a cache exception'));
      }
    }
  }
}
