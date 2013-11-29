package ActionHandlers;

import Interfaces.ICommand;
import Interfaces.ILanguageObject;
import LanguageHandlers.TransferableLanguageObject;

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
public class LanguageObjectDropTargetListener extends DropTargetAdapter {

    private DropTarget dropTarget;
    private ICommand transferObjectHandler;

    public LanguageObjectDropTargetListener(ICommand transferObjectHandler, JComponent target) {

        this.transferObjectHandler = transferObjectHandler;
        dropTarget = new DropTarget(target, DnDConstants.ACTION_COPY, this, true, null);
    }


    public void drop(final DropTargetDropEvent event) {
        try {

            Transferable tr = event.getTransferable();

            final ILanguageObject transferObject = (ILanguageObject)tr.getTransferData(TransferableLanguageObject.languageObjectFlavor);

            if (event.isDataFlavorSupported(TransferableLanguageObject.languageObjectFlavor)) {

                event.acceptDrop(DnDConstants.ACTION_COPY);

                this.transferObjectHandler.setScope(new ArrayList<Object>() {{ add(transferObject); }});
                this.transferObjectHandler.execute();

                event.dropComplete(true);
                return;
            }
            event.rejectDrop();
        } catch (Exception e) {
            e.printStackTrace();
            event.rejectDrop();
        }
    }
}
