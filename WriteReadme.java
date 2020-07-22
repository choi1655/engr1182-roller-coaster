import java.util.Collections;
import java.util.ArrayList;
import java.util.List;
import java.io.PrintWriter;
import java.io.IOException;
import java.util.Scanner;
import java.io.File;

public class WriteReadme {

	private static void writeHeader(PrintWriter pw) throws Exception {
		pw.println("# engr1182-roller-coaster");
		pw.println("CSCC ENGR1182 SU20 Roller Coaster Project Calculations");
		pw.println("\n## Made By");
		pw.println("* John Choi choi.1655@osu.edu / jchoi16@student.cscc.edu");
		pw.println("\n## Group Info");
		pw.println("* Group 1");
	}

	private static void usePreviousList(PrintWriter pw, Scanner keyboard) throws Exception {
		File nameFile = new File("names.txt");
		if (!nameFile.exists()) {
			System.out.println("Name file does not exist");
			takeNamesAndPrint(pw, keyboard);
		} else {
			Scanner readFile = new Scanner(nameFile);
			while (readFile.hasNextLine()) {
				pw.println(String.format("\t- %s", readFile.nextLine()));
			}
		}
	}

	private static void ask(PrintWriter pw) throws Exception {
		Scanner keyboard = new Scanner(System.in);
		System.out.print("Use previous name list? > ");
		String input = keyboard.nextLine();
		if (input.equalsIgnoreCase("Y")) {
			usePreviousList(pw, keyboard);
		} else {
			takeNamesAndPrint(pw, keyboard);
		}
	}

	private static void takeNamesAndPrint(PrintWriter pw, Scanner keyboard) throws Exception {
		System.out.println("Type names (press Enter to finish):");
		String input = keyboard.nextLine();
		List<String> names = new ArrayList<>();
		File namesFile = new File("names.txt");
		PrintWriter nameWriter = new PrintWriter(namesFile);
		while (!input.isEmpty()) {
			names.add(input);
			input = keyboard.nextLine();
		}
		keyboard.close();
		Collections.sort(names);
		for (String name : names) {
			nameWriter.println(name);
			pw.println(String.format("\t- %s", name));
		}
		nameWriter.close();
	}

	private static void printFooter(PrintWriter pw) {
		pw.println("\n## Instructor");
		pw.println("Mr. Massood Rahimi, Columbus State Community College");
	}

	public static void main(String[] args) throws Exception {
		File myFile = new File("README.md");
		PrintWriter pw = new PrintWriter(myFile);
		ask(pw);
		printFooter(pw);
		pw.close();
	}
}
