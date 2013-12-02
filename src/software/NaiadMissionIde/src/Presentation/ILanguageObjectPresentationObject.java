package Presentation;

import Interfaces.ILanguageObject;
import LanguageHandlers.Objective;
import LanguageHandlers.Primitive;

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

    //TODO dessa ska deriveras från objectets inputs och outputs
    int width = 50;
    int height = 50;

    public ILanguageObjectPresentationObject(ILanguageObject object)
    {
        this.object = object;
    }

    public ILanguageObjectPresentationObject(ILanguageObject object, int x, int y)
    {
        this.x = x;
        this.y = y;
        this.object = object;
    }

    @Override
    public String toString() {
        return this.object.toString();
    }
}
