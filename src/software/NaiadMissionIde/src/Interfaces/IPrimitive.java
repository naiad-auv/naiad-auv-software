package Interfaces;

import java.io.IOException;

public interface IPrimitive {
	
	public String toString();

    public String getFileContents() throws IOException;

    public void reload();
}
