class Agency {
  String name;
  String address;
  String image;

  Agency(this.name, this.address, this.image);
}

List<Agency> getAgencies() {
  return <Agency>[
    Agency("Uber", "Singapore", "assets/images/uber.png"),
    Agency("Apple", "Singapore", "assets/images/apple.png"),
    Agency("Google", "Singapore", "assets/images/google.png"),
    Agency("Nike", "Singapore", "assets/images/nike.png"),
    Agency("Amazon", "Singapore", "assets/images/amazon.jpg"),
  ];
}
