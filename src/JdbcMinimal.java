import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JdbcMinimal {

	public static void main(String[] args) throws IOException, SQLException {
		// Check that the user supplied enough command line arguments
		if (args.length != 3) {
			System.err.println("Supply arguments: JDBC-URL (e.g., jdbc:mysql://localhost/beispieldatenbank) USERNAME PASSWORD");
			System.exit(1);
		}

		// Connect to the database using the command line arguments
		System.out.println("Connecting to " + args[0] + " as " + args[1]);
		Connection connection = DriverManager.getConnection(args[0] + "?useSSL=false", args[1], args[2]);

		// The SQL statement to execute
		String sqlStatement = "SELECT * FROM Kunde JOIN Kauf USING(Kundennummer)";

		// Create a new Statement for execution on this connection
		Statement sqlStmt = connection.createStatement();

		// Execute the statement and obtain the resulting table
		ResultSet resultSet = sqlStmt.executeQuery(sqlStatement);

		// Print the result
		System.out.println("Result:");

		// Obtain the number of columns in the returned table
		int columnCount = resultSet.getMetaData().getColumnCount();

		// Iterate over each row of the resulting table
		while (resultSet.next()) {

			// Output the value of each column of the current row
			for (int i = 1; i <= columnCount; ++i) {

				// Get the name of the current column
				String columName = resultSet.getMetaData().getColumnLabel(i);

				// Get the value of this column of the current row
				String value = resultSet.getString(i);

				// Output both on the console
				System.out.print(columName + " = " + value + ", ");
			}

			// Start a new line
			System.out.println();
		}

		// Close the result set to free the resources on the database
		resultSet.close();

		// Close the connection to free resources on the database
		connection.close();

		System.out.println("Program finished.");
	}

}
