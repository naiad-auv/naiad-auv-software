package Abstracts;

import Settings.CoreSettings.PenumbraCoreSettings;

import java.awt.*;
import java.awt.font.FontRenderContext;
import java.awt.geom.AffineTransform;

/**
 * Created with IntelliJ IDEA.
 * User: emil
 * Date: 12/4/13
 * Time: 3:49 PM
 * To change this template use File | Settings | File Templates.
 */
public abstract class ADrawingConfiguration {

    Point position;
    int width;
    int height;
    Color color;
    private String text;

    public ADrawingConfiguration(Point position, int width, int height, Color color)
    {
        this.position = position;
        this.width = width;
        this.height = height;
        this.color = color;
    }

    public Point getPosition()
    {
        return this.position;
    }

    public void setPosition(Point position)
    {
        this.position = position;
    }

    public int getWidth()
    {
        return this.width;
    }

    public void setWidth(int width)
    {
        this.width = width;
    }

    public int getHeight()
    {
        return this.height;
    }

    public void setHeight(int height)
    {
        this.height = height;
    }

    public Color getColor()
    {
        return this.color;
    }

    void setColor(Color color)
    {
        this.color = color;
    }

    public void calculateSize(ATypedObject object)
    {
        String name = object.toString();

        this.height = this.calculateDrawingHeight();
        this.width = this.calculateNameWidth(name);

    }


    private static int calculateDrawingHeight()
    {
        int height = PenumbraCoreSettings.getInstance().FontSize + 60;
        return height;
    }

    private int calculateNameWidth(String name)
    {
        FontRenderContext frc = new FontRenderContext( new AffineTransform(),true,true);
        Font font = new Font(Font.SERIF, Font.BOLD, PenumbraCoreSettings.getInstance().FontSize);

        return (int)(font.getStringBounds(name.toString(), frc).getWidth());
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getText() {
        return text;
    }
}
