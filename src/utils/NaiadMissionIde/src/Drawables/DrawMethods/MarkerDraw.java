package Drawables.DrawMethods;

import Abstracts.ADrawingConfiguration;
import Interfaces.IDraw;

import java.awt.*;
import java.awt.geom.Ellipse2D;

/**
 * Created with IntelliJ IDEA.
 * User: emil
 * Date: 12/12/13
 * Time: 10:38 AM
 * To change this template use File | Settings | File Templates.
 */
public class MarkerDraw implements IDraw {
    @Override
    public void Draw(Graphics g, ADrawingConfiguration configuration) {
        Stroke baseStroke = ((Graphics2D)g).getStroke();

        Ellipse2D.Double circle = new Ellipse2D.Double(configuration.getPosition().x, configuration.getPosition().y, 50,50);

        g.setColor(configuration.getColor());
        ((Graphics2D)g).fill(circle);
        g.setColor(Color.black);
        ((Graphics2D)g).draw(circle);

        g.drawString(configuration.getText(), configuration.getPosition().x + 10, configuration.getPosition().y + 31);

        ((Graphics2D) g).setStroke(baseStroke);
    }
}
