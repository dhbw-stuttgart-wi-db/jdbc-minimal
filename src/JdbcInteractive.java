import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JdbcInteractive {

	public static void main(String[] args) throws IOException {
		// Check that the user supplied enough command line arguments
		if (args.length != 3) {
			System.err.println("Please supply three command line arguments: JDBC-URL (e.g., jdbc:mysql://localhost/beispieldatenbank) USERNAME PASSWORD");
			System.exit(1);
		}

		try {
			// Connect to the database using the command line arguments
			System.out.println("Connecting to " + args[0] + " as " + args[1]);
			Connection connection = DriverManager.getConnection(args[0], args[1], args[2]);
			
			// Create a reader that reads user input from the console
			BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
			String line = null;

			// Ask the user to enter a SQL statement and press ENTER key
			System.out.println("Enter SQL statement (or exit to quit) and press ENTER");
			System.out.print("> ");

			// Read a line from the console until the user enters "exit"
			while (!"exit".equals(line = br.readLine())) {

				// Check if the user has entered Select statement
				if (line.toUpperCase().startsWith("SELECT")) {

					// Create a new Statement for execution on this connection
					Statement sqlStmt = connection.createStatement();

					// Execute the statement and obtain the resulting table
					ResultSet resultSet = sqlStmt.executeQuery(line);

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

					// Close the result set to free the resources on the
					// database
					resultSet.close();

				} // Run Update, Delete, and Insert statements and display
					// amount of changed rows
				else if (line.toUpperCase().startsWith("UPDATE") || line.toUpperCase().startsWith("DELETE")
						|| line.toUpperCase().startsWith("INSERT")) {

					// Create a new Statement for execution on this connection
					Statement sqlStmt = connection.createStatement();

					// Execute the statement and obtain the number of affected
					// rows
					int affectedRows = sqlStmt.executeUpdate(line);

					// Output on the console
					System.out.println(affectedRows + " row(s) affected");
				}

				// Ask the user to input a new statement
				System.out.print("> ");
			}

			// Close the connection to free resources on the database
			connection.close();

		} catch (SQLException ex) {
			// If an error occured, output the data from the exception
			// Afterwards, the program terminates
			System.err.println("SQLException: " + ex + ", " + ex.getMessage());
			System.err.println("SQLState: " + ex + ", " + ex.getSQLState());
			System.err.println("VendorError: " + ex + ", " + ex.getErrorCode());
		}

		System.out.println("Program finished.");
	}

}
