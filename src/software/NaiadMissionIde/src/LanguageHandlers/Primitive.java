package LanguageHandlers;

import Enums.ILanguageObjectType;
import Exceptions.NullReferenceException;
import Interfaces.ILanguageObject;
import Interfaces.ILanguageVariable;
import Interfaces.IPrimitive;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.List;

public class Primitive implements IPrimitive, ILanguageObject{

    private String primitiveName;
    private ArrayList<ILanguageVariable> primitiveInputs;
    private ArrayList<ILanguageVariable> primitiveOutputs;

    private final Path filePath;

    public Primitive(String name, Path path)
    {
        this.primitiveName = name;
        this.filePath = path;

        this.primitiveInputs = new ArrayList<ILanguageVariable>();
        this.primitiveOutputs  = new ArrayList<ILanguageVariable>();

        this.loadFile();
    }

    public Primitive(Primitive base) {
        this.primitiveName = base.primitiveName;
        this.primitiveInputs = base.primitiveInputs;
        this.primitiveOutputs = base.primitiveOutputs;
        this.filePath = base.filePath;

        this.loadFile();
    }

    @Override
    public Path getFilePath() throws NullReferenceException
    {
        if(this.filePath != null)
            return this.filePath;
        throw new NullReferenceException("this.filePath");
    }

    @Override
    public String toString()
    {
        return "P : " + this.primitiveName;
    }

    @Override
    public List<ILanguageVariable> getInputVariables() {
        return this.primitiveInputs;
    }

    @Override
    public List<ILanguageVariable> getOutputVariables() {
        return this.primitiveOutputs;
    }

    @Override
    public String getFileContents() throws IOException {
        BufferedReader br = null;
        try {
            br = new BufferedReader(new FileReader(this.getFilePath().toString()));

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
            System.out.println("unable to read file contents of primitive, IOException: " + this.toString());
            e.printStackTrace();

            if(br != null)
            {
                br.close();
            }
        }
        catch (NullReferenceException e)
        {
            System.out.println("unable to read file contents of primitive, NullReferenceException: " + this.toString());
            e.printStackTrace();

            br.close();
        }
        finally
        {
            if(br != null)
            {
                br.close();
            }
        }
        return "";
    }

    @Override
    public void reload() {
        //To change body of implemented methods use File | Settings | File Templates.
    }

    private void loadFile()
    {
        //TODO detta ska läsas från filen
     /*   this.primitiveInputs.add(new PrimitiveVariable(VariableMode.IN));
        this.primitiveInputs.add(new PrimitiveVariable(VariableMode.IN));
        this.primitiveInputs.add(new PrimitiveVariable(VariableMode.IN));
        this.primitiveInputs.add(new PrimitiveVariable(VariableMode.IN));


        this.primitiveOutputs.add(new PrimitiveVariable(VariableMode.OUT));
        this.primitiveOutputs.add(new PrimitiveVariable(VariableMode.OUT));
        this.primitiveOutputs.add(new PrimitiveVariable(VariableMode.OUT));
        this.primitiveOutputs.add(new PrimitiveVariable(VariableMode.OUT));
       */
    }

    @Override
    public ILanguageObjectType getType() {
        return ILanguageObjectType.Primitive;
    }
}
