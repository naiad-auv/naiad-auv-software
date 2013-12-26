package LanguageHandlers;

import Enums.ILanguageObjectType;
import Exceptions.NullReferenceException;
import Exceptions.UnableToPreformActionException;
import Interfaces.IDrawConfig;
import Interfaces.ILanguageObject;

import java.nio.file.Path;
import java.util.ArrayList;
import java.util.List;
import java.util.Observable;
import java.util.UUID;

/**
 * Created with IntelliJ IDEA.
 * User: emil
 * Date: 11/27/13
 * Time: 7:44 AM
 * To change this template use File | Settings | File Templates.
 */
public class Objective extends Observable implements ILanguageObject {

    private UUID uid;

    private Path path;
    private String objectiveName;

    private List<ILanguageObject> executionalSteps;
    private List<IDrawConfig> inputVariables;
    private List<IDrawConfig> outputVariables;

    public Objective(String name)
    {
        this.uid = java.util.UUID.randomUUID();

        this.objectiveName = name;

        this.executionalSteps = new ArrayList<ILanguageObject>();
        this.inputVariables = new ArrayList<IDrawConfig>();
        this.outputVariables = new ArrayList<IDrawConfig>();
    }

    public Objective(Objective other) {

        this.uid = java.util.UUID.randomUUID();

        this.path = other.path;
        this.objectiveName = other.objectiveName;
        this.executionalSteps = new ArrayList<ILanguageObject>(other.executionalSteps);
        this.inputVariables = new ArrayList<IDrawConfig>(other.inputVariables);
        this.outputVariables = new ArrayList<IDrawConfig>(other.outputVariables);
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
    public List<IDrawConfig> getInputVariables() {
        return this.inputVariables;
    }

    @Override
    public List<IDrawConfig> getOutputVariables() {
        return this.outputVariables;
    }

    @Override
    public ILanguageObjectType getType() {
        return ILanguageObjectType.Objective;
    }

    @Override
    public void addVariableAssignment(IDrawConfig predecessor, int pos) {
       // this.inputVariables.get(pos).set
    }

    @Override
    public boolean equals(Object other)
    {
        if(!this.toString().equals(other.toString()))
            return false;

        if(this.executionalSteps != ((Objective)other).executionalSteps)
            return false;

        if(this.getClass() != other.getClass())
            return false;

        if(this.getUid() != ((ILanguageObject)other).getUid())
            return false;

        return this.path != ((Objective)other).path;
    }

    public UUID getUid() {
        return this.uid;
    }
}
