package ore.projects.webapps.services;

import ore.projects.webapps.domain.User;
import ore.projects.webapps.domain.UserCourse;
import ore.projects.webapps.exceptions.user.DuplicateUserException;
import ore.projects.webapps.exceptions.user.UserNotFoundException;
import ore.projects.webapps.repositories.UserCourseRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
@Transactional
public class UserCourseServiceImpl implements UserCourseService {

    @Autowired
    private UserCourseRepository userCourseRepository;

    @Autowired
    private UserService userService;

    @Override
    public List<UserCourse> findAll() {
        return userCourseRepository.findAll();
    }

    @Override
    public List<UserCourse> findAllByUserID(Long userID) {
        return userCourseRepository.findAllByUserID(userID);
    }

    @Override
    public List<UserCourse> findAllByCourseID(Long courseID) {
        return userCourseRepository.findAllByCourseID(courseID);
    }

    @Override
    public UserCourse findByUserIDAndCourseID(Long userID, Long courseID) {
        return userCourseRepository.findByUserIDAndCourseID(userID, courseID);
    }

    @Override
    public void save(UserCourse userCourse) throws DuplicateUserException, UserNotFoundException {
        userCourseRepository.save(userCourse);
        User user = userService.findOne(userCourse.getUserID());
        userService.save(user);
    }

    @Override
    public void deleteByUserIDAndCourseID(Long userID, Long courseID) throws UserNotFoundException, DuplicateUserException {
        userCourseRepository.deleteByUserIDAndCourseID(userID, courseID);
        User user = userService.findOne(userID);
        userService.save(user);
    }

}
