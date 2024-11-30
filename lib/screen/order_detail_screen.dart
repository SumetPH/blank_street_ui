import 'package:blank_street/util/custom_colors.dart';
import 'package:flutter/material.dart';

class OrderDetailScreen extends StatefulWidget {
  final int index;

  const OrderDetailScreen({super.key, required this.index});

  @override
  State<OrderDetailScreen> createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _isTitleVisible = true;

  @override
  void initState() {
    super.initState();
    // Add a listener to the scroll controller to track the scroll position
    _scrollController.addListener(() {
      if (_scrollController.offset > 400 && _isTitleVisible) {
        setState(() {
          _isTitleVisible = false; // Hide title when scrolled down
        });
      } else if (_scrollController.offset <= 400 && !_isTitleVisible) {
        setState(() {
          _isTitleVisible = true; // Show title when scrolled up
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 400,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://picsum.photos/500/300?random=${widget.index}',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Coup with your friends',
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Fresh from the Oliver',
                          style: TextStyle(
                            fontSize: 32.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                ...[1, 2, 3].map(
                  (e) {
                    return Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: SizedBox(
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              color: Colors.grey,
                              child: AspectRatio(
                                aspectRatio: 1 / 1,
                                child: Image.network(
                                  'https://picsum.photos/500/300?random=${widget.index * (e + 1)}',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(height: 16.0),
                            const Text(
                              'Banana Bread',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 4.0),
                            const Text(
                              'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries',
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            color: _isTitleVisible ? Colors.transparent : CustomColors().brown,
            child: SafeArea(
              bottom: false,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: 32.0,
                      height: 32.0,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        padding: const EdgeInsets.all(0.0),
                        style: IconButton.styleFrom(
                          backgroundColor: CustomColors().brown,
                        ),
                        color: CustomColors().brownDark,
                        iconSize: 20.0,
                        icon: const Icon(Icons.close),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
