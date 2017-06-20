package ua.com.vertex.controllers;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import ua.com.vertex.beans.Course;
import ua.com.vertex.logic.interfaces.CourseLogic;
import ua.com.vertex.logic.interfaces.UserLogic;

import javax.validation.Valid;
import java.util.List;
import java.util.Optional;

import static ua.com.vertex.controllers.AdminController.ADMIN_JSP;
import static ua.com.vertex.controllers.CertificateDetailsPageController.ERROR;
import static ua.com.vertex.controllers.CreateCertificateAndUserController.MSG;

@Controller
public class CourseDetailsController {

    private static final String COURSE_DETAILS_JSP = "courseDetails";
    static final String SEARCH_COURSE_JSP = "searchCourse";
    static final String COURSE_DATA = "courseForInfo";
    private static final String COURSE = "course";
    private static final String COURSE_ID = "courseId";
    private static final String TEACHERS = "teachers";

    private static final Logger LOGGER = LogManager.getLogger(CourseDetailsController.class);

    private final CourseLogic courseLogic;
    private final UserLogic userLogic;

    @PostMapping(value = "/searchCourseJsp")
    public ModelAndView searchCourseJsp() {
        LOGGER.debug("Show search page for courses");
        return new ModelAndView(SEARCH_COURSE_JSP, COURSE_DATA, new Course());
    }

    @PostMapping(value = "/searchCourse")
    public String searchCourse(@Validated @ModelAttribute(COURSE_DATA) Course course,
                               Model model) {
        LOGGER.debug(String.format("Search user by name - (%s) and finished - (%s).",
                course.getName(), course.isFinished()));

        String result = SEARCH_COURSE_JSP;

        try {
            List<Course> courses = courseLogic.searchCourseByNameAndStatus(course);
            model.addAttribute("courses", courses);

        } catch (EmptyResultDataAccessException e) {
            model.addAttribute(MSG, "Course with name - '" + course.getName() + "' not found. Please check the data and try it again.");
        } catch (DataAccessException e) {
            LOGGER.warn(e);
            model.addAttribute(MSG, "Problems with the server, try again later.");
        } catch (Exception e) {
            LOGGER.warn(e);
            result = ERROR;
        }

        return result;
    }

    @PostMapping(value = "/courseDetails")
    public ModelAndView courseDetails(@RequestParam(COURSE_ID) int courseId) {
        LOGGER.debug(String.format("Go to the course information page. Course ID -: - (%s)", courseId));

        ModelAndView result = new ModelAndView(COURSE_DETAILS_JSP);

        try {
            Optional<Course> course = courseLogic.getCourseById(courseId);
            if (course.isPresent()) {
                result.addObject(COURSE, course.get());
                result.addObject(TEACHERS, userLogic.getTeachers());
            } else {
                throw new Exception();
            }
        } catch (Exception e) {
            LOGGER.warn(e);
            result.setViewName(ERROR);
        }

        return result;
    }

    @PostMapping(value = "/updateCourse")
    public String updateCourse(@Valid @ModelAttribute(COURSE) Course course, BindingResult bindingResult, Model model) {
        LOGGER.debug(String.format("Update course with course ID - (%s). Course details: - (%s)", course.getId(), course));
        String result = ADMIN_JSP;
        if (!bindingResult.hasErrors()) {
            try {
                courseLogic.updateCourseExceptPrice(course);
                model.addAttribute(MSG, "Course updated!!!");
            } catch (DataAccessException e) {
                LOGGER.warn(e);
                model.addAttribute(MSG, "Problems with the server, try again later.");
            } catch (Exception e) {
                LOGGER.warn(e);
                result = ERROR;
            }
        } else {
            result = COURSE_DETAILS_JSP;
            model.addAttribute(model.addAttribute(TEACHERS, userLogic.getTeachers()));
        }
        return result;
    }

    @Autowired
    public CourseDetailsController(CourseLogic courseLogic, UserLogic userLogic) {
        this.courseLogic = courseLogic;
        this.userLogic = userLogic;
    }
}
