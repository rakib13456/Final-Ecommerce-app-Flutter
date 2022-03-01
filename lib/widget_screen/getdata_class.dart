

class sofa {
  sofa({
    this.title,
    this.description,
    this.image,
    this.price,
    this.catagory,
  });

  String? title;
  String? description;
  String? image;
  String?  price;
  String? catagory;

  get getTitle => this.title;

  set setTitle( title) => this.title = title;

  get getDescription => this.description;

  set setDescription( description) => this.description = description;

  get getImage => this.image;

  set setImage( image) => this.image = image;

  get getPrice => this.price;

  set setPrice( price) => this.price = price;

  get getCatagory => this.catagory;

  set setCatagory( catagory) => this.catagory = catagory;
}