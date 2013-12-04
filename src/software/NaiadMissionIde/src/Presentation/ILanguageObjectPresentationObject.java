package Presentation;

import Interfaces.ILanguageObject;
import LanguageHandlers.Objective;
import LanguageHandlers.Primitive;
import Settings.CoreSettings.PenumbraCoreSettings;

import java.awt.*;
import java.awt.font.FontRenderContext;
import java.awt.geom.AffineTransform;
import java.nio.file.Path;

/**
 * Created with IntelliJ IDEA.
 * User: emil
 * Date: 12/2/13
 * Time: 8:16 AM
 * To change this template use File | Settings | File Templates.
 */
public class ILanguageObjectPresentationObject
{
    ILanguageObject object;

    int x;
    int y;

    int width;
    int height;

    public ILanguageObjectPresentationObject(ILanguageObject object)
    {
        this.object = object;
        this.calculateDrawingSize(object);
    }

    public ILanguageObjectPresentationObject(ILanguageObject object, int x, int y)
    {
        this.x = x;
        this.y = y;
        this.object = object;

        this.calculateDrawingSize(object);
    }

    private void calculateDrawingSize(ILanguageObject object)
    {
        this.width = calculateDrawingWidth(object);
        this.height = calculateDrawingHeight(object);
    }

    private static int calculateDrawingHeight(ILanguageObject object)
    {
        int height = PenumbraCoreSettings.getInstance().FontSize + 60;
        return height;
    }

    private static int calculateDrawingWidth(ILanguageObject object)
    {
        int width = 0;

        width = Math.max(width, calculateNameWidth(object) + 9);
        width = Math.max(width, object.getInputVariables().size() * 10 + 20);
        width = Math.max(width, object.getOutputVariables().size() * 10 + 20);

        return width;
    }

    private static int calculateNameWidth(ILanguageObject object)
    {
        FontRenderContext frc = new FontRenderContext( new AffineTransform(),true,true);
        Font font = new Font(Font.SERIF, Font.BOLD, PenumbraCoreSettings.getInstance().FontSize);

        return (int)(font.getStringBounds(object.toString(), frc).getWidth());
    }

    public void Draw(Graphics g)
    {
        Graphics canvas =  g.create(this.x, this.y, this.width, this.height);

        canvas.setColor(new Color(240,95,216));
        canvas.fillRoundRect(0, 10, this.width - 1, this.height - 20, 5, 5);
        canvas.setColor(new Color(148,18,126));
        canvas.drawRoundRect(0, 10, this.width - 1, this.height - 20, 5, 5);

        canvas.setColor(Color.BLACK);


        canvas.setFont(new Font(Font.SERIF, Font.BOLD, PenumbraCoreSettings.getInstance().FontSize));
        canvas.drawString(this.toString(), 3, this.height / 2 + 3);

        for(int i = 0; i < this.object.getInputVariables().size(); i++)
        {
            canvas.drawLine((i + 1) * this.width/(this.object.getInputVariables().size() + 1),0,(i + 1) * this.width/(this.object.getInputVariables().size() + 1), 20);
            canvas.drawString(this.object.getInputVariables().get(i).getVariablePrefix(),(i + 1) * this.width/(this.object.getInputVariables().size() + 1) + 3, 23);
        }


        for(int i = 0; i < this.object.getOutputVariables().size(); i++)
        {
            canvas.drawLine((i + 1) * this.width/(this.object.getInputVariables().size() + 1),this.height - 20,(i + 1) * this.width/(this.object.getInputVariables().size() + 1), this.height);
            canvas.drawString(this.object.getInputVariables().get(i).getVariablePrefix(),(i + 1) * this.width/(this.object.getInputVariables().size() + 1) + 3, this.height - 17);
        }
    }

    @Override
    public String toString() {
        return this.object.toString();
    }

    public boolean isPointInside(Point point) {
        return (point.x > this.x && point.x < this.x + this.width &&
                point.y > this.y && point.y < this.y + this.height);
    }

    public Point getPredecessorPosition()
    {
        return new Point(this.x + this.width, this.y + this.height/2);
    }

    public Point getSuccessorPosition()
    {
        return new Point(this.x, this.y + this.height /2);
    }
}
