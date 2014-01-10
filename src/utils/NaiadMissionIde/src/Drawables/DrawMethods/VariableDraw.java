package Drawables.DrawMethods;

import Abstracts.ADrawingConfiguration;
import Interfaces.IDraw;
import Settings.CoreSettings.PenumbraCoreSettings;

import java.awt.*;
import java.awt.geom.Line2D;

/**
 * Created with IntelliJ IDEA.
 * User: emil
 * Date: 12/12/13
 * Time: 10:38 AM
 * To change this template use File | Settings | File Templates.
 */
public class VariableDraw implements IDraw {
    @Override
    public void Draw(Graphics g, ADrawingConfiguration configuration) {
        Stroke baseStroke = ((Graphics2D)g).getStroke();


        g.setColor(configuration.getColor());
        g.fillOval(configuration.getPosition().x, configuration.getPosition().y, configuration.getWidth(), configuration.getHeight());
        g.setColor(Color.black);
        g.drawOval(configuration.getPosition().x, configuration.getPosition().y, configuration.getWidth(), configuration.getHeight());
        g.setFont(new Font(Font.SERIF, Font.PLAIN, PenumbraCoreSettings.getInstance().FontSize));
        g.drawString(configuration.getText(),configuration.getPosition().x  + 10, configuration.getPosition().y + configuration.getHeight() / 2 + 6);

        ((Graphics2D) g).setStroke(baseStroke);
    }
}
