package UserControls;

import ActionHandlers.LanguageObjectDropTargetListener;
import Commands.DummyCommand;
import Commands.HandleAddDroppedILanguageObject;
import Exceptions.ScopeModificationNotSupported;
import Interfaces.ICommand;
import Interfaces.ILanguageObject;
import LanguageHandlers.Objective;
import Logging.ExceptionLogger;
import ViewModels.DrawingAreaViewModel;
import sun.reflect.generics.reflectiveObjects.NotImplementedException;

import javax.swing.*;
import javax.swing.border.LineBorder;
import java.awt.*;
import java.util.*;
import java.util.List;

public class EJDrawingArea extends JPanel implements Observer {

    private Objective currentObjective;
    private LanguageObjectDropTargetListener dropTargetListener;

    private DrawingAreaViewModel viewModel;


    //TODO här ska en referens till motsvarande objectivs lista ligga via ett interface hämta ut innehållet och rita elementen

    public EJDrawingArea(Objective objective)
    {
        this.setBackground(new Color(255,255,255));
        this.setBorder(new LineBorder(Color.black));


        this.viewModel = new DrawingAreaViewModel(objective);
        this.viewModel.addObserver(this);

        this.viewModel.WireEvents(this);

        this.dropTargetListener = new LanguageObjectDropTargetListener(new HandleAddDroppedILanguageObject(this.viewModel), this);
    }

    public ILanguageObject getScope()
    {
        return (ILanguageObject)this.viewModel.getScope();
    }

    @Override
    public void paintComponent(Graphics g)
    {
        super.paintComponent(g);
        this.viewModel.Draw(g);
    }

    @Override
    public void update(Observable observable, Object o) {
        this.repaint();
    }
}
