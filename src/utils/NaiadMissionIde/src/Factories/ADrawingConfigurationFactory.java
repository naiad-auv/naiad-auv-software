package Factories;

import Abstracts.ADrawingConfiguration;
import Drawables.DrawConfigurations.*;
import Enums.ObjectType;

import java.awt.*;

/**
 * Created with IntelliJ IDEA.
 * User: emil
 * Date: 12/13/13
 * Time: 8:15 AM
 * To change this template use File | Settings | File Templates.
 */
public class ADrawingConfigurationFactory {


    public static ADrawingConfiguration getInstance(ObjectType type, Point position) throws IllegalArgumentException
    {
        switch (type)
        {
            case Primitive:
                return new PrimitiveConfiguration(position);
            case Objective:
                return new ObjectiveConfiguration(position);
            case Variable:
                return new VariableConfiguration(position);
            case Branch:
                return new BranchConfiguration(position);
            case Marker:
                return new MarkerConfiguration(position);
            default:
                throw new IllegalArgumentException("Undefined object type passed to ADrawingConfigurationFactory.getInstance()");

        }
    }
}
