class Agency {
  String name;
  String address;
  String image;
  List<String> services;
  Agency(
    this.name,
    this.address,
    this.services,
    this.image,
  );
}

List<Agency> getAgencies() {
  return <Agency>[
    Agency(
        "Uber",
        "Singapore",
        ['Training', 'Renewal', 'Local Hire', 'Overseas Hire'],
        "assets/images/Agency.jpg"),
    Agency(
        "Apple",
        "Singapore",
        ['Training', 'Renewal', 'Local Hire', 'Overseas Hire'],
        "assets/images/Agency.jpg"),
    Agency(
        "Google",
        "Singapore",
        ['Training', 'Renewal', 'Local Hire', 'Overseas Hire'],
        "assets/images/Agency.jpg"),
    Agency(
        "Nike",
        "Singapore",
        ['Training', 'Renewal', 'Local Hire', 'Overseas Hire'],
        "assets/images/Agency.jpg"),
    Agency(
        "Amazon",
        "Singapore",
        ['Training', 'Renewal', 'Local Hire', 'Overseas Hire'],
        "assets/images/Agency.jpg"),
  ];
}
