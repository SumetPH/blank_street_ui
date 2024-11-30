import 'package:blank_street/util/custom_colors.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatefulWidget {
  final int imageIndex;

  const ProductDetailScreen({super.key, required this.imageIndex});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final _scrollController = ScrollController();
  bool _isTitleVisible = false;

  _checkTitleVisibility() {
    _scrollController.addListener(() {
      if (_scrollController.offset >= 300) {
        setState(() {
          _isTitleVisible = true;
        });
      } else {
        setState(() {
          _isTitleVisible = false;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();

    _checkTitleVisibility();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SizedBox(
          width: double.infinity,
          height: 46.0,
          child: FloatingActionButton.extended(
            backgroundColor: CustomColors().green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32.0),
            ),
            onPressed: () {},
            label: const Text(
              'Add to Cart',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverAppBar(
              pinned: true,
              scrolledUnderElevation: 0,
              title: _isTitleVisible
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(4.0),
                          child: Image.network(
                            'https://picsum.photos/200/300?random=${widget.imageIndex}',
                            width: 28.0,
                            height: 28.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          width: 8.0,
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Original Cold Brew',
                              style: TextStyle(
                                fontSize: 14.0,
                              ),
                            ),
                            Text(
                              '\$10.0',
                              style: TextStyle(
                                fontSize: 12.0,
                              ),
                            )
                          ],
                        ),
                      ],
                    )
                  : null,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.chevron_left),
                style: IconButton.styleFrom(
                  backgroundColor: CustomColors().brown,
                ),
              ),
              expandedHeight: 300.0,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Hero(
                        tag: 'hero-product-image-${widget.imageIndex}',
                        child: SizedBox(
                          width: 200.0,
                          height: 200.0,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                            child: Image.network(
                              'https://picsum.photos/200/300?random=${widget.imageIndex}',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 12,
                          )
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Original Cold Brew',
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                            'Product Description about the product detail goes here',
                            style: TextStyle(
                              fontSize: 14.0,
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          const ProductDetailOptionWidget(),
                          const SizedBox(height: 16.0),
                          Container(
                            padding: const EdgeInsets.all(12.0),
                            decoration: BoxDecoration(
                              color: CustomColors().brown,
                              border: Border.all(
                                color: CustomColors().brownDark,
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(12.0),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Quantity'),
                                Row(
                                  children: [
                                    CircleAvatar(
                                      minRadius: 10.0,
                                      backgroundColor: CustomColors().green,
                                      child: const Icon(
                                        Icons.remove,
                                        size: 16.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 8.0),
                                      child: Text('1'),
                                    ),
                                    CircleAvatar(
                                      minRadius: 10.0,
                                      backgroundColor: CustomColors().green,
                                      child: const Icon(
                                        Icons.add,
                                        size: 16.0,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  ...[1, 2, 3, 4, 5, 6, 7, 8, 9, 10].map((i) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 12.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: CustomColors().brown,
                          border: Border.all(
                              color: CustomColors().brownDark, width: 1.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: ExpansionTile(
                          trailing: Icon(
                            Icons.keyboard_arrow_down,
                            color: CustomColors().brownDark,
                          ),
                          shape: const Border(),
                          title: Text("Options $i"),
                          children: const [
                            Padding(
                              padding: EdgeInsets.all(12.0),
                              child: ProductDetailOptionWidget(),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                  const SizedBox(height: 100.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductDetailOptionWidget extends StatelessWidget {
  const ProductDetailOptionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(8.0),
            height: 90.0,
            decoration: BoxDecoration(
              color: CustomColors().brown,
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(
                color: CustomColors().green,
                width: 2.0,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: CustomColors().green,
                          maxRadius: 10.0,
                          child: const Icon(
                            size: 16.0,
                            Icons.check,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 8.0),
                        const Text(
                          'Small',
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const Text(
                      '16oz',
                      style: TextStyle(fontSize: 12.0),
                    )
                  ],
                ),
                const SizedBox(height: 12.0),
                const Text("\$4.50")
              ],
            ),
          ),
        ),
        const SizedBox(width: 12.0),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(8.0),
            height: 90.0,
            decoration: BoxDecoration(
              color: CustomColors().brown,
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(
                color: CustomColors().brownDark,
                width: 2.0,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: CustomColors().white,
                          maxRadius: 10.0,
                          child: const Icon(
                            size: 16.0,
                            Icons.check,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 8.0),
                        const Text(
                          'Small',
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const Text(
                      '16oz',
                      style: TextStyle(fontSize: 12.0),
                    )
                  ],
                ),
                const SizedBox(height: 12.0),
                const Text("\$4.50")
              ],
            ),
          ),
        )
      ],
    );
  }
}
