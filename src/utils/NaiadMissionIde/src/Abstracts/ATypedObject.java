package Abstracts;

import Enums.ObjectType;

/**
 * Created with IntelliJ IDEA.
 * User: emil
 * Date: 12/12/13
 * Time: 10:24 AM
 * To change this template use File | Settings | File Templates.
 */
public abstract class ATypedObject
{
    private ObjectType type;

    public ATypedObject(ObjectType type)
    {
        this.type = type;
    }

    public ObjectType getType()
    {
        return this.type;
    }
}
