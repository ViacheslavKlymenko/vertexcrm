package ua.com.vertex.logic.interfaces;

import ua.com.vertex.beans.Course;
import ua.com.vertex.utils.DataNavigator;

import java.util.List;

public interface CourseLogic {
    DataNavigator updateDataNavigator(DataNavigator dataNavigator);

    List<Course> getCoursesPerPages(DataNavigator dataNavigator);

    int addCourse(Course course) throws Exception;

    List<Course> getAllCoursesWithDept();
}
