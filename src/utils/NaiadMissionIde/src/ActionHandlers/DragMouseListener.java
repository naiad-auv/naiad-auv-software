package ActionHandlers;

import javax.swing.*;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;

/**
 * Created with IntelliJ IDEA.
 * User: emil
 * Date: 11/28/13
 * Time: 12:41 PM
 * To change this template use File | Settings | File Templates.
 */

public class DragMouseListener extends MouseAdapter {

    public DragMouseListener()
    {
        super();
    }

    @Override
    public void mousePressed(MouseEvent e) {
        JComponent c = (JComponent) e.getSource();
        TransferHandler handler = c.getTransferHandler();
        handler.exportAsDrag(c, e, TransferHandler.COPY);
    }
}