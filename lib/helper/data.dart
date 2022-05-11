import '../models/category_model.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> category = [];
  //------------------------------------------------------
  CategoryModel categoryModel = new CategoryModel();

  categoryModel.categoryName = "Business";
  categoryModel.imageUrl =
      "https://images.unsplash.com/photo-1507679799987-c73779587ccf?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8YnVzaW5lc3NtYW58ZW58MHx8MHx8&w=1000&q=80";

  category.add(categoryModel);

  //------------------------------------------------------

  categoryModel = new CategoryModel();

  categoryModel.categoryName = "Entertainment";
  categoryModel.imageUrl =
      "https://img.redbull.com/images/c_limit,w_1500,h_1000,f_auto,q_auto/redbullcom/2018/11/05/b32a8a5c-450c-47a6-8b5a-f0131bb916fd/gamespot";

  category.add(categoryModel);

  //------------------------------------------------------

  categoryModel = new CategoryModel();

  categoryModel.categoryName = "General";
  categoryModel.imageUrl =
      "https://cdn.da.org.za/wp-content/uploads/2022/02/06111112/s3-news-tmp-116055-6276688407_28fb0d1b04_o_0-default-1276.jpg";

  category.add(categoryModel);

  categoryModel = new CategoryModel();

  categoryModel.categoryName = "Health";
  categoryModel.imageUrl =
      "https://cloudinary.hbs.edu/hbsit/image/upload/s--sFv3MZbN--/f_auto,c_fill,h_375,w_750,/v20200101/D730ED9CC0AF1A0C18B3499EF75E86D7.jpg";

  category.add(categoryModel);

  categoryModel = new CategoryModel();

  categoryModel.categoryName = "Science";
  categoryModel.imageUrl =
      "https://www.apa.org/images/science-spotlight-740x380_tcm7-290264.jpg";

  category.add(categoryModel);

  categoryModel = new CategoryModel();

  categoryModel.categoryName = "Sports";
  categoryModel.imageUrl =
      "https://library.sportingnews.com/2022-02/Mohamed%20Salah%20Luis%20Diaz%20Fabinho%20Liverpool%20vs%20Leeds%200222322.jpg";

  category.add(categoryModel);

  categoryModel = new CategoryModel();

  categoryModel.categoryName = "Technology";
  categoryModel.imageUrl =
      "https://images.newscientist.com/wp-content/uploads/2022/05/05135158/SEI_102180677.jpg?width=600";

  category.add(categoryModel);

  return category;
}
