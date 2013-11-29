package ViewModels;

import Commands.HandlePrimitiveEditorCommand;
import Exceptions.ScopeModificationNotSupported;
import FileHandling.LanguageObjectsFileHandling;
import Interfaces.ICommand;
import Interfaces.ILanguageObject;
import Interfaces.IViewModel;
import LanguageHandlers.Objective;
import LanguageHandlers.Primitive;
import Logging.ExceptionLogger;
import UserControls.LanguageObjectsList;

import javax.swing.event.ListSelectionEvent;
import javax.swing.event.ListSelectionListener;
import java.awt.event.ActionListener;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.nio.file.FileSystems;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.Dictionary;
import java.util.List;
import java.util.Observable;
import java.util.concurrent.CopyOnWriteArrayList;

/**
 * Created with IntelliJ IDEA.
 * User: emil
 * Date: 11/27/13
 * Time: 8:13 AM
 * To change this template use File | Settings | File Templates.
 */
public class LanguageObjectsListViewModel extends Observable implements IViewModel {

    private List<ILanguageObject> languageObjects;
    private ILanguageObject currentlySelectedObject;


    public ICommand handlePrimitiveEditorCommand;

    public LanguageObjectsListViewModel()
    {
        this.languageObjects = new ArrayList<ILanguageObject>();

        this.handlePrimitiveEditorCommand = new HandlePrimitiveEditorCommand();

    }

    public void reloadViewModel()
    {
        this.loadLanguageObjects();
        this.notifyObservers();
    }

    private void loadLanguageObjects()
    {
        this.languageObjects = LanguageObjectsFileHandling.LoadFiles();
        this.setChanged();
        this.notifyObservers();
    }



    public List<ILanguageObject> getListItems() {
        return this.languageObjects;
    }

    public void Initialize()
    {
        this.loadLanguageObjects();
    }

    @Override
    public void WireEvents(Object o) throws IllegalArgumentException {
        LanguageObjectsList view = (LanguageObjectsList)o;
        if(view == null)
        {
            throw new IllegalArgumentException("object argument cant be converted to LanguageObjectsList");
        }

        view.addMouseListener(new MouseAdapter() {
            @Override
            public void mouseClicked(MouseEvent event) {
                if(event.getClickCount() == 2)
                {
                    //TODO om det är en primitiv så ska editorn öppnas, annars så ska en ny tab skapas för edit av den objectiven

                    try
                    {
                        handlePrimitiveEditorCommand.setScope(new ArrayList<Object>() {{ add(currentlySelectedObject); }});
                    }
                    catch (ScopeModificationNotSupported e)
                    {
                        ExceptionLogger.Log(e);
                        return;
                    }
                    handlePrimitiveEditorCommand.execute();
                }
            }
        });

        view.addListSelectionListener(new ListSelectionListener() {
            @Override
            public void valueChanged(ListSelectionEvent listSelectionEvent) {

                if(listSelectionEvent.getValueIsAdjusting())
                {
                    return;
                }

                LanguageObjectsList source = (LanguageObjectsList)listSelectionEvent.getSource();
                if(source == null)
                {
                    System.out.println("unable to change selected item");
                    return;
                }

                currentlySelectedObject = languageObjects.get(source.getSelectedIndex());
                System.out.println("selected item changed");
            }
        });
    }

    @Override
    public Dictionary<String, ICommand> getCommandsDictionary() {
        return null;  //To change body of implemented methods use File | Settings | File Templates.
    }

    public ILanguageObject getSelectedItem() {
        return this.currentlySelectedObject;
    }
}
