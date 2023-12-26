package com.daowen.service;

public class Test {

	public static void main(String[] args) {
		
		Animal animal=new Pig();
		animal.eat();
		Animal animal2=new Cat();
		animal2.eat();

	}

}

class  Animal{
	
	public  void  eat(){
		
	}
}

class  Cat extends Animal{
	
	public void eat(){
		System.out.println("cat eat");
	}
}


class  Pig extends Animal{
	
	public void eat(){
		System.out.println("pig eat");
	}
}
