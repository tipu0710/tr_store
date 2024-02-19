import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tr_store/data/data_sources/cart/add_to_cart_local_data_source.dart';
import 'package:tr_store/data/data_sources/cart/cart_update_local_data_source.dart';
import 'package:tr_store/data/data_sources/cart/delete_cart_local_data_source.dart';
import 'package:tr_store/data/models/product_model.dart';
import 'package:tr_store/service/db.dart';

class MockDatabase extends Mock implements DbService {}

void main() {
  late MockDatabase databaseService;
  late AddToCartLocalDataSource addToCartLocalDataSource;
  late CartUpdateLocalDataSource cartUpdateLocalDataSource;
  late CartDeleteLocalDataSource cartDeleteLocalDataSource;

  setUp(() {
    databaseService = MockDatabase();
    addToCartLocalDataSource = AddToCartLocalDataSourceImpl(databaseService);
    cartUpdateLocalDataSource = UpdateCartLocalDataSourceImpl(databaseService);
    cartDeleteLocalDataSource = CartDeleteLocalDataSourceImpl(databaseService);
  });

  const testProductModel = ProductModel(
    id: 1,
    slug: "lorem-ipsum",
    url: "https://jsonplaceholder.org/posts/lorem-ipsum",
    title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
    content:
        "Ante taciti nulla sit libero orci sed nam. Sagittis suspendisse gravida ornare iaculis cras nullam varius ac ullamcorper. Nunc euismod hendrerit netus ligula aptent potenti. Aliquam volutpat nibh scelerisque at. Ipsum molestie phasellus euismod sagittis mauris, erat ut. Gravida morbi, sagittis blandit quis ipsum mi mus semper dictum amet himenaeos. Accumsan non congue praesent interdum habitasse turpis orci. Ante curabitur porttitor ullamcorper sagittis sem donec, inceptos cubilia venenatis ac. Augue fringilla sodales in ullamcorper enim curae; rutrum hac in sociis! Scelerisque integer varius et euismod aenean nulla. Quam habitasse risus nullam enim. Ultrices etiam viverra mattis aliquam? Consectetur velit vel volutpat eget curae;. Volutpat class mus elementum pulvinar! Nisi tincidunt volutpat consectetur. Primis morbi pulvinar est montes diam himenaeos duis elit est orci. Taciti sociis aptent venenatis dui malesuada dui justo faucibus primis consequat volutpat. Rhoncus ante purus eros nibh, id et hendrerit pellentesque scelerisque vehicula sollicitudin quam. Hac class vitae natoque tortor dolor dui praesent suspendisse. Vehicula euismod tincidunt odio platea aenean habitasse neque ad proin. Bibendum phasellus enim fames risus eget felis et sem fringilla etiam. Integer.",
    image:
        "https://dummyimage.com/800x430/FFFFFF/lorem-ipsum.png&text=jsonplaceholder.org",
    thumbnail:
        "https://dummyimage.com/200x200/FFFFFF/lorem-ipsum.png&text=jsonplaceholder.org",
    userId: 1,
  );

  group('Database operation test', () {
    test('should call add to cart when call method', () async {
      //arrange
      when(() => databaseService.createItem(testProductModel))
          .thenAnswer((_) async => 0);
      //act
      await addToCartLocalDataSource.addToCart(testProductModel);
      //assert
      verify(() => databaseService.createItem(testProductModel));
      verifyNoMoreInteractions(databaseService);
    });

    test('should return ProductModel when update success in database',
        () async {
      //arrange
      when(() => databaseService.updateItem(testProductModel))
          .thenAnswer((_) async => 1);
      //act
      final result =
          await cartUpdateLocalDataSource.updateCart(testProductModel);
      //assert
      expect(result, equals(testProductModel));
    });

    test('should return true when delete success in database', () async {
      //arrange
      when(() => databaseService.deleteItem(1)).thenAnswer((_) async => 1);
      //act
      final result = await cartDeleteLocalDataSource.deleteCart(1);
      //assert
      expect(result, true);
    });
  });
}
