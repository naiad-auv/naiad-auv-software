package LanguageHandlers;

import Enums.VariableMode;
import Enums.VariableType;

import static Enums.VariableType.*;

public class PrimitiveVariable {

    private VariableMode variableMode;
    private VariableType variableType;
    private String variableValue;
    private String variablePrefix;

    public PrimitiveVariable(VariableMode mode, VariableType type, String value)
    {
        this.variableMode = mode;
        this.variableType = type;
        this.variableValue = value;
    }

    public String toString() {
        return this.variableValue;
    }

    public String getVariablePrefix() {
        switch(variableType)
        {
            case Boolean:
                return "b";
            case Integer:
                return "i";
            case Float:
                return "f";
        }

        return "";
    }
}
