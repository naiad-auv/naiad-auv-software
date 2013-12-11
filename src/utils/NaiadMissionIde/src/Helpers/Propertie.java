package Helpers;

import Interfaces.IPropertie;

public class Propertie<T> implements IPropertie<T> {

	private T currentValue;
	
	public Propertie()
	{
	}
	
	public Propertie(T initialValue)
	{
		this.currentValue = initialValue;
	}
	
	public void set(T value)
	{
		this.currentValue = value;
	}
	
	public T get()
	{
		return currentValue;
	}
}
