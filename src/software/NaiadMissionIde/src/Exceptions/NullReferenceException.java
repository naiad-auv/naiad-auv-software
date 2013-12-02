package Exceptions;

public class NullReferenceException extends Exception {

	private static final long serialVersionUID = 2798961562391293538L;

	public NullReferenceException(String message)
	{
		super("NullReferenceException: " + message);
	}
}
