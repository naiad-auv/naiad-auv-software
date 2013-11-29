package Commands;

import Exceptions.ScopeModificationNotSupported;
import Interfaces.ICommand;

import java.util.List;

public class HandleWelcomeMenuCommand implements ICommand{

    @Override
	public Object execute()
	{

		System.out.println("HandleWelcomeMenuCommand Executed");
        return null;
    }

    @Override
    public void setScope(List<Object> scopeObjects) throws ScopeModificationNotSupported {
        throw new ScopeModificationNotSupported("No scope needed in HandleWelcomeCommand");
    }
}
