package ExtendedComponents;

import Interfaces.ICommand;

import javax.swing.*;
import java.awt.*;

/**
 * Created with IntelliJ IDEA.
 * User: emil
 * Date: 11/28/13
 * Time: 10:09 AM
 * To change this template use File | Settings | File Templates.
 */
public class EPrimitiveEditorEditorArea extends JComponent {

    private EPrimitiveEditorTextArea textArea;
    private JScrollPane scrollPane;

    public EPrimitiveEditorEditorArea(ICommand contentGetter)
    {
        this.textArea = new EPrimitiveEditorTextArea(contentGetter);

        this.scrollPane = new JScrollPane(this.textArea);
        this.scrollPane.setPreferredSize(new Dimension(628,400));
        this.scrollPane.setHorizontalScrollBarPolicy(ScrollPaneConstants.HORIZONTAL_SCROLLBAR_AS_NEEDED);
        this.scrollPane.setVerticalScrollBarPolicy(ScrollPaneConstants.VERTICAL_SCROLLBAR_ALWAYS);

        this.add(this.scrollPane);

        this.setLayout(new FlowLayout());

        this.setVisible(true);
    }
}
