package ExtendedComponents;

import Commands.DummyCommand;
import Interfaces.ICommand;

import javax.swing.*;
import java.awt.*;
import java.util.Dictionary;

/**
 * Created with IntelliJ IDEA.
 * User: emil
 * Date: 11/27/13
 * Time: 2:37 PM
 * To change this template use File | Settings | File Templates.
 */
public class EPrimitiveEditorMenu extends JPanel {

    private EPrimitiveEditorMenuButton saveButton;
    private EPrimitiveEditorMenuButton saveAsButton;
    private EPrimitiveEditorMenuButton reloadButton;

    public EPrimitiveEditorMenu(Dictionary<String, ICommand> commands)
    {
        this.setLayout(new FlowLayout());
        this.createComponents(commands.get("saveCommand"), commands.get("saveAsCommand"), commands.get("reloadCommand"));
        this.wireEvents();

        this.addComponents();
    }

    private void addComponents() {

        this.add(this.saveButton);
        this.add(this.saveAsButton);
        this.add(this.reloadButton);

    }

    private void createComponents(ICommand saveCommand, ICommand saveAsCommand, ICommand reloadCommand) {

        this.saveButton = new EPrimitiveEditorMenuButton(saveCommand, "Save");
        this.saveAsButton = new EPrimitiveEditorMenuButton(saveAsCommand, "Save As");
        this.reloadButton = new EPrimitiveEditorMenuButton(reloadCommand, "Reload");

    }

    private void wireEvents()
    {
    }
}
