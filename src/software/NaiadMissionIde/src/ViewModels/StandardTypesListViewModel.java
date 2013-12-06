package ViewModels;

import Commands.HandlePrimitiveEditorCommand;
import Enums.VariableType;
import FileHandling.LanguageObjectsFileHandling;
import Interfaces.ICommand;
import Interfaces.ILanguageObject;
import Interfaces.ILanguageVariable;
import Interfaces.IViewModel;
import LanguageHandlers.Objective;
import LanguageHandlers.Primitive;
import Logging.ExceptionLogger;
import UserControls.LanguageObjectsList;
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
public class StandardTypesListViewModel extends Observable implements IViewModel {

    private List<ILanguageVariable> typeObjects;
    private ILanguageVariable currentlySelectedObject;

    public StandardTypesListViewModel()
    {

    }

    public void Initialize()
    {
        this.typeObjects = LanguageObjectsFileHandling.LoadTypes();
        this.setChanged();
        this.notifyObservers();
    }

    @Override
    public void WireEvents(Object o) throws IllegalArgumentException {
        StandardTypesList view = (StandardTypesList)o;
        if(view == null)
        {
            throw new IllegalArgumentException("object argument cant be converted to LanguageObjectsList");
        }

        view.addMouseListener(new MouseAdapter() {
            @Override
            public void mouseClicked(MouseEvent event) {

            }
        });

        view.addListSelectionListener(new ListSelectionListener() {
            @Override
            public void valueChanged(ListSelectionEvent listSelectionEvent) {

                StandardTypesList source = (StandardTypesList)listSelectionEvent.getSource();
                if(source == null)
                {
                    System.out.println("unable to change selected item");
                    return;
                }

                currentlySelectedObject = typeObjects.get(source.getSelectedIndex());
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
        return this.typeObjects;
    }

    public List<ILanguageVariable> getListItems() {
        return this.typeObjects;
    }

    public ILanguageVariable getSelectedItem() {
        return this.currentlySelectedObject;
    }
}
