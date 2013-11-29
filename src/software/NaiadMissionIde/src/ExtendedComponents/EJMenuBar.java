package ExtendedComponents;

import javax.swing.JMenuBar;
import Exceptions.ItemNotFoundException;

public class EJMenuBar extends JMenuBar 
{

	private static final long serialVersionUID = 1L;

	public EJMenuBar()
	{
		super();
	}
	
	public EJMenu getItem(String name) throws ItemNotFoundException
	{
		for(int i = 0; i < this.getMenuCount(); i ++)
		{
			String itemName = this.getMenu(i).getName();
			
			if(itemName == null)
				continue;
			
			if(itemName.equals(name))
				return (EJMenu) this.getMenu(i);
		}
		
		throw new ItemNotFoundException(name);
	}
}
