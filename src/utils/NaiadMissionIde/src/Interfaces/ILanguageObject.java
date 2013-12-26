package Interfaces;

import Enums.ILanguageObjectType;
import Exceptions.NullReferenceException;

import java.nio.file.Path;
import java.util.List;
import java.util.Observer;
import java.util.UUID;

/**
 * Created with IntelliJ IDEA.
 * User: emil
 * Date: 11/27/13
 * Time: 7:44 AM
 * To change this template use File | Settings | File Templates.
 */
public interface ILanguageObject {

    public Path getFilePath() throws NullReferenceException;

    public String toString();

    public List<IDrawConfig> getInputVariables();

    public List<IDrawConfig> getOutputVariables();

    public ILanguageObjectType getType();

    public void addVariableAssignment(IDrawConfig predecessor, int pos);

    public void addObserver(Observer observer);

    public UUID getUid();
}
