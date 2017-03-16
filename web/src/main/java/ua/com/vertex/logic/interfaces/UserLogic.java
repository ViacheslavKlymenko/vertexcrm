package ua.com.vertex.logic.interfaces;

import ua.com.vertex.beans.Role;
import ua.com.vertex.beans.User;
import java.sql.SQLException;
import java.util.EnumMap;
import java.util.List;
import java.util.Optional;

public interface UserLogic {

    List<String> getAllUserIds();

    Optional<User> getUserById(int id);

    Optional<User> getUserByEmail(String email);

    void saveImage(int userId, byte[] image, String imageType) throws Exception;

    Optional<byte[]> getImage(int userId, String imageType);

    List<User> getAllUsers() throws SQLException;

    Optional<User> getUserDetailsByID(int userId) throws SQLException;

    EnumMap<Role, Role> getAllRoles();

    int saveUserData(User user);

    int activateUser(String email);

    List<User> searchUser(String userData) throws Exception;

}
