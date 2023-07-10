package com.sprint.exceptions;

public class CustomerNotFoundException extends Exception{
	private static final long serialVersionUID = 1L;

	public CustomerNotFoundException() {
		super();
	}
	
	public CustomerNotFoundException(String s) {
		super(s);
	}
	

}
