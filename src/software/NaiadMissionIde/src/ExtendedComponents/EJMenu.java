package ExtendedComponents;

import javax.swing.JMenu;
import javax.swing.JMenuItem;

import Exceptions.ItemNotFoundException;

public class EJMenu extends JMenu
{
	private static final long serialVersionUID = 5147902423956096713L;

	public EJMenu(String name)
	{
		super(name);
	}
	
	public JMenuItem getItem(String name) throws ItemNotFoundException
		{
			for(int i = 0; i < this.getItemCount(); i ++)
			{
				JMenuItem currentItem = this.getItem(i);
				
				if(currentItem == null)
					continue;
				
				String itemName = currentItem.getName();
				
				if(itemName == null)
					continue;
				
				if(itemName.equals(name))
					return this.getItem(i);
			}
			
			throw new ItemNotFoundException(name);
		}
}
