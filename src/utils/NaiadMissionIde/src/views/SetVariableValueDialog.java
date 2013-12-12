package views;

import Interfaces.ILanguageVariable;

import javax.swing.*;
import javax.swing.border.EmptyBorder;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

/**
 * Created with IntelliJ IDEA.
 * User: emil
 * Date: 12/9/13
 * Time: 8:03 AM
 * To change this template use File | Settings | File Templates.
 */
public class SetVariableValueDialog extends JDialog {

    private final JTextArea inputValueArea = new JTextArea();
    private final JButton okButton = new JButton();
    private final JButton cancelButton = new JButton();

    private final JPanel contentPanel = new JPanel();
    private final JPanel buttonPanel = new JPanel();

    private ILanguageVariable scope;

    public SetVariableValueDialog(ILanguageVariable scope)
    {
        this.scope = scope;

        this.configureDialog();
        this.configureInputBox();
        this.configureButtons();
        this.configureButtonPanel();
        this.configureContentPanel();

        this.addComponents();

        this.setVisible(true);
        this.requestFocus();
        this.toFront();
        this.repaint();

    }

    private void configureContentPanel() {
        this.contentPanel.setBorder(new EmptyBorder(5, 5, 5, 5));
        this.contentPanel.setLayout(new BorderLayout());
    }

    private void configureButtonPanel() {
        this.buttonPanel.setBorder(new EmptyBorder(5, 5, 5, 5));
        this.buttonPanel.setLayout(new FlowLayout());
    }

    private void addComponents() {
        this.contentPanel.add(this.inputValueArea, BorderLayout.CENTER);

        this.buttonPanel.add(this.okButton);
        this.buttonPanel.add(this.cancelButton);

        this.getContentPane().add(this.contentPanel, BorderLayout.CENTER);
        this.getContentPane().add(this.buttonPanel, BorderLayout.SOUTH);
    }

    private void configureButtons() {

        this.okButton.setSize(new Dimension(50, 30));
        this.cancelButton.setSize(new Dimension(50, 30));

        this.okButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent actionEvent) {
                trySetValueInscope();
            }
        });

        this.cancelButton.addActionListener(new ActionListener()
        {
            public void actionPerformed(ActionEvent e) {
                dispose();
            }
        });

        this.okButton.setText("OK");
        this.cancelButton.setText("CANCEL");

    }

    private void trySetValueInscope() {

        if(this.scope.checkMatch(this.inputValueArea.getText()))
        {
            this.scope.setValue(this.inputValueArea.getText());
            this.dispose();
        }
        else
        {
            //TODO messagebox eller nåt
               System.out.println("No match, cant set");
        }

    }

    private void configureInputBox()
    {
        this.inputValueArea.setSize(new Dimension(150, 24));
        this.inputValueArea.setVisible(true);
        this.inputValueArea.setText(this.scope.getValue());
    }

    private void configureDialog() {
        setBounds(100, 100, 300, 100);
        setTitle("Edit " + this.scope.toString());
        setResizable(false);
        setDefaultCloseOperation(JDialog.DISPOSE_ON_CLOSE);
        getContentPane().setLayout(new BorderLayout());
    }

}
