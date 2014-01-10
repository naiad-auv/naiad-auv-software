package Drawables;

import Abstracts.ADrawingConfiguration;
import Abstracts.ATypedObject;
import Factories.ADrawingConfigurationFactory;
import Factories.IDrawFactory;
import Interfaces.IDraw;
import Interfaces.IDrawConfig;
import Interfaces.IDrawable;

import java.awt.*;

/**
 * Created with IntelliJ IDEA.
 * User: emil
 * Date: 12/12/13
 * Time: 10:23 AM
 * To change this template use File | Settings | File Templates.
 */
public class Drawable implements IDrawable {

    ATypedObject object;

    Point position;


    ADrawingConfiguration configuration = null;
    IDraw drawer = null;

    public Drawable(ATypedObject object, Point position)
    {
        this.object = object;
        this.position = position;
    }

    @Override
    public void Draw(Graphics g)
    {
        if(configuration == null)
        {
            this.configuration = ADrawingConfigurationFactory.getInstance(object.getType(), position);
        }

        if(drawer == null)
        {
            this.drawer = IDrawFactory.getInstance(object.getType());
        }
        this.configuration.calculateSize(this.object);
        this.configuration.setText(this.object.toString());

        drawer.Draw(g,this.configuration);
    }
}
