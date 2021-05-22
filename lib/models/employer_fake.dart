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
      "Driver",
      "Alex May",
      "30",
      "Singapore",
      "500",
      "9",
      "assets/images/face-1.jpg",
      "Can drive, can cook chinese food, can take care baby",
    ),
    Employer(
        "Domestic-helper",
        "Miroka",
        "40",
        "Singapore",
        "500",
        "15",
        "assets/images/face-2.jpg",
        "Can drive, can cook chinese food, can take care baby"),
    Employer(
        "Domestic-helper",
        "Momotaro",
        "45",
        "Singapore",
        "500",
        "10",
        "assets/images/face-3.jpg",
        "Can drive, can cook chinese food, can take care baby"),
    Employer(
        "Domestic-helper",
        "Harry Nguyen",
        "20",
        "Indonesia",
        "800",
        "20",
        "assets/images/face-4.jpg",
        "Can drive, can cook chinese food, can take care baby"),
    Employer(
        "Domestic-helper",
        "Kun Pham",
        "26",
        "Viet Nam",
        "800",
        "4",
        "assets/images/face-5.jpg",
        "Can drive, can cook chinese food, can take care baby"),
  ];
}
