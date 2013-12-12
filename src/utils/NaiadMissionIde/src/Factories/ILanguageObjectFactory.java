package Factories;

import Interfaces.ILanguageObject;
import LanguageHandlers.*;

/**
 * Created with IntelliJ IDEA.
 * User: emil
 * Date: 12/10/13
 * Time: 1:45 PM
 * To change this template use File | Settings | File Templates.
 */

enum ClassType
{
    EndMarker,
    StartMarker,
    Marker,
    LanguageVariable,
    Objective,
    Primitive,
    TransferableLanguageObject,
    TransferableVariableTypeObject,
    Branch
}

public class ILanguageObjectFactory {

    public static ILanguageObject getCopy(ILanguageObject other) throws IllegalArgumentException
    {
        if(other == null)
            return null;

        ClassType type = ClassType.valueOf(other.getClass().getSimpleName());

        switch(type)
        {
            case Primitive:
                return new Primitive((Primitive)other);
            case Objective:
                return new Objective((Objective)other);
            case EndMarker:
                return new EndMarker((EndMarker)other);
            case StartMarker:
                return new StartMarker((StartMarker)other);
            case Marker:
                return new Marker((Marker)other);
            case LanguageVariable:
                throw new IllegalArgumentException("Unable to copy LanguageVariable in this factory");
            case TransferableVariableTypeObject:
                throw new IllegalArgumentException("unable to copy TransferableVariableTypeObject in this factory");
            case TransferableLanguageObject:
                return new TransferableLanguageObject((TransferableLanguageObject)other);
            case Branch:
                return new Branch((Branch)other);
            default:
                throw new IllegalArgumentException("arugment type not supported");
        }
    }
}
