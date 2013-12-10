package LanguageHandlers;

import Enums.ILanguageObjectType;
import Exceptions.NullReferenceException;
import Interfaces.IDrawable;
import Interfaces.ILanguageObject;
import Interfaces.ILanguageVariable;

import java.nio.file.Path;
import java.util.List;
import java.util.Observable;

/**
 * Created with IntelliJ IDEA.
 * User: emil
 * Date: 12/4/13
 * Time: 2:05 PM
 * To change this template use File | Settings | File Templates.
 */
public class Marker extends Observable implements ILanguageObject {

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
    public List<IDrawable> getInputVariables() {
        return null;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public List<IDrawable> getOutputVariables() {
        return null;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public ILanguageObjectType getType() {
        return this.type;
    }

    @Override
    public void addVariableAssignment(IDrawable predecessor, int pos) {
        //To change body of implemented methods use File | Settings | File Templates.
    }
}
