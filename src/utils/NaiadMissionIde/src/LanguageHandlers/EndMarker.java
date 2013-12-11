package LanguageHandlers;

import Enums.ILanguageObjectType;
import Interfaces.ILanguageObject;

import java.util.UUID;


/**
 * Created with IntelliJ IDEA.
 * User: emil
 * Date: 12/3/13
 * Time: 9:08 AM
 * To change this template use File | Settings | File Templates.
 */
public class EndMarker extends Marker implements ILanguageObject {


    public EndMarker() {
        super(ILanguageObjectType.Endmarker);
    }

    public EndMarker(EndMarker other)
    {
        super(other);
    }
}
