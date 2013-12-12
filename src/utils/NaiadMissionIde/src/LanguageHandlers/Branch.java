package LanguageHandlers;

import Enums.ILanguageObjectType;
import Exceptions.NullReferenceException;
import Interfaces.IDrawable;
import Interfaces.ILanguageObject;
import Interfaces.ILanguageVariable;

import java.nio.file.Path;
import java.util.List;
import java.util.Observer;
import java.util.UUID;

/**
 * Created with IntelliJ IDEA.
 * User: emil
 * Date: 12/10/13
 * Time: 6:47 PM
 * To change this template use File | Settings | File Templates.
 */
public class Branch implements  ILanguageObject
{

    private UUID uid;

    private ILanguageObject trueObject;
    private ILanguageObject falseObject;

    private ILanguageVariable condition;

    public Branch()
    {
        this.uid = java.util.UUID.randomUUID();
    }

    public Branch(Branch other) {
        this.uid = java.util.UUID.randomUUID();
        this.trueObject = other.trueObject;
        this.falseObject = other.falseObject;
        this.condition = other.condition;

    }

    public void setTrueObject()
    {

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
        return ILanguageObjectType.Branch;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public void addVariableAssignment(IDrawable predecessor, int pos) {
        //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public void addObserver(Observer observer) {
        //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public UUID getUid() {
        return this.uid;  //To change body of implemented methods use File | Settings | File Templates.
    }
}
