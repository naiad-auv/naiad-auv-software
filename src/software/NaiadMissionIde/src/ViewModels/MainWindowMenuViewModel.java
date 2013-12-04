package ViewModels;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.Dictionary;

import Commands.*;
import Exceptions.ItemNotFoundException;
import Interfaces.ICommand;
import Interfaces.IViewModel;
import Logging.ExceptionLogger;
import UserControls.EJMenu;
import UserControls.EJMenuBar;

public class MainWindowMenuViewModel implements IViewModel
{
	private ICommand handleAboutMenu;
	private ICommand handleHelpMenu;
	private ICommand handleWelcomeMenu;

	private ICommand handleExitMenu;
	
	//TODO skapa kommandon för alla dessa
	private ICommand handleNewMenu;
	private ICommand handleOpenMenu;
	private ICommand handleSaveMenu;
	private ICommand handleSaveAsMenu;
	private ICommand handleImportMenu;
	private ICommand handleExportMenu;
	
	public MainWindowMenuViewModel()
	{
		this.handleAboutMenu = new HandleAboutMenuCommand();
		this.handleHelpMenu = new HandleHelpSectionCommand();
		this.handleWelcomeMenu = new HandleWelcomeMenuCommand(); 
		
		this.handleExitMenu = new HandleExitMenuCommand();
	}
	
	public void WireEvents(Object o) throws IllegalArgumentException
	{
		EJMenuBar menuBar = (EJMenuBar)o;
		if(menuBar == null)
		{
			throw new IllegalArgumentException("menuBar");
		}

		try 
		{
			this.WireFileEvents(menuBar.getItem("fileMenu"));
			this.WireEditEvents(menuBar.getItem("editMenu"));
			this.WireSourceEvents(menuBar.getItem("sourceMenu"));
			this.WireAboutEvents(menuBar.getItem("helpMenu"));	
		} 
		catch (ItemNotFoundException e) 
		{
            ExceptionLogger.Log(e);
        }
	}

    @Override
    public Dictionary<String, ICommand> getCommandsDictionary() {
        return null;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public Object getScope() {
        return null;  //To change body of implemented methods use File | Settings | File Templates.
    }

    private void WireFileEvents(EJMenu fileMenu) throws ItemNotFoundException
	{
		fileMenu.getItem("exitMenuItem").addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				handleExitMenu.execute();
			}
		});
	}

	private void WireEditEvents(EJMenu editMenu)
	{
		
	}
	
	private void WireSourceEvents(EJMenu sourceMenu)
	{
	}
	
	private void WireAboutEvents(EJMenu aboutMenu) throws ItemNotFoundException
	{
		aboutMenu.getItem("aboutMenuItem").addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				handleAboutMenu.execute();
			}
		});
		
		aboutMenu.getItem("welcomeMenuItem").addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				handleWelcomeMenu.execute();
			}
		});
		
		aboutMenu.getItem("helpMenuItem").addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				handleHelpMenu.execute();
			}
		});
	}
}
