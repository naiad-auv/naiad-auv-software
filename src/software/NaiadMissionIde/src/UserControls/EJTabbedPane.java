package UserControls;

import LanguageHandlers.Objective;

import javax.swing.*;

/**
 * Created with IntelliJ IDEA.
 * User: emil
 * Date: 12/2/13
 * Time: 1:30 PM
 * To change this template use File | Settings | File Templates.
 */
public class EJTabbedPane extends JTabbedPane {

    public EJTabbedPane(int position) {
        super(position);
    }

    public boolean contains(Objective objective)
    {
        for(int i = 0; i < this.getComponentCount(); i++)
        {
            if(((EJDrawingArea)this.getComponentAt(i)).getScope().equals(objective))
                return true;
        }

        return false;
    }

    public int getIndexOf(Objective objective)
    {
        for(int i = 0; i < this.getComponentCount(); i++)
        {
            if(((EJDrawingArea)this.getComponentAt(i)).getScope().equals(objective))
                return i;
        }

        return -1;
    }
}
