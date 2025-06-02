import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.ButtonGroup;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JRadioButton;
import javax.swing.JTextField;

public class Form extends JFrame implements ActionListener {

    JLabel nameLabel;
    JTextField nameText;

    JLabel emailLabel;
    JTextField emailText;

    JLabel passLabel;
    JTextField passTextField;

    ButtonGroup gender;

    JRadioButton male;
    JRadioButton female;

    public Form () {
        setTitle("Registor Yourself");
        setSize(600, 600);

        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLayout(new GridLayout(6, 2, 10, 10));

        nameLabel = new JLabel("Name");
        nameText = new JTextField();

        emailLabel = new JLabel("Email");
        emailText = new JTextField();

        male = new JRadioButton("Male");
        female = new JRadioButton("Female");
        gender = new ButtonGroup();

        add(nameLabel);
        add(nameText);
        add(emailLabel);
        add(emailText);
        add(male);
        add(female);
        gender.add(male);
        gender.add(female);

        setVisible(true);
    }

    public static void main(String[] args) {
        Form form = new Form();

    }

    public void actionPerformed(ActionEvent e) {

    }
}
