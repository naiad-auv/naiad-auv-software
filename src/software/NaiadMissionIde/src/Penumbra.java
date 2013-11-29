import views.MainWindow;

import java.awt.*;

/**
 * Created with IntelliJ IDEA.
 * User: emil
 * Date: 11/26/13
 * Time: 11:22 AM
 * To change this template use File | Settings | File Templates.
 */
public class Penumbra {

    /**
     * Launch the application.
     */
    public static void main(String[] args) {
        EventQueue.invokeLater(new Runnable() {
            public void run() {
                try {
                    MainWindow window = new MainWindow();
                    window.Show();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        });
    }
}
