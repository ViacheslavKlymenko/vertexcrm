package ua.com.vertex.logic;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ua.com.vertex.beans.Course;
import ua.com.vertex.beans.CourseUserDTO;
import ua.com.vertex.beans.User;
import ua.com.vertex.dao.interfaces.CourseDaoInf;
import ua.com.vertex.logic.interfaces.CourseLogic;

import java.util.List;
import java.util.Optional;

@Service
public class CourseLogicImpl implements CourseLogic {

    private final CourseDaoInf courseDaoInf;
    private static final Logger LOGGER = LogManager.getLogger(CourseLogicImpl.class);

    @Override
    public List<Course> getAllCoursesWithDept() throws Exception {
        LOGGER.debug("Call - courseDaoInf.getAllCoursesWithDept()");
        return courseDaoInf.getAllCoursesWithDept();
    }

    @Override
    public List<Course> searchCourseByNameAndStatus(Course course) throws Exception {
        LOGGER.debug(String.format("Call courseDaoInf.searchCourseByNameAndStatus(%s)",course));
        return courseDaoInf.searchCourseByNameAndStatus(course);
    }

    @Override
    public int updateCourseExceptPrice(Course course) throws Exception {
        LOGGER.debug(String.format("Call courseDaoInf.updateCourseExceptPrice(%s)",course));
        return courseDaoInf.updateCourseExceptPrice(course);
    }

    @Override
    public Optional<Course> getCourseById(int courseId) throws Exception {
        LOGGER.debug(String.format("Call courseDaoInf.getCourseById(%s)",courseId));
        return courseDaoInf.getCourseById(courseId);
    }

    @Override
    public List<User> getUsersAssignedToCourse(int courseId) {
        return courseDaoInf.getUsersAssignedToCourse(courseId);
    }

    @Override
    public void removeUserFromCourse(CourseUserDTO dto) {
        courseDaoInf.removeUserFromCourse(dto);
    }

    @Override
    public void assignUserToCourse(CourseUserDTO dto) {
        courseDaoInf.assignUserToCourse(dto);
    }

    @Override
    public List<User> searchForUsersToAssign(CourseUserDTO dto) {
        return courseDaoInf.searchForUsersToAssign(dto);
    }

    @Autowired
    public CourseLogicImpl(CourseDaoInf courseDaoInf) {
        this.courseDaoInf = courseDaoInf;
    }
}
