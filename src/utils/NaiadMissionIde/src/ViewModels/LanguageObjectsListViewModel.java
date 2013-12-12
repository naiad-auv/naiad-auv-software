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


    private ICommand handlePrimitiveEditorCommand;
    private ICommand handleObjectiveEditorCommand;

    public LanguageObjectsListViewModel(ICommand handleObjectiveEditorCommand)
    {
        this.languageObjects = new ArrayList<ILanguageObject>();

        this.handlePrimitiveEditorCommand = new HandlePrimitiveEditorCommand();
        this.handleObjectiveEditorCommand = handleObjectiveEditorCommand;

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
                    try
                    {
                        if((Primitive)currentlySelectedObject != null)
                        {
                            try
                            {
                                handlePrimitiveEditorCommand.setScope(new ArrayList<Object>() {{ add(currentlySelectedObject); }});
                                handlePrimitiveEditorCommand.execute();
                            }
                            catch(Exception e)
                            {
                                ExceptionLogger.Log(e);
                                return;
                            }
                        }
                            return;
                    }
                    catch(Exception e)
                    {
                    }

                    try
                    {
                        if((Objective)currentlySelectedObject != null)
                        {
                            try
                            {
                                handleObjectiveEditorCommand.setScope(new ArrayList<Object>() {{ add(currentlySelectedObject); }});
                                handleObjectiveEditorCommand.execute();
                            }
                            catch(Exception e)
                            {
                                ExceptionLogger.Log(e);
                                return;
                            }
                            return;
                        }
                    }
                    catch(Exception e)
                    {
                    }

                    throw new IllegalArgumentException();
                }
            }
        });

        view.addListSelectionListener(new ListSelectionListener() {
            @Override
            public void valueChanged(ListSelectionEvent listSelectionEvent) {

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

    @Override
    public Object getScope() {
        return this.languageObjects;
    }

    public ILanguageObject getSelectedItem() {
        return this.currentlySelectedObject;
    }
}
