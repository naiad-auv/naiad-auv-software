package ViewModels;

import Interfaces.ICommand;
import Interfaces.IViewModel;

import java.util.Dictionary;

public class MainWindowViewModel implements IViewModel{

	public void WireEvents(Object o) throws IllegalArgumentException {
		// TODO Auto-generated method stub
		
	}

    @Override
    public Dictionary<String, ICommand> getCommandsDictionary() {
        return null;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public Object getScope() {
        return null;  //To change body of implemented methods use File | Settings | File Templates.
    }

}
