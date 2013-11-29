package ViewModels;

import Commands.DummyCommand;
import Interfaces.ICommand;
import Interfaces.IPrimitive;
import Interfaces.IViewModel;
import Logging.ExceptionLogger;
import views.PrimitiveEditor;

import java.io.IOException;
import java.util.Dictionary;
import java.util.Hashtable;

/**
 * Created with IntelliJ IDEA.
 * User: emil
 * Date: 11/27/13
 * Time: 11:16 AM
 * To change this template use File | Settings | File Templates.
 */
public class PrimitiveEditorViewModel implements IViewModel {

    private IPrimitive scopeObject;

    private ICommand saveCommand;
    private ICommand saveAsCommand;
    private ICommand reloadCommand;

    public PrimitiveEditorViewModel()
    {
    }

    public PrimitiveEditorViewModel(IPrimitive scopeObject)
    {
        this.scopeObject = scopeObject;

        this.saveCommand = new DummyCommand("SaveCommand PrimitiveEditorViewModel");
        this.saveAsCommand = new DummyCommand("saveAsCommand PrimitiveEditorViewModel");
        this.reloadCommand = new DummyCommand("reloadCommand PrimitiveEditorViewModel");
    }

    public String getPrimitiveContents()
    {
        try {
            return this.scopeObject.getFileContents();
        } catch (IOException e) {
            ExceptionLogger.Log(e);
        }
        return "Unable to load shit";
    }

    @Override
    public void WireEvents(Object o) throws IllegalArgumentException {
        //TODO lägg till events, för
        //New, Load, Save, SaveAs, Exit

        PrimitiveEditor source = (PrimitiveEditor)o;
        if(source == null)
        {
            throw new IllegalArgumentException("unable to cast source to PrimitiveEditor");
        }

    }

    @Override
    public Dictionary<String, ICommand> getCommandsDictionary() {
        Dictionary<String, ICommand> commandsDictionary = new Hashtable<String, ICommand>();

        commandsDictionary.put("saveCommand", this.saveCommand);
        commandsDictionary.put("saveAsCommand", this.saveAsCommand);
        commandsDictionary.put("reloadCommand", this.reloadCommand);

        return commandsDictionary;

    }
}
