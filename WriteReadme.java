import java.util.Collections;
import java.util.ArrayList;
import java.util.List;
import java.io.PrintWriter;
import java.io.IOException;
import java.util.Scanner;
import java.io.File;

public class WriteReadme {

	private static void writeHeader(PrintWriter pw) {
		pw.println("# engr1182-roller-coaster");
		pw.println("CSCC ENGR1182 SU20 Roller Coaster Project Calculations");
		pw.println("\n## Made By");
		pw.println("* John Choi choi.1655@osu.edu / jchoi16@student.cscc.edu");
		pw.println("\n## Group Info");
		pw.println("* Group 1");
	}

	private static void takeNamesAndPrint(PrintWriter pw) {
		Scanner keyboard = new Scanner(System.in);
		System.out.println("Type names (press Enter to finish):");
		String input = keyboard.nextLine();
		List<String> names = new ArrayList<>();
		while (!input.isEmpty()) {
			names.add(input);
			input = keyboard.nextLine();
		}
		keyboard.close();
		Collections.sort(names);
		for (String name : names) {
			pw.println(String.format("\t- %s", name));
		}
	}

	private static void printFooter(PrintWriter pw) {
		pw.println("\n## Instructor");
		pw.println("Mr. Massood Rahimi, Columbus State Community College");
	}

	public static void main(String[] args) throws IOException {
		File myFile = new File("README.md");
		PrintWriter pw = new PrintWriter(myFile);
		writeHeader(pw);
		takeNamesAndPrint(pw);
		printFooter(pw);
		pw.close();
	}
}

