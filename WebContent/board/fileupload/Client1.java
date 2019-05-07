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
		this.Sender		= new PrintWriter(CSocket.getOutputStream(), true);// 자동 flush 기능
		
		/////// 송신부 처리 ////////////////
		ThreadCommu aThreadCommu 	= new ThreadCommu();
		aThreadCommu.start();
		
		/////// 수신부 처리 ////////////////
		String Message;
		while(true)
		{
			try
			{
				Message = Receiver.readLine();
			}
			catch (SocketException e)	// 서버 비정상 종료
			{
				Message = MSGEnd;
			}
			if(Message.equals(MSGEnd))
			{
				Receiver.close();
				Sender.close();
				CSocket.close();
				System.out.println("서버측 사정으로 인해 채팅을 종료합니다.");
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
				//////// 닉네임 입력 ////////////////////////
				while(true)
				{
					System.out.print("닉네임 입력(3글자 이상) : ");
					NicName = aScanner.nextLine();
					if(3 > NicName.length()) // 3글자 미만 입력시 재입력 요구
					{
						System.out.println("3글자 이상으로 입력하세요");
						continue;
					}
					break;
				}// 닉네임 입력 완료

				//////// 중복 닉네임 처리 ////////////////////////
				Sender.println(NicName);		// 닉네임 서버 전송
				Message = Receiver.readLine();	// 서버 응답 수신
				if(Message.equals(MSGError))
				{
					System.out.println("사용중인 닉네임입니다");
					continue;
				}
				else
				{
					System.out.println("채팅 클라이언트 시작");
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
					System.out.println("서버측 이상");
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
				System.out.println("클라이언트 종료합니다.");
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
