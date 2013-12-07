package Factories;

import Drawables.LanguageVariableDrawable;
import Interfaces.ILanguageVariable;
import LanguageHandlers.LanguageVariable;
import Settings.CoreSettings.PenumbraCoreSettings;

import java.awt.*;
import java.io.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: emil
 * Date: 12/6/13
 * Time: 9:50 AM
 * To change this template use File | Settings | File Templates.
 */
public class DrawableLanguageVariableObjectFactory {

    private enum FileContentsIdentifiers
    {
        DEFAULT,
        PREFIX,
        NAME,
        COLOR,
        STATIC,
        PATTERN
    }


    public static LanguageVariableDrawable getObject(String variableType)
    {
        return DrawableLanguageVariableObjectFactory.getInstance(variableType);
    }

    private static LanguageVariableDrawable getInstance(String variableType) {

        ILanguageVariable variable = new LanguageVariable();
        LanguageVariableDrawable output = new LanguageVariableDrawable(variable);

        String[] lines = getFileContents(variableType);

        for(int i = 0; i < lines.length; i++)
        {
            String[] lineContents = lines[i].split(":");

            if(lineContents == null || lineContents[0] == null || lineContents[0].equals(""))
                continue;

            switch (FileContentsIdentifiers.valueOf(lineContents[0].toUpperCase()))
            {
                case DEFAULT:
                    variable.setValue(lineContents[1]);
                    break;
                case PREFIX:
                    variable.setPrefix(lineContents[1]);
                    break;
                case NAME:
                    variable.setName(lineContents[1]);
                    break;
                case COLOR:
                    String[] components = lineContents[1].split(",");
                    output.setColor(new Color(Integer.parseInt(components[0]),Integer.parseInt(components[1]),Integer.parseInt(components[2])));
                    break;
                case STATIC:
                    variable.setStatic(lineContents[1].toUpperCase().equals("TRUE"));
                    break;
                case PATTERN:
                    variable.setPattern(lineContents[1]);
                    break;
                default:
                    System.out.println("Error in variable type on line number" + (i + 1));
            }
        }

        return output;
    }

    private static String[] getFileContents(String variableType) {
        try {
        FileReader fileReader = new FileReader(getVariableFilePath(variableType));
        BufferedReader bufferedReader = new BufferedReader(fileReader);
        List<String> lines = new ArrayList<String>();
        String line;

            while ((line = bufferedReader.readLine()) != null) {
                lines.add(line);
            }

            bufferedReader.close();
            return lines.toArray(new String[lines.size()]);
        } catch (IOException e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        }

        return null;
    }

    private static String getVariableFilePath(String variableType) throws FileNotFoundException {
        File folder = new File(PenumbraCoreSettings.getInstance().VariableTypesPath);
        File[] listOfFiles = folder.listFiles();

        for (int i = 0; i < listOfFiles.length; i++)
        {
            if (listOfFiles[i].isFile() && listOfFiles[i].getName().equals(variableType))
            {
                return listOfFiles[i].getAbsolutePath();
            }
        }

        throw new FileNotFoundException();
    }
}
