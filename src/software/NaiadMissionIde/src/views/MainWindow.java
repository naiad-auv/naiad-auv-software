package views;

import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JSplitPane;
import java.awt.BorderLayout;
import javax.swing.JList;
import javax.swing.JPanel;
import javax.swing.ListSelectionModel;
import javax.swing.AbstractListModel;
import javax.swing.JTabbedPane;

import ExtendedComponents.EJDrawingArea;
import Interfaces.IViewModel;
import UserControls.LanguageObjectsList;
import UserControls.MainWindowMenu;
import ViewModels.MainWindowViewModel;

public class MainWindow {

    private IViewModel mainViewModel;

    private JFrame frame;

    /**
     * Create the application.
     */
    public MainWindow() {
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

		/*JList list = new JList();
		list.setModel(new AbstractListModel() {
			String[] values = new String[] {"Item1", "Item2", "Item3", "Item4"};
			public int getSize() {
				return values.length;
			}
			public Object getElementAt(int index) {
				return values[index];
			}
		});

		list.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
		splitPane_1.setLeftComponent(list);     */

        LanguageObjectsList loList = new LanguageObjectsList();
        splitPane_1.setTopComponent(loList);

        JTabbedPane tabbedPane = new JTabbedPane(JTabbedPane.TOP);
        splitPane.setRightComponent(tabbedPane);

        JPanel panel_1 = new EJDrawingArea();
        JPanel panel_2 = new EJDrawingArea();
        JPanel panel_3 = new EJDrawingArea();

        tabbedPane.addTab("New tab1", null, panel_1, null);
        tabbedPane.addTab("New tab2", null, panel_2, null);
        tabbedPane.addTab("New tab3", null, panel_3, null);
    }

    private void setUpBackend()
    {
        this.mainViewModel = new MainWindowViewModel();
        //TODO skapa objectives listan? skicka med en ICommand för att lägga till / ta bort en drawing area från listan av drawing areas
        //TODO skapa primitiv listan? skicka med en ICommand för att lägga till / ta bort från listan i sig
    }

    public void Show() {
        this.frame.setVisible(true);
    }
}
