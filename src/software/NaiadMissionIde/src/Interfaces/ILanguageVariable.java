package Interfaces;

import Enums.VariableMode;
import Enums.VariableType;

import java.util.Observer;
import java.util.UUID;

/**
 * Created with IntelliJ IDEA.
 * User: emil
 * Date: 12/6/13
 * Time: 8:02 AM
 * To change this template use File | Settings | File Templates.
 */
public interface ILanguageVariable {

    public VariableType getType();

    public void setMode(VariableMode newMode);

    public void setValue(String value);

    public String toString();

    public void setPrefix(String prefix);

    public void setName(String name);

    public void setStatic(boolean isStatic);

    public void setPattern(String pattern);

    public String getName();

    public String getValue();

    public String getPattern();

    public boolean isStatic();

    public VariableMode getMode();

    public String getPrefix();

    boolean checkMatch(String text);

    void addObserver(Observer observer);

    void setType(VariableType s);

    public UUID getUid();

    public ILanguageVariable getCopy();

}
