package Commands;

import Exceptions.ScopeModificationNotSupported;
import Interfaces.ICommand;
import Logging.ExceptionLogger;
import sun.reflect.generics.reflectiveObjects.NotImplementedException;

import java.util.List;
import java.util.logging.LoggingMXBean;

/**
 * Created with IntelliJ IDEA.
 * User: emil
 * Date: 11/27/13
 * Time: 2:42 PM
 * To change this template use File | Settings | File Templates.
 */
public class DummyCommand implements ICommand {

    private String message;

    public DummyCommand(String message)
    {
        this.message = message;
    }

    @Override
    public Object execute() throws NotImplementedException {
        System.out.println("Dummy command executed with message: " + this.message);

        return null;
    }

    @Override
    public void setScope(List<Object> scopeObjects) throws ScopeModificationNotSupported {

        if(scopeObjects == null)
        {
            ExceptionLogger.Log(new ScopeModificationNotSupported("Null scopeObjects list sent to dummy command"));
            return;
        }

        this.message += " scope";

        for(int i = 0; i < scopeObjects.size(); i++)
        {
            this.message += " : " +  scopeObjects.get(i).toString();
        }
    }
}
