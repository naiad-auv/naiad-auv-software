package LanguageHandlers;

import Enums.VariableMode;
import Enums.VariableType;
import Interfaces.ILanguageObject;
import Interfaces.ILanguageVariable;

public class LanguageVariable implements ILanguageVariable {

    private VariableMode variableMode;

    private String variableValue;
    private String variablePrefix;
    private String variableName;
    private boolean isStatic;
    private String pattern;

    private ILanguageObject connectedTo;
    private int position;

    public LanguageVariable()
    {
    }

    public LanguageVariable(String name)
    {
        this.variableName = name;
    }

    public LanguageVariable(VariableMode mode, String value)
    {
        this.variableMode = mode;
        this.variableValue = value;
    }

    public LanguageVariable(ILanguageVariable object) {
        this.variableName = object.getName();
        this.variableValue = object.getValue();
        this.variablePrefix = object.getPrefix();
        this.variableMode = object.getMode();
        this.isStatic = object.isStatic();
        this.pattern = object.getPattern();
    }

    @Override
    public VariableType getType() {
        return null;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public void setMode(VariableMode newMode) {
        //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public void setValue(Object value) {
        //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public String toString() {
        if(this.variableValue != "" && this.variableValue != null)
            return this.variableName + " : " + this.variableValue;
        return this.variableName;
    }

    @Override
    public void setPrefix(String prefix) {
        this.variablePrefix = prefix;
    }

    @Override
    public void setName(String name) {
        this.variableName = name;
    }

    @Override
    public void setStatic(boolean isStatic) {
        this.isStatic = isStatic;
    }

    @Override
    public void setPattern(String pattern) {
        this.pattern = pattern;
    }

    public String getName()
    {
        return this.variableName;
    }

    @Override
    public String getValue() {
        return this.variableValue;
    }

    @Override
    public String getPattern() {
        return this.pattern;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public boolean isStatic() {
        return false;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public VariableMode getMode() {
        return this.variableMode;  //To change body of implemented methods use File | Settings | File Templates.
    }

    @Override
    public String getPrefix() {
        return this.variablePrefix;  //To change body of implemented methods use File | Settings | File Templates.
    }
}

