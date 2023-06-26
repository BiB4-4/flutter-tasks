///Assalamualaikum vaiay, here is my code..I am trying to do this code but my cart part don t work i don t get why
import 'package:flutter/material.dart';

void main() {
  runApp(ProductListApp());
}

class ProductListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductListPage(),
      routes: {
        '/cart': (context) => CartPage(),
      },
    );
  }
}

class ProductListPage extends StatefulWidget {
  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  List<Product> products = [
    Product(name: 'Product 1', price: 10),
    Product(name: 'Product 2', price: 20),
    Product(name: 'Product 3', price: 30),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductListItem(
            product: products[index],
            onBuyNowPressed: () {
              setState(() {
                products[index].buyCount++;
                if (products[index].buyCount == 5) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Congratulations!'),
                        content: Text(
                            'You\'ve bought 5 ${products[index].name}!'),
                        actions: <Widget>[
                          TextButton(
                            child: Text('OK'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                }
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.shopping_cart),
        onPressed: () {
          Navigator.pushNamed(context, '/cart');
        },
      ),
    );
  }
}

class Product {
  String name;
  double price;
  int buyCount;

  Product({required this.name, required this.price, this.buyCount = 0});
}

class ProductListItem extends StatelessWidget {
  final Product product;
  final VoidCallback onBuyNowPressed;

  const ProductListItem({
    required this.product,
    required this.onBuyNowPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.shopping_cart),
      title: Text(product.name),
      subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
      trailing: TextButton(
        onPressed: onBuyNowPressed,
        child: Text('Buy Now (${product.buyCount})'),
      ),
    );
  }
}

class CartPage extends StatelessWidget {
  final List<Product> products = [];

  int getTotalProductsCount() {
    int totalCount = 0;
    for (var product in products) {
      totalCount += product.buyCount;
    }
    return totalCount;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Center(
        child: Text(
          'Total Products: ${getTotalProductsCount()}',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
///Thank you vaiay may allah bless you Ameen^^
