package Interfaces;

import Enums.ILanguageObjectType;
import Exceptions.NullReferenceException;

import java.nio.file.Path;
import java.util.List;

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

    public List<ILanguageVariable> getInputVariables();

    public List<ILanguageVariable> getOutputVariables();

    public ILanguageObjectType getType();
}
