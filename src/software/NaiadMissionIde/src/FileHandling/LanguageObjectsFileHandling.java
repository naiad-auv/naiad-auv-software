package FileHandling;

import Interfaces.ILanguageObject;
import LanguageHandlers.Objective;
import LanguageHandlers.Primitive;

import java.io.File;
import java.nio.file.FileSystems;
import java.nio.file.Path;
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


    //TODO ska läggas i en config fil nån stans, serialisation eller nåt
    private static final Path primitivesPath = Paths.get(new File(".").getAbsolutePath(),"src", "LanguageObjects", "Primitives");
    private static final Path objectivesPath = FileSystems.getDefault().getPath(".","LanguageObjects", "Objectives");


    public static List<ILanguageObject> LoadFiles()
    {
        List<ILanguageObject> objects = loadPrimitives();
        objects.addAll(loadObjectives());
        return objects;
    }

    private static List<ILanguageObject> loadPrimitives()
    {
        List<ILanguageObject> primitives = new ArrayList<ILanguageObject>();

        File folder = new File(primitivesPath.toString());
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
        //TODO code to load objectives
        objectives.add(new Objective("Obj1"));
        objectives.add(new Objective("Obj2"));
        objectives.add(new Objective("Obj3"));

        return objectives;
    }

}
