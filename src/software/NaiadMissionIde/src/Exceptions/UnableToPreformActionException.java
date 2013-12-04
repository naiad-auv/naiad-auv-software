package Exceptions;

public class UnableToPreformActionException extends Exception {

	private static final long serialVersionUID = 2798961562391293538L;

	public UnableToPreformActionException(String message)
	{
		super("UnableToPreformActionException: " + message);
	}
}
