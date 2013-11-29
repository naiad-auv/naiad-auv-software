package Exceptions;

public class ScopeModificationNotSupported extends Exception {

	private static final long serialVersionUID = 2798961562391293538L;

	public ScopeModificationNotSupported(String message)
	{
		super("ScopeModificationNotSupported: " + message);
	}
}
