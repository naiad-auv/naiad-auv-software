package UserControls;

import Enums.VariableType;
import Interfaces.ICommand;
import Interfaces.ILanguageObject;
import Interfaces.ILanguageVariable;
import LanguageHandlers.TransferableLanguageObject;
import LanguageHandlers.TransferableVariableTypeObject;
import ViewModels.LanguageObjectsListViewModel;
import ViewModels.StandardTypesListViewModel;

import javax.swing.*;
import java.awt.*;
import java.awt.dnd.DnDConstants;
import java.awt.dnd.DragGestureEvent;
import java.awt.dnd.DragGestureListener;
import java.awt.dnd.DragSource;
import java.util.ArrayList;
import java.util.List;
import java.util.Observable;
import java.util.Observer;

/**
 * Created with IntelliJ IDEA.
 * User: emil
 * Date: 11/27/13
 * Time: 6:43 AM
 * To change this template use File | Settings | File Templates.
 */
public class StandardTypesList extends JList implements Observer, DragGestureListener {

    private StandardTypesListViewModel viewModel;

    private AbstractListModel items;

    private DragSource dragSource;

    public StandardTypesList()
    {
        super();

        this.viewModel = new StandardTypesListViewModel();
        this.viewModel.addObserver(this);
        this.viewModel.WireEvents(this);
        this.viewModel.Initialize();

        this.setupDragAndDrop();

        this.setVisible(true);
    }

    private void setupDragAndDrop()
    {
        this.dragSource = new DragSource();
        this.dragSource.createDefaultDragGestureRecognizer(this, DnDConstants.ACTION_COPY, this);
    }

    @Override
    public void update(Observable observable, Object o) {

        this.items = new AbstractListModel() {

            List<ILanguageVariable> values = viewModel.getListItems();

            @Override
            public int getSize() {
                return values.size();  //To change body of implemented methods use File | Settings | File Templates.
            }

            @Override
            public Object getElementAt(int i) {
                return values.get(i);  //To change body of implemented methods use File | Settings | File Templates.
            }
        };

        this.setModel(items);
    }

    public void dragGestureRecognized(DragGestureEvent event) {
        Cursor cursor = null;

        ILanguageVariable objectToTransfer = this.viewModel.getSelectedItem();

        if (event.getDragAction() == DnDConstants.ACTION_COPY) {
            cursor = DragSource.DefaultCopyDrop;
        }

        event.startDrag(cursor, new TransferableVariableTypeObject(objectToTransfer));
    }
}
