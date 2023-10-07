class User {
  final String username;
  final String name;

  User(this.username, this.name);
}

class Group {
  final String name;
  final String participants;
  final String image;
  final List<User> members;

  Group({
    required this.name,
    required this.participants,
    required this.image,
    required this.members,
  });
}

List<Group> groupsData = [
  Group(
    name: "Group Mobile Programming",
    participants: "7 Peserta",
    image: 'assets/img/groupmp.jpg',
    members: [
      User("aliyahz22", "Aliyah Zahrah"),
      User("sasa", "Marcia Yanprincessa Utama"),
      User("tiara", "Tiara Alviana"),
      User("hansel", "Hansel Yohanes"),
      User("christopher", "Christopher Titan"),
      User("divo", "Divo Ardiano Kesuma Dewa"),
      User("cindyelonora20", "Cindy Elonora")
    ],
  ),
];
