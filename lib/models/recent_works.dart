class Recentwork {
  final String image, category, title;
  final int id;

  Recentwork({required this.id, required this.category, required this.image, required this.title});
}

//Demo list of my works

List<Recentwork> recentWorks = [
  Recentwork(id: 1, category: "Graphics Design", image: "", title: "New & Fresh Looking Portafolio indeed at the end"),
  Recentwork(id: 2, category: "Graphics Design", image: "", title: "New & Fresh Looking Portafolio indeed at the end"),
  Recentwork(id: 3, category: "Graphics Design", image: "", title: "New & Fresh Looking Portafolio indeed at the end"),
  Recentwork(id: 4, category: "Graphics Design", image: "", title: "New & Fresh Looking Portafolio indeed at the end"),
];
