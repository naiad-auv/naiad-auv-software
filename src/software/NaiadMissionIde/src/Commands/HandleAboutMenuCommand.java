package Commands;

import Exceptions.ScopeModificationNotSupported;
import Interfaces.ICommand;

import sun.reflect.generics.reflectiveObjects.NotImplementedException;
import views.AboutDialog;

import java.util.List;

public class HandleAboutMenuCommand implements ICommand{

    @Override
	public Object execute() throws NotImplementedException
	{
		AboutDialog.getInstance().setVisible(true);
		AboutDialog.getInstance().requestFocus();
		AboutDialog.getInstance().toFront();
		AboutDialog.getInstance().repaint();

		return null;
	}

    @Override
    public void setScope(List<Object> scopeObjects) throws ScopeModificationNotSupported {
        throw new ScopeModificationNotSupported("No scope needed in HandleAboutMenuCommand");
    }
}
