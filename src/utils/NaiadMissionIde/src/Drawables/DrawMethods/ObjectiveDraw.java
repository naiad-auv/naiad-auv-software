package Drawables.DrawMethods;

import Abstracts.ADrawingConfiguration;
import Interfaces.IDraw;
import Settings.CoreSettings.PenumbraCoreSettings;

import java.awt.*;

/**
 * Created with IntelliJ IDEA.
 * User: emil
 * Date: 12/12/13
 * Time: 10:38 AM
 * To change this template use File | Settings | File Templates.
 */
public class ObjectiveDraw implements IDraw {
    @Override
    public void Draw(Graphics g, ADrawingConfiguration configuration) {
        Stroke baseStroke = ((Graphics2D)g).getStroke();

        Graphics canvas =  g.create(configuration.getPosition().x, configuration.getPosition().y, configuration.getWidth(), configuration.getHeight());

        canvas.setColor(new Color(240,95,216));
        canvas.fillRoundRect(0, 10, configuration.getWidth() - 1, configuration.getHeight() - 20, 5, 5);
        canvas.setColor(new Color(148,18,126));
        canvas.drawRoundRect(0, 10, configuration.getWidth() - 1, configuration.getHeight() - 20, 5, 5);

        canvas.setColor(Color.BLACK);


        canvas.setFont(new Font(Font.SERIF, Font.BOLD, PenumbraCoreSettings.getInstance().FontSize));
        canvas.drawString(configuration.getText(), 3, configuration.getHeight() / 2 + 3);

        ((Graphics2D) g).setStroke(baseStroke);
    }
}
