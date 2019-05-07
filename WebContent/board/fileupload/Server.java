import java.io.*;
import java.net.*;
import java.util.*;

class ChatServer
{
	HashMap<String, PrintWriter> ClientList;
	
	private String 				IPServer;
	private int 				PortServer;
	ServerSocket 				LSocket;
	
	final private String 		CMDList 	= "/list";
	final private String 		MSGEnd 		= "#$%^(*#$^$#$";
	final private String 		MSGExit 	= "/quit";
	final private String 		MSGError 	= "^^^^Error^^^^";
	final private String 		MSGOK 		= "======OK=====";
	final private String 		IPMy 		= "192.168.0.23";
	final private int 			PortMy 		= 10040;

	
	ChatServer()
	{
		Init(this.IPMy, this.PortMy);
	}
	ChatServer(String IPServer)
	{
		Init(IPServer, this.PortMy);
	}
	ChatServer(String IPServer, int PortServer)
	{
		Init(IPServer, PortServer);
	}
	ChatServer(int PortServer)
	{
		Init(this.IPMy, PortServer);
	}
	private void Init(String IPServer, int PortServer)
	{
		this.IPServer 	= IPServer;
		this.PortServer = PortServer;
		this.ClientList = new HashMap<String, PrintWriter>();
	}
	
	void Run() throws IOException
	{
		Socket 			CSocket;
		ThreadClient 	aThreadClient;
		KeyInput 		aKeyInput 	= new KeyInput(ClientList);
		this.LSocket 				= new ServerSocket(PortServer);
		System.out.println("> ä�� ���� ����");
		aKeyInput.start();

		while(true)
		{
			System.out.println("> ������ : "+ClientList.size());
			System.out.println("> ä�� ���� ���� ��� ��...");
			CSocket 		= this.LSocket.accept();
			aThreadClient 	= new ThreadClient(CSocket, ClientList);
			aThreadClient.start();
		}
	}
	
	class ThreadClient extends Thread
	{
		HashMap<String, PrintWriter> 	ClientList;
		BufferedReader 					Receiver;
		String 							NicName;
		Socket 							CSocket;
		
		@Override
		public void run()
		{
			String Message;
			
			try
			{
				while(true)
				{
					Message = this.Receiver.readLine();
					if(null == Message)
					{
						break;
					}
					if(Message.equals(MSGExit))
					{
						break;
					}
					System.out.println("["+NicName+this.CSocket.getInetAddress()+"]"+Message);
					MessageSender("["+NicName+"]"+ Message);
				}
				synchronized(this.ClientList)
				{
					MessageSender("�г��� ["+NicName+"] ������");
					this.ClientList.get(NicName).close();	// Close Write
					this.Receiver.close(); 					// Close Read
					this.CSocket.close(); 					// Close Socket
					this.ClientList.remove(NicName);		// remove client
					System.out.println("> ["+NicName+"] ����");
					System.out.println("> ������ : "+ClientList.size());
				}
			}
			/*catch (SocketException e)
			{
				MessageSender("�г��� ["+NicName+"] ������");
				this.ClientList.remove(NicName);		// remove client
				System.out.println("> ["+NicName+"] ����");
				System.out.println("> ������ : "+ClientList.size());
			}*/
			catch (IOException e)
			{
				e.printStackTrace();
			}
		}
		
		ThreadClient(Socket CSocket, HashMap<String, PrintWriter> ClientList) throws IOException
		{
			this.CSocket 	= CSocket;
			this.ClientList = ClientList;
			this.Receiver 	= new BufferedReader(new InputStreamReader(CSocket.getInputStream()));			
			PrintWriter	 Sender	= new PrintWriter(CSocket.getOutputStream(),true);
			
			PrintWriter Temp;
			while(true)
			{
				NicName = this.Receiver.readLine(); // Ŭ���̾�Ʈ �г��� ����

				synchronized(this.ClientList)
				{	// �ߺ� ���� �Ǵ� �� Ŭ���̾�Ʈ���� ���� ����
					Temp = this.ClientList.get(NicName);
				}
				if(null != Temp)// �ߺ� �߰�
				{
					Sender.println(MSGError);	// �ߺ� �޽��� �۽�
					continue;
				}
				else
				{
					Sender.println(MSGOK);		// not �ߺ� �۽�MSGOK
				}

				break;
			}
			
			System.out.println("> ["+NicName+CSocket.getInetAddress()+"]����");
			MessageSender("�г��� ["+NicName+"] ����");
			
			synchronized(this.ClientList)
			{
				this.ClientList.put(NicName, Sender);
			}
		}
		
		void MessageSender(String Message)
		{
			synchronized(this.ClientList)
			{
				for(PrintWriter	Sender : ClientList.values())
				{
					Sender.println(Message);
				}
			}
		}
	}
	
	class KeyInput extends Thread
	{
		HashMap<String, PrintWriter> 	ClientList;
		Scanner 						aScanner = new Scanner(System.in);
		KeyInput(HashMap<String, PrintWriter> ClientList)
		{
			this.ClientList = ClientList;
		}

		@Override
		public void run()
		{
			String Message;
			while(true)
			{
				System.out.print("> ");
				Message = aScanner.nextLine();
				if(Message.equals(CMDList))
				{
					System.out.println("> ������ : "+ClientList.size());
				}
				
				if(Message.equals(MSGExit))
				{
					System.out.println("> ä�� ������ �����մϴ�");
					synchronized(this.ClientList)
					{
						for(PrintWriter	Sender : ClientList.values())
						{
							Sender.println("ä�� ������ �����մϴ�");
							Sender.println(MSGEnd);
							System.out.println("> ä�� ���� ���� ��...");
							for(int iCnt = 0; iCnt < 100000000; ++iCnt);
						}
					}
					System.out.println("> ä�� ���� ����");
					System.exit(0);
				}
			}
		}
	}
	
}


public class Server {

	public static void main(String[] args) throws IOException
	{
		ChatServer aChatServer = new ChatServer();
		aChatServer.Run();
	}

}
