package UserControls;

import ActionHandlers.DrawingAreaDropTargetListener;
import Commands.HandleAddDroppedILanguageObject;
import Commands.HandleAddDroppedILanguageVariable;
import Interfaces.ILanguageObject;
import LanguageHandlers.Objective;
import ViewModels.DrawingAreaViewModel;

import javax.swing.*;
import javax.swing.border.LineBorder;
import java.awt.*;
import java.util.*;

public class EJDrawingArea extends JPanel implements Observer {

    private DrawingAreaViewModel viewModel;

    public EJDrawingArea(Objective objective)
    {
        this.setBackground(new Color(255,255,255));
        this.setBorder(new LineBorder(Color.black));


        this.viewModel = new DrawingAreaViewModel(objective);
        this.viewModel.addObserver(this);

        this.viewModel.WireEvents(this);

        new DrawingAreaDropTargetListener(new HandleAddDroppedILanguageObject(this.viewModel), new HandleAddDroppedILanguageVariable(this.viewModel), this);
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
