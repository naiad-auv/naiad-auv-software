package Commands;

import Exceptions.ScopeModificationNotSupported;
import Interfaces.ICommand;

import java.util.List;

public class HandleHelpSectionCommand implements ICommand{

    @Override
	public Object execute()
	{
		System.out.println("HandleHelpSectionCommand Executed");
        return null;
    }

    @Override
    public void setScope(List<Object> scopeObjects) throws ScopeModificationNotSupported {
        throw new ScopeModificationNotSupported("No scope needed in HandleHelpSectionCommand");
    }
}
