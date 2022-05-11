import 'package:flutter/material.dart';
import 'package:news_app/helper/data.dart';
import 'package:news_app/helper/news.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/models/category_model.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = [];
  List<ArticleModel> articles = [];

  bool _loading = true;

  @override
  void initState() {
    super.initState();
    categories = getCategories();
    getNews();
  }

  getNews() async {
    News newsClass = News();
    await newsClass.getNews();
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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "Flutter",
              style: TextStyle(color: Colors.black),
            ),
            Text("News", style: TextStyle(color: Colors.blue)),
          ],
        ),
        centerTitle: true,
      ),
      body: _loading
          ? Center(
              child: Container(
                child: const CircularProgressIndicator(),
              ),
            )
          : Container(
              child: Column(
                children: [
                  ///Categories
                  Container(
                      height: 70,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: ListView.builder(
                          itemCount: categories.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return CategoryTile(
                              imgUrl: categories[index].imageUrl,
                              categoryName: categories[index].categoryName,
                            );
                          })),

                  ///Blogs
                  ///
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(top: 16),
                      child: ListView.builder(
                          itemCount: articles.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return BlogTile(
                                imageUrl: articles[index].urlToImage!,
                                desc: articles[index].description!,
                                title: articles[index].title!);
                          }),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final imgUrl, categoryName;

  CategoryTile({required this.imgUrl, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(right: 16),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.network(
                imgUrl,
                width: 120,
                height: 60,
                fit: BoxFit.fill,
              ),
            ),
            Container(
              width: 120,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.black26,
              ),
              alignment: Alignment.center,
              child: Text(
                categoryName,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w700),
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
      required this.title})
      : super(key: key);

  final String imageUrl, title, desc;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.network(imageUrl),
          Text(title),
          Text(desc),
        ],
      ),
    );
  }
}
