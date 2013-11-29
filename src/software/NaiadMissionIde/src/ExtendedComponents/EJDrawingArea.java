package ExtendedComponents;

import ActionHandlers.LanguageObjectDropTargetListener;
import Commands.DummyCommand;
import Interfaces.ILanguageObject;

import javax.swing.*;
import javax.swing.border.LineBorder;
import java.awt.*;

public class EJDrawingArea extends JPanel {

    private ILanguageObject dropTarget;
    private LanguageObjectDropTargetListener dropTargetListener;


    //TODO här ska en referens till motsvarande objectivs lista ligga via ett interface hämta ut innehållet och rita elementen

    public EJDrawingArea()
    {
        this.setBackground(new Color(255,255,255));
        this.setBorder(new LineBorder(Color.black));

        this.dropTargetListener = new LanguageObjectDropTargetListener(new DummyCommand("Drop recived"), this);


    }


    @Override
    public void paintComponent(Graphics g)
    {
        super.paintComponent(g);
        g.drawLine(10,10,50,50);
    }

}
