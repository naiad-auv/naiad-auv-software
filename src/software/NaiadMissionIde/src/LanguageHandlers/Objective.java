package LanguageHandlers;

import Interfaces.ILanguageObject;

import java.nio.file.Path;

/**
 * Created with IntelliJ IDEA.
 * User: emil
 * Date: 11/27/13
 * Time: 7:44 AM
 * To change this template use File | Settings | File Templates.
 */
public class Objective implements ILanguageObject {

    private String objectiveName;

    public Objective()
    {

    }

    public Objective(String name)
    {
        this.objectiveName = name;
    }

    @Override
    public Path getFilePath() {
        return null;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public String toString()
    {
        return "O : " + this.objectiveName;
    }
}
