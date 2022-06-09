import 'package:flutter/material.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    List imageList = [
      'https://avatars.mds.yandex.net/i?id=e67c20f98bdc512c5d3bc20c140f8fac-5719595-images-taas-consumers&n=27&h=480&w=480',
      'https://d3nn873nee648n.cloudfront.net/HomeImages/Concept-and-Ideas.jpg',
      'https://gratisography.com/wp-content/uploads/2022/03/gratisography-10-free-stock-photo-800x525.jpg',
      'https://thumbs.dreamstime.com/b/cosmos-beauty-deep-space-elements-image-furnished-nasa-science-fiction-art-102581846.jpg',
      'https://cdn.arstechnica.net/wp-content/uploads/2016/02/5718897981_10faa45ac3_b-640x624.jpg',
      'https://cdn.searchenginejournal.com/wp-content/uploads/2019/08/c573bf41-6a7c-4927-845c-4ca0260aad6b-760x400.jpeg',
      'https://helpx.adobe.com/content/dam/help/en/stock/how-to/visual-reverse-image-search/jcr_content/main-pars/image/visual-reverse-image-search-v2_intro.jpg',
      'https://upload.wikimedia.org/wikipedia/commons/9/9a/Gull_portrait_ca_usa.jpg',
      'https://tinypng.com/images/social/website.jpg'
    ];
    return SafeArea(
        child: Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 50,
            width: double.infinity,
            child: Row(
              children: const [
                SizedBox(width: 20),
                Icon(
                  Icons.arrow_back_ios,
                ),
                SizedBox(width: 10),
                Text(
                  'All Posts',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Saved',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          const SizedBox(height: 40),
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              shrinkWrap: true,
              children: List.generate(
                imageList.length,
                (index) => Container(
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black26),
                        color: Colors.grey[200]),
                    child: isLoading == true
                        ? Image.network(
                            imageList[index],
                            fit: BoxFit.cover,
                          )
                        : const Center(
                            child: CircularProgressIndicator(
                            color: Colors.pinkAccent,
                          ))),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
