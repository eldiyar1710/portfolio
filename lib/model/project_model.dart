class Project {
  final String nameKey;
  final String descriptionKey;
  final String image;
  final String link;
  const Project(this.nameKey, this.descriptionKey, this.image, this.link);
}

List<Project> projectList = [
  const Project(
    'project_1_name',
    'project_1_desc',
    'assets/images/D87305D4-D41B-4A75-BE8D-4066811CC454.jpeg',
    'https://github.com/eldiyar1710',
  ),
  const Project(
    'project_2_name',
    'project_2_desc',
    'assets/images/33.png',
    'https://github.com/eldiyar1710',
  ),
  const Project(
    'project_3_name',
    'project_3_desc',
    'assets/images/12.jpeg',
    'https://github.com/eldiyar1710',
  ),
  
];
