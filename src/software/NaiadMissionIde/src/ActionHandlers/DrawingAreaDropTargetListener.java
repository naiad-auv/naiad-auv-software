package ActionHandlers;

import Drawables.LanguageObjectDrawable;
import Exceptions.ScopeModificationNotSupported;
import Interfaces.ICommand;
import Interfaces.IDrawable;
import Interfaces.ILanguageObject;
import Interfaces.ILanguageVariable;
import LanguageHandlers.TransferableLanguageObject;
import LanguageHandlers.TransferableVariableTypeObject;

import javax.swing.*;
import java.awt.datatransfer.Transferable;
import java.awt.dnd.DnDConstants;
import java.awt.dnd.DropTarget;
import java.awt.dnd.DropTargetAdapter;
import java.awt.dnd.DropTargetDropEvent;
import java.util.ArrayList;

/**
 * Created with IntelliJ IDEA.
 * User: emil
 * Date: 11/28/13
 * Time: 1:14 PM
 * To change this template use File | Settings | File Templates.
 */
public class DrawingAreaDropTargetListener extends DropTargetAdapter {

    private DropTarget dropTarget;
    private ICommand transferObjectHandler;
    private ICommand transferVariableHandler;

    public DrawingAreaDropTargetListener(ICommand transferObjectHandler, ICommand transferVariableHandler, JComponent target) {

        this.transferObjectHandler = transferObjectHandler;
        this.transferVariableHandler = transferVariableHandler;
        this.dropTarget = new DropTarget(target, DnDConstants.ACTION_COPY, this, true, null);
    }


    public void drop(final DropTargetDropEvent event) {
        try {

            Transferable tr = event.getTransferable();

            try
            {
                final ILanguageObject transferData = (ILanguageObject)tr.getTransferData(TransferableLanguageObject.languageObjectFlavor);

                if(transferData != null && ILanguageObjectDropped(event, transferData))
                {
                    return;
                }
            }
            catch(Exception e)
            {
            }

            try
            {
                final ILanguageVariable transferData = (ILanguageVariable)tr.getTransferData(TransferableVariableTypeObject.languageVariableFlavour);

                if(transferData != null && ILanguageVariableDropped(event, transferData))
                {
                    return;
                }
            }
            catch(Exception e)
            {
            }



            event.rejectDrop();
        } catch (Exception e) {
            e.printStackTrace();
            event.rejectDrop();
        }
    }

    private boolean ILanguageVariableDropped(final DropTargetDropEvent event,final ILanguageVariable transferData) throws ScopeModificationNotSupported
    {
        if (event.isDataFlavorSupported(TransferableVariableTypeObject.languageVariableFlavour)) {

            event.acceptDrop(DnDConstants.ACTION_COPY);

            this.transferVariableHandler.setScope(new ArrayList<Object>() {{ add(transferData); add(event); }});
            this.transferVariableHandler.execute();

            event.dropComplete(true);
            return true;
        }
        return false;
    }

    private boolean ILanguageObjectDropped(final DropTargetDropEvent event, final ILanguageObject transferData) throws ScopeModificationNotSupported {
        if (event.isDataFlavorSupported(TransferableLanguageObject.languageObjectFlavor)) {

            event.acceptDrop(DnDConstants.ACTION_COPY);

            this.transferObjectHandler.setScope(new ArrayList<Object>() {{ add(transferData); add(event); }});
            this.transferObjectHandler.execute();

            event.dropComplete(true);
            return true;
        }
        return false;
    }
}
