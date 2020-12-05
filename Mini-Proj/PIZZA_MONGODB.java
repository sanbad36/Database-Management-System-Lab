
//Rollno - 6


package pizza1;

import com.mongodb.*;

import java.util.*;


public class pizzamongo {

	public static void main(String[] args) {try {
		int p_year;
		String p_name;
		// To connect to mongodb server
		MongoClient mongoClient = new MongoClient("localhost", 27017);

		// Now connect to your databases

		DB db = mongoClient.getDB("pizza");

		System.out.println("Connected to database successfully");

		DBCollection col = db.getCollection("pizza1");
		System.out.println("Collection flights selected successfully");

		Scanner scn = new Scanner(System.in);
		int ch;

		do {
			System.out.println("1.Insert");
			System.out.println("2.Display");
			System.out.println("3.Delete");
			//System.out.println("4.Update");
			System.out.println("Enter your choice: ");

			ch = scn.nextInt();

			

			switch (ch) {
			case 1:
				BasicDBObject document = new BasicDBObject();
				document.put("database", "pizza");
				document.put("table", "pizza1");

				BasicDBObject documentDetail = new BasicDBObject();

				System.out.println("Enter pizza name ");
				Scanner b = new Scanner(System.in);
				p_name = b.nextLine();
				documentDetail.put("name", p_name);

				System.out.println("Enter pizza price ");
				Scanner b1 = new Scanner(System.in);
				p_name = b1.nextLine();
				documentDetail.put("price", p_name);
				
				System.out.println("Enter pizza quantity ");
				b1 = new Scanner(System.in);
				p_name = b1.nextLine();
				documentDetail.put("quantity", p_name);
				
				
				
				document.put("detail", documentDetail);

				col.insert(new DBObject[] {document});

				System.out.println("Data inserted");
				break;

			case 2:

				DBCursor cursor = col.find();
				int i = 1;
				while (cursor.hasNext()) {
					System.out.println("Inserted Document: " + i);
					System.out.println(cursor.next());
					i++;
				}

				break;

			case 3:

				DBObject doc = col.findOne();
				col.remove(doc);
				
				
				 cursor = col.find();
				
				
				 System.out.println("Document removed Succesfully");
				    break;
				    
			    
		}

			}
		 while (ch < 4);

	} catch (Exception e) {
		System.err.println(e.getClass().getName() + ": " + e.getMessage());
	}
		// TODO Auto-generated method stub

	}

}

