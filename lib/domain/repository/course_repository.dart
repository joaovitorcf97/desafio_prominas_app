abstract class ICourseRepository {
  Future<void> getAllCourses();
  Future<void> getCourse({required String courseId});
  Future<void> getDisciplines({required String disciplineId});
}
