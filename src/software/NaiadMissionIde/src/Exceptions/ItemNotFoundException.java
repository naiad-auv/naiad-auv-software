package Exceptions;

public class ItemNotFoundException extends Exception {

	private static final long serialVersionUID = 2798961562391293538L;

	public ItemNotFoundException(String message)
	{
		super("ItemNotFoundException: " + message);
	}
}
