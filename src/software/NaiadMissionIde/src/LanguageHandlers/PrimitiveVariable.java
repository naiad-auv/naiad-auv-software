package LanguageHandlers;

import Enums.VariableMode;
import Enums.VariableType;

public class PrimitiveVariable {

    private VariableMode variableMode;
    private VariableType variableType;
    private String variableValue;

    public PrimitiveVariable()
    {

    }

    public PrimitiveVariable(VariableMode mode, VariableType type, String value)
    {
        this.variableMode = mode;
        this.variableType = type;
        this.variableValue = value;
    }

    public String toString() {
        return this.variableValue;
    }
}
