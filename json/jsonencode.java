//Rollno:6

package json;
import org.json.simple.JSONObject;  

public class jsonencode {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		JSONObject obj=new JSONObject();    
		  obj.put("name","Anand");    
		  obj.put("age",new Integer(27));    
		  obj.put("salary",new Double(60000));    
		   System.out.print(obj);    
		
	}

}
