package ExtendedComponents;

import Interfaces.ICommand;

import javax.swing.*;
import javax.swing.border.Border;
import java.awt.*;

/**
 * Created with IntelliJ IDEA.
 * User: emil
 * Date: 11/28/13
 * Time: 8:53 AM
 * To change this template use File | Settings | File Templates.
 */
public class EPrimitiveEditorTextArea extends JTextArea {


    private ICommand getPrimitiveContents;

    private JScrollPane scrollBars;

    public EPrimitiveEditorTextArea(ICommand primitiveContentsGetter)
    {
        this.getPrimitiveContents = primitiveContentsGetter;

        this.setupVisual();
        this.initializeContent();

    }

    private void initializeContent() {
        this.setText((String) getPrimitiveContents.execute());
    }

    private void setupVisual() {

        this.setMargin(new Insets(10,10,10,10));

        this.scrollBars = new JScrollPane(this);

        this.enableInputMethods(true);
        this.setVisible(true);
    }
}
