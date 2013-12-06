package FileHandling;

import Enums.VariableType;
import Interfaces.ILanguageObject;
import Interfaces.ILanguageVariable;
import LanguageHandlers.LanguageVariable;
import LanguageHandlers.Objective;
import LanguageHandlers.Primitive;
import Settings.CoreSettings.PenumbraCoreSettings;

import java.io.File;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: emil
 * Date: 11/27/13
 * Time: 1:20 PM
 * To change this template use File | Settings | File Templates.
 */
public class LanguageObjectsFileHandling {


    public static List<ILanguageObject> LoadFiles()
    {
        List<ILanguageObject> objects = loadPrimitives();
        objects.addAll(loadObjectives());
        return objects;
    }

    private static List<ILanguageObject> loadPrimitives()
    {
        List<ILanguageObject> primitives = new ArrayList<ILanguageObject>();

        File folder = new File(PenumbraCoreSettings.getInstance().PrimitivesPath);
        File[] listOfFiles = folder.listFiles();

        for (int i = 0; i < listOfFiles.length; i++)
        {
            if (listOfFiles[i].isFile())
            {
                primitives.add(new Primitive(listOfFiles[i].getName(), Paths.get(listOfFiles[i].getPath())));
            }
        }

        return primitives;
    }

    private static List<ILanguageObject> loadObjectives()
    {
        List<ILanguageObject> objectives = new ArrayList<ILanguageObject>();

        File folder = new File(PenumbraCoreSettings.getInstance().ObjectivesPath);
        File[] listOfFiles = folder.listFiles();

        for (int i = 0; i < listOfFiles.length; i++)
        {
            if (listOfFiles[i].isFile())
            {
                objectives.add(new Objective(listOfFiles[i].getName()));
            }
        }

        return objectives;
    }

    private static List<ILanguageVariable> loadVariableTypes()
    {
        List<ILanguageVariable> variableTypes = new ArrayList<ILanguageVariable>();

        File folder = new File(PenumbraCoreSettings.getInstance().VariableTypesPath);
        File[] listOfFiles = folder.listFiles();

        for (int i = 0; i < listOfFiles.length; i++)
        {
            if (listOfFiles[i].isFile())
            {
                variableTypes.add(new LanguageVariable(listOfFiles[i].getName()));
            }
        }

        return variableTypes;
    }

    public static List<ILanguageVariable> LoadTypes() {
        return loadVariableTypes();
    }
}
