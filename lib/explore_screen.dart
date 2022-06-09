import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  List imageList = [
    'https://avatars.mds.yandex.net/i?id=e67c20f98bdc512c5d3bc20c140f8fac-5719595-images-taas-consumers&n=27&h=480&w=480',
    'https://d3nn873nee648n.cloudfront.net/HomeImages/Concept-and-Ideas.jpg',
    'https://gratisography.com/wp-content/uploads/2022/03/gratisography-10-free-stock-photo-800x525.jpg',
    'https://thumbs.dreamstime.com/b/cosmos-beauty-deep-space-elements-image-furnished-nasa-science-fiction-art-102581846.jpg',
    'https://cdn.arstechnica.net/wp-content/uploads/2016/02/5718897981_10faa45ac3_b-640x624.jpg',
    'https://cdn.searchenginejournal.com/wp-content/uploads/2019/08/c573bf41-6a7c-4927-845c-4ca0260aad6b-760x400.jpeg',
    'https://helpx.adobe.com/content/dam/help/en/stock/how-to/visual-reverse-image-search/jcr_content/main-pars/image/visual-reverse-image-search-v2_intro.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/9/9a/Gull_portrait_ca_usa.jpg',
    'https://tinypng.com/images/social/website.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              width: double.infinity,
              margin: const EdgeInsets.all(16.0),
              child: TextFormField(
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: const EdgeInsets.all(8),
                  hintText: 'Search',
                  filled: true,
                  fillColor: Colors.grey[300],
                  hintStyle: const TextStyle(fontSize: 18),
                  focusColor: Colors.black,
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none),
                ),
              ),
            ),
            Expanded(
                child: GridView.custom(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              semanticChildCount: imageList.length,
              gridDelegate: SliverQuiltedGridDelegate(
                crossAxisCount: 4,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
                repeatPattern: QuiltedGridRepeatPattern.inverted,
                pattern: const [
                  QuiltedGridTile(2, 2),
                  QuiltedGridTile(1, 1),
                  QuiltedGridTile(1, 1),
                  QuiltedGridTile(1, 2),
                ],
              ),
              childrenDelegate: SliverChildBuilderDelegate(
                childCount: imageList.length,
                (context, index) => Image.network(
                  imageList[index],
                  fit: BoxFit.cover,
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
