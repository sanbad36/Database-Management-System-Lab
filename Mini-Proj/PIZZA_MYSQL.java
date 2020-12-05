
//Rollno-6
package pizza;
import java.sql.*;
import java.io.*;

public class pizzamysql {

	public static void main(String[] args) {
		 Connection con;
	        Statement state;
	        ResultSet rs;
	        PreparedStatement ps1,ps2;	
	        int ch;
	        try
	        {
	        	Class.forName("com.mysql.jdbc.Driver");
	    	    con=DriverManager.getConnection("jdbc:mysql://localhost:3306/pizza","root","");
	            do
	            {
	                System.out.println("Menu:");
	                System.out.println("1.Insert Record into the Table");
	                
	                System.out.println("2.Display all the Records from the Table");
	                System.out.println("3.Delete The Record");
	                System.out.println("4.Exit");
	                System.out.println("Enter your choice: ");
	                
	                BufferedReader br=new BufferedReader(new InputStreamReader(System.in));
	                ch=Integer.parseInt(br.readLine());

	                switch(ch)
	                { 
	                   
	                    case 1:
	                    	System.out.print("Enter name of the pizza:");
	                    	String p_name=br.readLine();
	            			
	            			System.out.print("Enter price:");
	            			String price=br.readLine();
	            			
	            			System.out.print("Enter quantity:");
	            			String Qty=br.readLine();
	            			
	            			
	                    String sql=("insert into pizza values(?,?,?,?)");
	                    PreparedStatement ps=con.prepareStatement(sql);
	                    ps.setString(1,p_name);
	        			ps.setString(2,price);
	        			ps.setString(3,Qty);
	        			
	                    ps.executeUpdate();
	                    System.out.println("Record Added");
	                    break;

	                    
	                    
	                    case 2:
	                    state=con.createStatement();
	                    sql="select p_name,price,Qty from pizza";
	                    rs=state.executeQuery(sql);
	                    while(rs.next())
	                    {
	                        System.out.println("\n");
	                        System.out.print("\tName of pizza:" +rs.getString(1));
	                        System.out.print("\tprice:" +rs.getString(2));
	                         System.out.print("\tQuantity:" +rs.getString(3));
	                        
	                    }
	                    System.out.println("----------------------------------");
	                    
	                    break;

	                    case 3:
	                    state=con.createStatement();
	                    System.out.println("Enter the pizza name which is to be deleted ");
	                    p_name=br.readLine();
	                    state.executeUpdate("delete from pizza where name='"+p_name+"'");
	                    System.out.println(" Deleted Sucessfully.... ");
	                    break;
	                    
	                    default:
	                    System.out.println("Thank You");
	                    break;
	                }
	            }while(ch!=4);
	        }catch(Exception e)
	        {
	            System.out.println(e);
	        }
		// TODO Auto-generated method stub

	}

}

