import 'package:ecommerce_flutter/feature/product/data/data_source/product_data_source.dart';
import 'package:ecommerce_flutter/feature/product/data/repository/product_repository.dart';
import 'package:get_it/get_it.dart';

class ProductDI {
  static void registerDependencies() {
    GetIt.I.registerFactory(ProductDataSource.new);

    GetIt.I.registerFactory(
      () => ProductRepository(
        productDatasource: GetIt.I(),
      ),
    );

    // TODO(igor.melo): Register dependencies
  }
}
