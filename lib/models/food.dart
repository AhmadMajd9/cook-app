//models
class Food {
  int id;
  String name;
  bool isFavorites;
  String way;
  String component;
  String image;
  Food(
      {this.id,
      this.name,
      this.isFavorites = false,
      this.way = "way",
      this.component = 'component',
      this.image = 'image'});
  Food.fromMap(Map map) {
    this.id = map['id'];
    this.name = map['name'];
    this.isFavorites = map['isFavorites'] == 1 ? true : false;
    this.way = map['way'];
    this.component = map['component'];
    this.image = map['image'];
  }
  toMap() {
    return {
      'name': this.name,
      'isFavorites': this.isFavorites ? 1 : 0,
      'way': this.way,
      'component': this.component,
      'image': this.image
    };
  }
}
