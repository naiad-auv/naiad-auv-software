package Factories;

import Drawables.DrawMethods.*;
import Enums.ObjectType;
import Interfaces.IDraw;

/**
 * Created with IntelliJ IDEA.
 * User: emil
 * Date: 12/12/13
 * Time: 11:08 AM
 * To change this template use File | Settings | File Templates.
 */
public class IDrawFactory {
    public static IDraw getInstance(ObjectType type) {
        switch (type)
        {
            case Primitive:
                return new PrimitiveDraw();
            case Objective:
                return new ObjectiveDraw();
            case Marker:
                return new MarkerDraw();
            case Variable:
                return new VariableDraw();
            case Branch:
                return new BranchDraw();
            default:
                throw new IllegalArgumentException("Undefined object type passed");

        }
    }
}
