package UserControls;

import Interfaces.ICommand;

import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

/**
 * Created with IntelliJ IDEA.
 * User: emil
 * Date: 11/27/13
 * Time: 2:31 PM
 * To change this template use File | Settings | File Templates.
 */
public class EPrimitiveEditorMenuButton extends JButton {

    private ICommand clickCommand;

    public EPrimitiveEditorMenuButton(ICommand onClickCommand, String text)
    {

        this.setSize(100,30);

        this.clickCommand = onClickCommand;

        this.setText(text);

        this.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent actionEvent) {
                clickCommand.execute();
            }
        });

    }



}
