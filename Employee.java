import java.sql.*;
import java.math.*;

public class employee {
    public static void main(String[] args) {
        try {
            // Load Oracle JDBC Driver
            Class.forName("oracle.jdbc.OracleDriver");
            
            // Establish Connection with Oracle XE Database
            Connection con = DriverManager.getConnection(
                "jdbc:oracle:thin:@localhost:1521:XE", 
                "System", 
                "Tiger"
            );
            
            Statement s = con.createStatement();
            
            // Execute Select Query on Employee table
            ResultSet rs = s.executeQuery("select * from employee");
            
            // Print Table Header
            System.out.println("Employee_ID" + "\t\t" + "Employee_Name" + "\t\t" 
                + "Employee_Salary" + "\t\t" + "Employee_Phone" + "\t\t" + "\n");
            
            // Iterate through Result Set and display values
            while (rs.next()) {
                int EID = Integer.parseInt(rs.getString(1));
                String EName = rs.getString(2);
                BigDecimal E_Sal = rs.getBigDecimal(3);
                long E_Phn = rs.getLong(4);
                
                System.out.print(EID + "\t\t" + EName + "\t\t\t" + E_Sal + "\t\t\t" + E_Phn + "\t\t");
                System.out.println("\n");
            }
            
            // Close Connections
            rs.close();
            s.close();
            con.close();
            
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}