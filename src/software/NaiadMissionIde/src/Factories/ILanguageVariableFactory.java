package Factories;

import Interfaces.ILanguageVariable;
import LanguageHandlers.LanguageVariable;

/**
 * Created with IntelliJ IDEA.
 * User: emil
 * Date: 12/10/13
 * Time: 2:37 PM
 * To change this template use File | Settings | File Templates.
 */

enum VariableType
{
    LanguageVariable
}

public class ILanguageVariableFactory {

    public static ILanguageVariable getCopy(ILanguageVariable other)
    {
        if(other == null)
            return null;

        VariableType type = VariableType.valueOf(other.getClass().getSimpleName());

        switch (type)
        {
            case LanguageVariable:
                return new LanguageVariable((LanguageVariable)other);
            default:
                throw new IllegalArgumentException("argument type not supported");
        }

    }
}
