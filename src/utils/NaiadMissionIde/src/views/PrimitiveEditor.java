package views;

import Exceptions.ScopeModificationNotSupported;
import UserControls.EPrimitiveEditorEditorArea;
import UserControls.EPrimitiveEditorMenu;
import Interfaces.ICommand;
import Interfaces.IPrimitive;
import Interfaces.IViewModel;
import ViewModels.PrimitiveEditorViewModel;
import sun.reflect.generics.reflectiveObjects.NotImplementedException;

import javax.swing.*;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: emil
 * Date: 11/27/13
 * Time: 10:29 AM
 * To change this template use File | Settings | File Templates.
 */
public class PrimitiveEditor extends JFrame {

    private IViewModel viewModel;

    private JTextArea editorArea;

    public PrimitiveEditor(IPrimitive primitive)
    {
        this.setUpBackend(primitive);
        Initialize();
    }

    private void Initialize() {
        this.setBounds(100, 100, 640, 480);
        this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        this.setTitle("Penumbra primitive editor v1.0 Alpha");

        this.setDefaultCloseOperation(DISPOSE_ON_CLOSE);
        this.getContentPane().setLayout(new BoxLayout(this.getContentPane(), BoxLayout.PAGE_AXIS));

        this.add(new EPrimitiveEditorEditorArea(new ICommand() {
            @Override
            public Object execute() throws NotImplementedException {
                return ((PrimitiveEditorViewModel)viewModel).getPrimitiveContents();
            }

            @Override
            public void setScope(List<Object> scopeObjects) throws ScopeModificationNotSupported {
                throw new ScopeModificationNotSupported("getPrimitiveContentsCommand in PrimitiveEditor");
            }
        }));

        this.add(new EPrimitiveEditorMenu(this.viewModel.getCommandsDictionary()));

        this.setResizable(false);

    }

    private void setUpBackend(IPrimitive primitive) {
        this.viewModel = new PrimitiveEditorViewModel(primitive);
        this.viewModel.WireEvents(this);
    }
}
