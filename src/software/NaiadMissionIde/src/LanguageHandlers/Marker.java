package LanguageHandlers;

import Enums.ILanguageObjectType;
import Exceptions.NullReferenceException;
import Interfaces.ILanguageObject;

import java.nio.file.Path;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: emil
 * Date: 12/4/13
 * Time: 2:05 PM
 * To change this template use File | Settings | File Templates.
 */
public class Marker implements ILanguageObject {

    private ILanguageObjectType type;

    public Marker(ILanguageObjectType type)
    {
        this.type = type;
    }


    @Override
    public Path getFilePath() throws NullReferenceException {
        return null;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public List<PrimitiveVariable> getInputVariables() {
        return null;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public List<PrimitiveVariable> getOutputVariables() {
        return null;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public ILanguageObjectType getType() {
        return this.type;
    }
}
