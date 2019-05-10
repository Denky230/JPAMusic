
package exceptions;

import java.util.Arrays;
import java.util.List;

/**
 *
 * @author User
 */
public class DatabaseException extends MyException {

    public enum Errors {
        INVALID_LOGIN,
        USER_DUPLICATED
    }

    public DatabaseException(int code) {
        super(code);
    }
    public DatabaseException(int code, String value) {
        super(code, value);
    }
    
    
    @Override
    public List<String> initErrorMessages() {
        List<String> messages = Arrays.asList(
                "Login invalid",
                "Username '%s' already in use"
        );
        
        return messages;
    }
}