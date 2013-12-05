package LanguageHandlers;

import Enums.VariableType;

import java.awt.datatransfer.DataFlavor;
import java.awt.datatransfer.Transferable;
import java.awt.datatransfer.UnsupportedFlavorException;
import java.io.IOException;

/**
 * Created with IntelliJ IDEA.
 * User: emil
 * Date: 12/5/13
 * Time: 3:31 PM
 * To change this template use File | Settings | File Templates.
 */
public class TransferableVariableTypeObject implements Transferable {
    public TransferableVariableTypeObject(VariableType objectToTransfer) {

    }

    @Override
    public DataFlavor[] getTransferDataFlavors() {
        return new DataFlavor[0];  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public boolean isDataFlavorSupported(DataFlavor dataFlavor) {
        return false;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public Object getTransferData(DataFlavor dataFlavor) throws UnsupportedFlavorException, IOException {
        return null;  //To change body of implemented methods use File | Settings | File Templates.
    }
}
