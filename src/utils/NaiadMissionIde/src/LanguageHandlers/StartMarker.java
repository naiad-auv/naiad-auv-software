package LanguageHandlers;

import Enums.ILanguageObjectType;
import Interfaces.ILanguageObject;

import java.awt.*;

/**
 * Created with IntelliJ IDEA.
 * User: emil
 * Date: 12/3/13
 * Time: 9:08 AM
 * To change this template use File | Settings | File Templates.
 */
public class StartMarker extends Marker implements ILanguageObject {
    public StartMarker() {
        super(ILanguageObjectType.Startmarker);
    }

    public StartMarker(StartMarker other) {
        super(other);    //To change body of overridden methods use File | Settings | File Templates.
    }
}
