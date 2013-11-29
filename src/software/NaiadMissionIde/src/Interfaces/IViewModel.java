package Interfaces;

import java.util.Dictionary;

public interface IViewModel {

	public void WireEvents(Object o) throws IllegalArgumentException;

    public Dictionary<String, ICommand> getCommandsDictionary();

}
