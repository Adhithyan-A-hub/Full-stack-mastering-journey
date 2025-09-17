package com.index;
import java.util.Scanner;

class Account{
	
	Scanner sc = new Scanner(System.in);
	
	private double balance;
	private int password = 0000;
	
	Account(int pass){
		this.password=pass;
	}
	
	void deposit(double amount) {
		if(amount > 0) {
			balance += amount;
		}
	}
	
	void withdraw(double amount) {
		if(amount <= balance) {
			balance -= amount;
		}else {
			System.out.println("Insufficient balance");
		}
		
	}
	
	void checkbalance() {
		
		if(password == 0000) {
			System.out.println("If you didn't created password ... your password is 0000");
		}
		System.out.println("Enter yout 4 digit password :");

		int pass = sc.nextInt();
		if(pass == password) {
			System.out.println("Your balance is :"+ balance);
		}else {
			System.out.println("Incorrect password !");
		}
	}
}
public class Encapsulation {

	public static void main(String[] args) {

		Account usr1 =  new Account(9363);
		
		usr1.deposit(2000);
		usr1.checkbalance();
		
	}

}
