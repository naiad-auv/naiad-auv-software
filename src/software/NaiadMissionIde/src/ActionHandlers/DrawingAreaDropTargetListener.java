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

            if (event.isDataFlavorSupported(TransferableLanguageObject.languageObjectFlavor))
            {
                final ILanguageObject transferData = (ILanguageObject)tr.getTransferData(TransferableLanguageObject.languageObjectFlavor);

                this.handleDroppedObject(event, this.transferObjectHandler, transferData);
                return;
            }

            if (event.isDataFlavorSupported(TransferableVariableTypeObject.languageVariableFlavour))
            {
                final ILanguageVariable transferData = (ILanguageVariable)tr.getTransferData(TransferableVariableTypeObject.languageVariableFlavour);

                this.handleDroppedObject(event, this.transferVariableHandler, transferData);
                return;
            }

            event.rejectDrop();

        } catch (Exception e) {
            e.printStackTrace();
            event.rejectDrop();
        }
    }

    private void handleDroppedObject(final DropTargetDropEvent event,ICommand handler, final Object transferData) throws ScopeModificationNotSupported
    {
        event.acceptDrop(DnDConstants.ACTION_COPY);

        handler.setScope(new ArrayList<Object>() {{ add(transferData); add(event); }});
        handler.execute();

        event.dropComplete(true);
    }
}
