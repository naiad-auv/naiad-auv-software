package UserControls;

import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import javax.imageio.ImageIO;
import javax.swing.JPanel;

public class JImagePanel extends JPanel{

	private static final long serialVersionUID = 6755410098038333156L;

	private BufferedImage image;

    public JImagePanel(String imagePath) {
       try {                
          image = ImageIO.read(new File(imagePath));
       } catch (IOException e) {
            e.printStackTrace();
       }
    }

    @Override
    protected void paintComponent(Graphics g) {
        super.paintComponent(g);
        g.drawImage(image, 0, 0, null);      
    }

}