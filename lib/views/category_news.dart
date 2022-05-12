import 'package:flutter/material.dart';
import 'package:news_app/helper/news.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/views/article_view.dart';
import 'package:news_app/views/home.dart';

class CategoryNews extends StatefulWidget {
  const CategoryNews({Key? key, this.category}) : super(key: key);

  final String? category;

  @override
  State<CategoryNews> createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  List<ArticleModel> articles = [];
  bool _loading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCategoryNews();
  }

  getCategoryNews() async {
    CategoryNewsClass newsClass = CategoryNewsClass();
    await newsClass.getNews(widget.category!);
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => const Home())),
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 20,
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "Staying",
              style: TextStyle(color: Colors.black),
            ),
            Text("UpToDate", style: TextStyle(color: Colors.blue)),
          ],
        ),
        actions: const [
          Opacity(
              opacity: 0,
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Icon(Icons.save))),
        ],
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(top: 16),
                child: ListView.builder(
                    itemCount: articles.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: const ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return BlogTile(
                        imageUrl: articles[index].urlToImage!,
                        desc: articles[index].description!,
                        title: articles[index].title!,
                        url: articles[index].url!,
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BlogTile extends StatelessWidget {
  const BlogTile(
      {Key? key,
      required this.imageUrl,
      required this.desc,
      required this.title,
      required this.url})
      : super(key: key);

  final String imageUrl, title, desc, url;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (_) => ArticleView(
                      blogUrl: url,
                    )));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.network(imageUrl)),
            const SizedBox(height: 8.0),
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(desc,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300)),
          ],
        ),
      ),
    );
  }
}
