import 'package:flutter/material.dart';
import 'package:movie_db/ui/pages/home/carousel/carousel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const Drawer(),
        appBar: AppBar(
          title: Text(widget.title),
          centerTitle: true,
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: const [
              Carousel(
                images: [
                  "https://dlcdnrog.asus.com/rog/media/1554200908315.webp",
                  "https://miro.medium.com/max/1400/1*evrWaYJyKbCv7c0dGu1K_w.png",
                  "https://image.tmdb.org/t/p/w780/s16H6tpK2utvwDtzZ8Qy4qm5Emw.jpg"
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
