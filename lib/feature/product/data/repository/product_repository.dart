import 'package:ecommerce_flutter/feature/product/data/data_source/product_data_source.dart';

class ProductRepository {
  ProductRepository({
  required ProductDataSource productDatasource,
  }) : _productDataSource = productDatasource;

  final ProductDataSource _productDataSource;
}
