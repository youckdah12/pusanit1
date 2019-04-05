import java.io.*;
import java.net.*;
import java.util.*;

class ChatClient
{
	final private String 		MSGEnd 		= "#$%^(*#$^$#$";
	final private String 		MSGExit 	= "/quit";
	final private String 		MSGError 	= "^^^^Error^^^^";
	final private String 		MSGOK 		= "======OK=====";
	final private String 		IPMy 		= "192.168.0.23";
	final private int 			PortMy 		= 10040;
	
	private String 				NicName;
	private Scanner 			aScanner;
	private Socket				CSocket;
	private BufferedReader		Receiver;			
	private PrintWriter	 		Sender;
	
	ChatClient() throws IOException
	{
		this.CSocket 	= new Socket(IPMy, PortMy);
		this.Receiver 	= new BufferedReader(new InputStreamReader(CSocket.getInputStream()));
		this.Sender		= new PrintWriter(CSocket.getOutputStream(), true);// �ڵ� flush ���
		
		/////// �۽ź� ó�� ////////////////
		ThreadCommu aThreadCommu 	= new ThreadCommu();
		aThreadCommu.start();
		
		/////// ���ź� ó�� ////////////////
		String Message;
		while(true)
		{
			try
			{
				Message = Receiver.readLine();
			}
			catch (SocketException e)	// ���� ������ ����
			{
				Message = MSGEnd;
			}
			if(Message.equals(MSGEnd))
			{
				Receiver.close();
				Sender.close();
				CSocket.close();
				System.out.println("������ �������� ���� ä���� �����մϴ�.");
				break;
			}
			System.out.println(Message);
		}
		
	}
	class ThreadCommu extends Thread
	{
		private String Message;
		ThreadCommu() throws IOException
		{
			aScanner 	= new Scanner(System.in);
			while(true)
			{
				//////// �г��� �Է� ////////////////////////
				while(true)
				{
					System.out.print("�г��� �Է�(3���� �̻�) : ");
					NicName = aScanner.nextLine();
					if(3 > NicName.length()) // 3���� �̸� �Է½� ���Է� �䱸
					{
						System.out.println("3���� �̻����� �Է��ϼ���");
						continue;
					}
					break;
				}// �г��� �Է� �Ϸ�

				//////// �ߺ� �г��� ó�� ////////////////////////
				Sender.println(NicName);		// �г��� ���� ����
				Message = Receiver.readLine();	// ���� ���� ����
				if(Message.equals(MSGError))
				{
					System.out.println("������� �г����Դϴ�");
					continue;
				}
				else
				{
					System.out.println("ä�� Ŭ���̾�Ʈ ����");
				}
				break;
			}
		}
		@Override
		public void run()
		{
			while(true)
			{
				System.out.print("["+NicName+"]> ");
				System.out.flush();
				Message = aScanner.nextLine();
				if(Sender.checkError())
				{
					System.out.println("������ �̻�");
					break;
				}
				Sender.println(Message);

				if(Message.equals(MSGExit))
				{
					break;
				}
			}
			try
			{
				Receiver.close();
				Sender.close();
				CSocket.close();
				System.out.println("Ŭ���̾�Ʈ �����մϴ�.");
				System.exit(0);
			} catch (IOException e)
			{
				e.printStackTrace();
			}
			
		}
	}
	
}
public class Client
{
	public static void main(String[] args) throws UnknownHostException, IOException
	{
		ChatClient aChatClient = new ChatClient();
		System.exit(0);
	}

}
