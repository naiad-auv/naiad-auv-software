package Factories;

import Drawables.*;
import Interfaces.IDrawable;

/**
 * Created with IntelliJ IDEA.
 * User: emil
 * Date: 12/10/13
 * Time: 1:44 PM
 * To change this template use File | Settings | File Templates.
 */

enum DrawableType
{
    DrawableVariable,
    LanguageObjectDrawable,
    LanguageVariableDrawable,
    MarkerObjectDrawable,
    TransactionObjectDrawable
}

public class IDrawableFactory {

    public static IDrawable getInstance(String type)
    {
        return null;
    }

    public static IDrawable getCopy(IDrawable other) throws IllegalArgumentException
    {
        if(other == null)
            return null;

        DrawableType type = DrawableType.valueOf(other.getClass().getSimpleName());

        switch (type)
        {
            case DrawableVariable:
                return new DrawableVariable((DrawableVariable)other);
            case LanguageObjectDrawable:
                return  new LanguageObjectDrawable((LanguageObjectDrawable)other);
            case LanguageVariableDrawable:
                return new LanguageVariableDrawable((LanguageVariableDrawable)other);
            case MarkerObjectDrawable:
                return new MarkerObjectDrawable((MarkerObjectDrawable)other);
            case TransactionObjectDrawable:
                return new TransactionObjectDrawable((TransactionObjectDrawable)other);
            default:
                throw new IllegalArgumentException("Unkown type passed to factory");
        }
    }

}
