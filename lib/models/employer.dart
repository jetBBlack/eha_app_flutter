class Employer {
  String position;
  String name;
  String age;
  String address;
  String price;
  String exp;
  String image;
  String description;

  Employer(this.position, this.name, this.age, this.address, this.price,
      this.exp, this.image, this.description);
}

List<Employer> getEmployer() {
  return <Employer>[
    Employer(
      "Data-Scientist",
      "Alex May",
      "30",
      "Singapore",
      "30",
      "9",
      "assets/images/face-1.jpg",
      "Can drive, can cook chinese food, can take care baby",
    ),
    Employer(
        "Domestic-helper",
        "Miroka",
        "40",
        "Singapore",
        "50",
        "15",
        "assets/images/face-2.jpg",
        "Can drive, can cook chinese food, can take care baby"),
    Employer(
        "Domestic-helper",
        "Momotaro",
        "45",
        "Singapore",
        "35",
        "10",
        "assets/images/face-3.jpg",
        "Can drive, can cook chinese food, can take care baby"),
    Employer(
        "Domestic-helper",
        "Harry Nguyen",
        "50",
        "Indonesia",
        "50",
        "20",
        "assets/images/face-4.jpg",
        "Can drive, can cook chinese food, can take care baby"),
    Employer(
        "Domestic-helper",
        "Kun Pham",
        "26",
        "Viet Nam",
        "30",
        "4",
        "assets/images/face-5.jpg",
        "Can drive, can cook chinese food, can take care baby"),
  ];
}
