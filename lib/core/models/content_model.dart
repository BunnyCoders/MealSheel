class UnbordingContent {
  String? image;
  String? title;
  String? description;

  UnbordingContent({this.image, this.title, this.description});
}

List<UnbordingContent> contents = [
  UnbordingContent(
    title: 'Quality Food',
    image: 'assets/images/breakfast.png',
    description: "simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the "
    "industry's standard dummy text ever since the 1500s, "
    "when an unknown printer took a galley of type and scrambled it "
  ),
  UnbordingContent(
    title: 'Fast Delivery',
    image: 'assets/images/delievery.png',
    description: "simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the "
    "industry's standard dummy text ever since the 1500s, "
    "when an unknown printer took a galley of type and scrambled it "
  ),
  UnbordingContent(
    title: 'Reward surprises',
    image: 'assets/images/groceries.png',
    description: "simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the "
    "industry's standard dummy text ever since the 1500s, "
    "when an unknown printer took a galley of type and scrambled it "
  ),
];