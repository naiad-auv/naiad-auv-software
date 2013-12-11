package ViewModels;

import FileHandling.LanguageObjectsFileHandling;
import Interfaces.ICommand;
import Interfaces.ILanguageObject;
import Interfaces.ILanguageVariable;
import Interfaces.IViewModel;
import LanguageHandlers.Branch;
import UserControls.StandardToolsList;
import UserControls.StandardTypesList;

import javax.swing.event.ListSelectionEvent;
import javax.swing.event.ListSelectionListener;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.util.ArrayList;
import java.util.Dictionary;
import java.util.List;
import java.util.Observable;

/**
 * Created with IntelliJ IDEA.
 * User: emil
 * Date: 11/27/13
 * Time: 8:13 AM
 * To change this template use File | Settings | File Templates.
 */
public class StandardToolsListViewModel extends Observable implements IViewModel {

    private List<ILanguageObject> standardTools;
    private ILanguageObject currentlySelectedObject;

    public StandardToolsListViewModel()
    {
        this.standardTools = new ArrayList<ILanguageObject>();

    }

    public void Initialize()
    {
        this.addTools();
        this.setChanged();
        this.notifyObservers();
    }

    private void addTools() {
        this.standardTools.add(new Branch());
    }

    @Override
    public void WireEvents(Object o) throws IllegalArgumentException {
        StandardToolsList view = (StandardToolsList)o;
        if(view == null)
        {
            throw new IllegalArgumentException("object argument cant be converted to StandardToolsList");
        }

        view.addMouseListener(new MouseAdapter() {
            @Override
            public void mouseClicked(MouseEvent event) {

            }
        });

        view.addListSelectionListener(new ListSelectionListener() {
            @Override
            public void valueChanged(ListSelectionEvent listSelectionEvent) {

                StandardToolsList source = (StandardToolsList)listSelectionEvent.getSource();
                if(source == null)
                {
                    System.out.println("unable to change selected item");
                    return;
                }

                currentlySelectedObject = standardTools.get(source.getSelectedIndex());
                System.out.println("selected item changed");
            }
        });
    }

    @Override
    public Dictionary<String, ICommand> getCommandsDictionary() {
        return null;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public Object getScope() {
        return this.standardTools;
    }

    public List<ILanguageObject> getListItems() {
        return this.standardTools;
    }

    public ILanguageObject getSelectedItem() {
        return this.currentlySelectedObject;
    }
}
