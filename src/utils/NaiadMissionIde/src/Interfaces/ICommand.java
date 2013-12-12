package Interfaces;

import Exceptions.ScopeModificationNotSupported;
import sun.reflect.generics.reflectiveObjects.NotImplementedException;

import java.util.List;

public interface ICommand {

	public Object execute() throws NotImplementedException;

    public void setScope(List<Object> scopeObjects) throws ScopeModificationNotSupported;
}
