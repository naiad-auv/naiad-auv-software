package Commands;

import Exceptions.ScopeModificationNotSupported;
import Interfaces.ICommand;
import Interfaces.ILanguageObject;
import Interfaces.IPrimitive;
import views.PrimitiveEditor;

import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: emil
 * Date: 11/27/13
 * Time: 10:02 AM
 * To change this template use File | Settings | File Templates.
 */
public class HandlePrimitiveEditorCommand implements ICommand {

    private IPrimitive scopeObject;

    @Override
    public Object execute() {
        PrimitiveEditor pe = new PrimitiveEditor(scopeObject);
        pe.setVisible(true);
        pe.requestFocus();
        pe.toFront();
        pe.repaint();

        return null;
    }

    @Override
    public void setScope(List<Object> scopeObjects) throws ScopeModificationNotSupported
    {
        if(scopeObjects.size() > 1)
        {
            throw new ScopeModificationNotSupported("To many arguments passed to HandlePrimitiveEditorCommand");
        }

        this.scopeObject = (IPrimitive)scopeObjects.get(0);
    }
}
