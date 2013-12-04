package Settings.CoreSettings;

/**
 * Created with IntelliJ IDEA.
 * User: emil
 * Date: 12/3/13
 * Time: 9:12 AM
 * To change this template use File | Settings | File Templates.
 *
 */

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Unmarshaller;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlElementWrapper;
import java.io.File;


@XmlRootElement(name = "PenumbraCoreSettings")
public class PenumbraCoreSettings
{

    private static PenumbraCoreSettings Instance;

    private static String path = "src/Settings/XmlFiles/CoreSettings.xml";

    public static PenumbraCoreSettings getInstance()
    {
        if(PenumbraCoreSettings.Instance == null)
        {
            try
            {
                File file = new File(path);
                JAXBContext jaxbContext = JAXBContext.newInstance(PenumbraCoreSettings.class);

                Unmarshaller jaxbUnmarshaller = jaxbContext.createUnmarshaller();
                PenumbraCoreSettings.Instance = (PenumbraCoreSettings) jaxbUnmarshaller.unmarshal(file);
            }
            catch (JAXBException e)
            {
                e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
            }
        }
        return PenumbraCoreSettings.Instance;
    }

    @XmlElement(name = "fontsize")
    public int FontSize;

    @XmlElement(name = "primitivespath")
    public String PrimitivesPath;

    @XmlElement(name = "objectivespath")
    public String ObjectivesPath;

}
