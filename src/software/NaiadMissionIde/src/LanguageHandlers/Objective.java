package LanguageHandlers;

import Exceptions.NullReferenceException;
import Exceptions.UnableToPreformActionException;
import Interfaces.ILanguageObject;

import javax.security.auth.Subject;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.List;
import java.util.Observable;

/**
 * Created with IntelliJ IDEA.
 * User: emil
 * Date: 11/27/13
 * Time: 7:44 AM
 * To change this template use File | Settings | File Templates.
 */
public class Objective implements ILanguageObject {

    private Path path;
    private String objectiveName;
    private List<ILanguageObject> executionalSteps;

    private List<PrimitiveVariable> inputVariables;
    private List<PrimitiveVariable> outputVariables;

    public Objective()
    {

    }

    public Objective(String name)
    {
        this.objectiveName = name;

        this.executionalSteps = new ArrayList<ILanguageObject>();
        this.inputVariables = new ArrayList<PrimitiveVariable>();
        this.outputVariables = new ArrayList<PrimitiveVariable>();
    }

    public List<ILanguageObject> getExecutionalSteps() throws NullReferenceException {
        if(this.executionalSteps != null)
            return this.executionalSteps;
        throw new NullReferenceException("this.executionalSteps");
    }

    public void AddExecutionalStep(ILanguageObject object) throws UnableToPreformActionException
    {
        if(!this.executionalSteps.add(object))
            throw new UnableToPreformActionException("Unable to add object to executional steps");
    }

    public void RemoveExecutionalStep(ILanguageObject object) throws UnableToPreformActionException
    {
        if(!this.executionalSteps.remove(object))
            throw new UnableToPreformActionException("Unable to remove object from executional steps");
    }

    @Override
    public Path getFilePath() throws NullReferenceException
    {
        if(this.path != null)
            return this.path;
        throw new NullReferenceException("this.path");
    }

    @Override
    public String toString()
    {
        return "O : " + this.objectiveName;
    }

    @Override
    public List<PrimitiveVariable> getInputVariables() {
        return this.inputVariables;
    }

    @Override
    public List<PrimitiveVariable> getOutputVariables() {
        return this.outputVariables;
    }

    @Override
    public boolean equals(Object other)
    {
        if(!this.toString().equals(other.toString()))
            return false;

        if(this.executionalSteps != ((Objective)other).executionalSteps)
            return false;

        if(this.path != ((Objective)other).path)
            return false;

        return true;
    }
}
