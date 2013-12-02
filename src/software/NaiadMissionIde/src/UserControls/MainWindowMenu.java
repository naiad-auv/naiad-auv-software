package UserControls;

import javax.swing.ImageIcon;
import javax.swing.JMenuItem;

import ViewModels.MainWindowMenuViewModel;
import Interfaces.IViewModel;

public class MainWindowMenu {
	
	private static MainWindowMenu singeltonMenu;
	private static final Object lock = new Object();
	
	private static String importIconPath = "src/Artwork/Icons/importIcon.png";
	private static String exportIconPath = "src/Artwork/Icons/exportIcon.png";

	private IViewModel viewModel;
	private EJMenuBar menuBar;

	private MainWindowMenu() {
		EJMenuBar menuBar = new EJMenuBar();
		
		this.createFileMenu(menuBar);
		this.createEditMenu(menuBar);
		this.createSourceMenu(menuBar);
		this.createHelpMenu(menuBar);
		
		this.menuBar = menuBar;
		this.viewModel = new MainWindowMenuViewModel();
		this.viewModel.WireEvents(menuBar);
	}

	private void createHelpMenu(EJMenuBar menuBar) {
		EJMenu helpMenu = new EJMenu("Help");
		helpMenu.setName("helpMenu");
		menuBar.add(helpMenu);
		
		JMenuItem welcomeMenuItem = new JMenuItem("Welcome");
		welcomeMenuItem.setName("welcomeMenuItem");
		helpMenu.add(welcomeMenuItem);
		
		JMenuItem helpSectionItem = new JMenuItem("Help section");
		helpSectionItem.setName("helpMenuItem");
		helpMenu.add(helpSectionItem);
		
		JMenuItem aboutMenuItem = new JMenuItem("About");
		aboutMenuItem.setName("aboutMenuItem");
		helpMenu.add(aboutMenuItem);
	}

	private void createSourceMenu(EJMenuBar menuBar) {
		EJMenu sourceMenu = new EJMenu("Source");
		sourceMenu.setName("sourceMenu");
		menuBar.add(sourceMenu);
		
		JMenuItem menuItem_4 = new JMenuItem("New menu item");
		sourceMenu.add(menuItem_4);
		
		JMenuItem menuItem_5 = new JMenuItem("New menu item");
		sourceMenu.add(menuItem_5);
		
		JMenuItem menuItem_6 = new JMenuItem("New menu item");
		sourceMenu.add(menuItem_6);
	}

	private void createEditMenu(EJMenuBar menuBar) {
		EJMenu editMenu = new EJMenu("Edit");
		editMenu.setName("editMenu");
		menuBar.add(editMenu);
		
		JMenuItem menuItem = new JMenuItem("New menu item");
		editMenu.add(menuItem);
		
		JMenuItem menuItem_1 = new JMenuItem("New menu item");
		editMenu.add(menuItem_1);
		
		JMenuItem menuItem_2 = new JMenuItem("New menu item");
		editMenu.add(menuItem_2);
		
		JMenuItem menuItem_3 = new JMenuItem("New menu item");
		editMenu.add(menuItem_3);
	}

	private void createFileMenu(EJMenuBar menuBar) {
		EJMenu fileMenuBar = new EJMenu("File");
		fileMenuBar.setName("fileMenu");
		menuBar.add(fileMenuBar);
		
		JMenuItem newMenuItem = new JMenuItem("New");
		newMenuItem.setName("newMenuItem");
		fileMenuBar.add(newMenuItem);
		
		JMenuItem openMenuItem = new JMenuItem("Open");
		openMenuItem.setName("openMenuItem");
		fileMenuBar.add(openMenuItem);
		
		JMenuItem saveMenuItem = new JMenuItem("Save");
		saveMenuItem.setName("saveMenuItem");
		fileMenuBar.add(saveMenuItem);

		JMenuItem saveAsMenuItem = new JMenuItem("Save As");
		saveAsMenuItem.setName("saveAsMenuItem");
		fileMenuBar.add(saveAsMenuItem);
		
		fileMenuBar.addSeparator();
		
		JMenuItem importMenuItem = new JMenuItem("Import", new ImageIcon(importIconPath));
		importMenuItem.setName("importMenuItem");
		fileMenuBar.add(importMenuItem);
		
		JMenuItem exportMenuItem = new JMenuItem("Export", new ImageIcon(exportIconPath));
		exportMenuItem.setName("exportMenuItem");
		fileMenuBar.add(exportMenuItem);
		
		fileMenuBar.addSeparator();
		
		JMenuItem exitMenuItem = new JMenuItem("Exit");
		exitMenuItem.setName("exitMenuItem");
		fileMenuBar.add(exitMenuItem);
	}

	public static EJMenuBar getInstance()
	{
		if(MainWindowMenu.singeltonMenu == null)
		{
			synchronized(lock)
			{
				MainWindowMenu.singeltonMenu = new MainWindowMenu();
			}
		}
		return MainWindowMenu.singeltonMenu.menuBar;
	}
}
