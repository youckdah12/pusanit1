import java.awt.*;
import javax.swing.*;



public class MyFrame extends JFrame
{	
	Image aImage=Toolkit.getDefaultToolkit().getImage("1.png");
	
	
	public MyFrame() 
	{
		
		setTitle("�� �����000");
		setSize(840+6,600+26+3); // ������ ũ�� 300x300
		setVisible(true); // ������ ���
		setResizable(false);

	}
	
	public void paint(Graphics g){ 
		for(int iY=0; iY<10; ++iY)
		for(int iX=0; iX<14; ++iX)
		  g.drawImage(this.aImage, iX*60+3, iY*60+26, this); 
		 }
	
	public static void main(String[] args) {
		MyFrame frame = new MyFrame();
	}
}