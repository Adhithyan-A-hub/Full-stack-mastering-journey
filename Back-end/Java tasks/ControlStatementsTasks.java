package com.index;
import java.util.Scanner;

public class ControlStatementsTasks {

	public static void main(String[] args) {

// write a program to print a number from 10 to 1 using if...
// Check if a number is positive negative zero...
// Write a program to find the some of even number and odd number between 1 to 100...
// Write a program to find the frequency of letters in a word using if...
// Write a program to design calculator using switch case ( +-*/%)...
		
		Scanner input = new Scanner(System.in);

		
		System.out.println("Task 1");
		
		int a = 10;
		if(a > 0) {  System.out.println(a); a--;}
		if(a > 0) {  System.out.println(a); a--;}
		if(a > 0) {  System.out.println(a); a--;}
		if(a > 0) {  System.out.println(a); a--;}
		if(a > 0) {  System.out.println(a); a--;}
		if(a > 0) {  System.out.println(a); a--;}
		if(a > 0) {  System.out.println(a); a--;}
		if(a > 0) {  System.out.println(a); a--;}
		if(a > 0) {  System.out.println(a); a--;}
		if(a > 0) {  System.out.println(a); a--;}
		
		System.out.println();
		System.out.println("Task 2");
		
		int b = -2;
		
		if(b > 0) { System.out.println(b +"is positive");}
		else if(b < 0) { System.out.println(b +"is negative");}
		else { System.out.println(b +"is 0");}

		System.out.println();
		System.out.println("Task 3");
		
		int even_count = 0;
		int odd_count = 0;
		
		for(int i=0; i<100; i++) {
			
			if(i%2 ==0) {
				even_count++;
			}else {
				odd_count++;
			}
		
		}
		
		System.out.println(even_count);
		System.out.println(odd_count);
		
		System.out.println();
		System.out.println("Task 4");
		System.out.println("Enter the word :");
		
		String s1 = input.nextLine();
		
		System.out.println("Enter the letter to search :");
		char letter = input.nextLine().charAt(0);
		int letter_count =0;
		
		for(int i =0; i<s1.length();i++) {
			String s1_tostring= String.valueOf(s1.charAt(i));
			String letter_tostring = String.valueOf(letter);

			if(s1_tostring.equalsIgnoreCase(letter_tostring)) {
				letter_count++;
			}
		}
		
		System.out.println(letter_count++);		
		
		System.out.println();	System.out.println("Task 5");	System.out.println();

		System.out.println("Enter first number :");
		int v1 = input.nextInt();
		
		System.out.println("Enter second number :");
		int v2 = input.nextInt();
		
		System.out.println("Enter the math function ( +,-,*,/ )");
		char op = input.next().charAt(0);
		int res = 0;
		
		switch(op) {
			
		case '+':
			res = v1 + v2;
			System.out.println(res);
			break;
		case '-':
			res = v1 - v2;
			System.out.println(res);
			break;
		case '*':
			res = v1 * v2;
			System.out.println(res);
			break;
		case '/':
			if(v2 != 0) {
				res = v1 / v2;
				System.out.println(res);
			}else {
				System.out.println(v1 + "is not divided by zero");
			}break;
		default:
			System.out.println(op +"is not operable");
			break;

		}

		
		
	}

}
