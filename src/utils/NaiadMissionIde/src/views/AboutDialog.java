package views;

import java.awt.BorderLayout;

import javax.swing.JButton;
import javax.swing.JDialog;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;

import UserControls.JImagePanel;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class AboutDialog extends JDialog {

	private static final long serialVersionUID = 1L;
	
	private static AboutDialog singletonDialog;
	private static final Object lock = new Object();

	private final JPanel contentPanel = new JPanel();
	
	private final String imagePath = "src/Artwork/eclipseCropped.jpg";

	private AboutDialog() {
		this.configureDialog();
		this.addImagePanel();
		this.addOkButton();
		this.addAboutText();
	}
	
	public static AboutDialog getInstance()
	{
		if(AboutDialog.singletonDialog == null)
		{
			synchronized(lock)
			{
				AboutDialog.singletonDialog = new AboutDialog();
			}
		}
		
		return AboutDialog.singletonDialog;
	}

	private void configureDialog() {
		setBounds(100, 100, 248, 400);
		setTitle("About");
		setResizable(false);
		setDefaultCloseOperation(JFrame.HIDE_ON_CLOSE);
		getContentPane().setLayout(new BorderLayout());
		contentPanel.setBorder(new EmptyBorder(5, 5, 5, 5));	
		getContentPane().add(contentPanel, BorderLayout.CENTER);
		contentPanel.setLayout(null);
	}

	private void addAboutText() {
		JLabel aboutText = new JLabel();
		aboutText.setBounds(12, 204, 220, 115);
		aboutText.setText("<html><CENTER>Penumbra v1.0 Beta<br>Mission creation IDE for the Naiad AUV<br> Developed: 2013 <br> Author: Emil Bergström</CENTER></html>");
		
		contentPanel.add(aboutText);
	}

	private void addOkButton() {
		JButton button = new JButton("Ok");
		button.addActionListener(new ActionListener()
		{
			public void actionPerformed(ActionEvent e) {
				dispose();
			}
		});
		
		button.setBounds(12, 331, 220, 25);
		button.setAlignmentY(1.0f);
		contentPanel.add(button);
	}

	private void addImagePanel() {
		JImagePanel imagePanel = new JImagePanel(imagePath);
		imagePanel.setBounds(12, 12, 220, 180);
		imagePanel.setAlignmentY(0.0f);
		contentPanel.add(imagePanel);
	}
}
