package views;

import javax.swing.JFrame;
import javax.swing.JSplitPane;
import java.awt.BorderLayout;
import java.util.List;
import javax.swing.JPanel;
import javax.swing.JTabbedPane;

import Commands.HandleObjectiveEditorCommand;
import Exceptions.ScopeModificationNotSupported;
import Interfaces.ICommand;
import Interfaces.ILanguageObject;
import LanguageHandlers.Objective;
import UserControls.EJDrawingArea;
import Interfaces.IViewModel;
import UserControls.EJTabbedPane;
import UserControls.LanguageObjectsList;
import UserControls.MainWindowMenu;
import ViewModels.MainWindowViewModel;
import sun.reflect.generics.reflectiveObjects.NotImplementedException;

public class MainWindow {

    private IViewModel mainViewModel;

    private JFrame frame;
    private EJTabbedPane tabbedPane;

    /**
     * Create the application.
     */
    public MainWindow() {
        this.tabbedPane = new EJTabbedPane(JTabbedPane.TOP);

        initialize();

    }

    /**
     * Initialize the contents of the frame.
     */
    private void initialize() {

        this.setUpBackend();

        frame = new JFrame();
        frame.setBounds(100, 100, 640, 480);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setTitle("Penumbra v1.0 Alpha");

        frame.setJMenuBar(MainWindowMenu.getInstance());

        JSplitPane splitPane = new JSplitPane();
        frame.getContentPane().add(splitPane, BorderLayout.CENTER);

        JPanel panel = new JPanel();
        splitPane.setLeftComponent(panel);

        JSplitPane splitPane_1 = new JSplitPane();
        splitPane_1.setOrientation(JSplitPane.VERTICAL_SPLIT);
        panel.add(splitPane_1);

        splitPane_1.setTopComponent(new LanguageObjectsList(new HandleObjectiveEditorCommand(this.tabbedPane)));

        splitPane.setRightComponent(tabbedPane);
    }

    private void setUpBackend()
    {
        this.mainViewModel = new MainWindowViewModel();
    }

    public void Show() {
        this.frame.setVisible(true);
    }
}
