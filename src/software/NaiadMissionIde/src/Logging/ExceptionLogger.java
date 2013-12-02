package Logging;

import javax.swing.*;

/**
 * Created with IntelliJ IDEA.
 * User: emil
 * Date: 11/27/13
 * Time: 12:44 PM
 * To change this template use File | Settings | File Templates.
 */
public final class ExceptionLogger {

    public static boolean notifyUser = false;

    public static void Log(Exception e)
    {
        StringBuilder sb = new StringBuilder();

        sb.append("Exception occured: ");
        sb.append(e.getStackTrace());
        e.printStackTrace();

        //TODO add exception logging
        if(ExceptionLogger.notifyUser)
        {
            JOptionPane.showMessageDialog(null, sb.toString(), "Exception occured", JOptionPane.ERROR_MESSAGE);
        }
        ExceptionLogger.writeToExceptionLog(sb.toString());
    }

    private static void writeToExceptionLog(String exceptionMessage)
    {
        System.out.println(exceptionMessage);
    }

}
