package UserControls;

import Commands.DummyCommand;
import Commands.HandleObjectiveEditorCommand;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ComponentAdapter;
import java.awt.event.ComponentEvent;

/**
 * Created with IntelliJ IDEA.
 * User: emil
 * Date: 12/11/13
 * Time: 1:04 PM
 * To change this template use File | Settings | File Templates.
 */
public class ToolBar extends JPanel {

    StandardTypesListPresenter types;
    LanguageObjectsListPresenter languageObjects;
    StandardToolsListPresenter tools;


    public ToolBar(EJTabbedPane tabbedPane)
    {
        super();

        this.configureComponentsHolder();
        this.configureLanguageObjectsList(tabbedPane);
        this.configureVariableObjectsList();
        this.configureOtherToolsList();

        this.addComponentListener(new ComponentAdapter() {
            @Override
            public void componentResized(ComponentEvent e) {
                super.componentResized(e);    //To change body of overridden methods use File | Settings | File Templates.

                int currentSize = e.getComponent().getSize().height;

                types.setSize(new Dimension(types.getSize().width, currentSize / 3 - 10));
                languageObjects.setSize(new Dimension(languageObjects.getSize().width, currentSize / 3 - 10));
                tools.setSize(new Dimension(tools.getSize().width, currentSize / 3 - 10));

            }
        });
    }

    private void configureComponentsHolder() {

        this.setLayout(new BoxLayout(this, BoxLayout.PAGE_AXIS));
    }

    private void configureOtherToolsList()
    {
        this.tools = new StandardToolsListPresenter(new DummyCommand("ABO"));

        this.add(tools);
    }

    private void configureLanguageObjectsList(EJTabbedPane tabbedPane) {
        this.languageObjects = new LanguageObjectsListPresenter(new HandleObjectiveEditorCommand(tabbedPane));

        this.add(languageObjects);
    }

    private void configureVariableObjectsList() {
        this.types = new StandardTypesListPresenter(new DummyCommand("ABO"));

        this.add(types);
    }



}

