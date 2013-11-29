package LanguageHandlers;

import Interfaces.ILanguageObject;
import Interfaces.IPrimitive;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.nio.file.Path;
import java.util.ArrayList;

public class Primitive implements IPrimitive, ILanguageObject{

    private String primitiveName;
    private ArrayList<PrimitiveVariable> primitiveInputs;
    private ArrayList<PrimitiveVariable> primitiveOutputs;

    private final Path filePath;

    public Primitive(String name, Path path)
    {
        this.primitiveName = name;
        this.filePath = path;
    
        this.loadFile();
    }

    @Override
    public Path getFilePath() {
        return this.filePath;
    }

    @Override
    public String toString()
    {
        return "P : " + this.primitiveName;
    }

    @Override
    public String getFileContents() throws IOException {
        BufferedReader br = new BufferedReader(new FileReader(this.getFilePath().toString()));
        try {
            StringBuilder sb = new StringBuilder();
            String line = br.readLine();

            while (line != null) {
                sb.append(line);
                sb.append('\n');
                line = br.readLine();
            }
            return sb.toString();

        }
        catch (IOException e)
        {
            System.out.println("unable to read file contents of primitive: " + this.toString());
            e.printStackTrace();
            br.close();
        } finally
        {
            br.close();
        }
        return "";
    }

    @Override
    public void reload() {
        //To change body of implemented methods use File | Settings | File Templates.
    }

    private void loadFile()
    {

    }
}
