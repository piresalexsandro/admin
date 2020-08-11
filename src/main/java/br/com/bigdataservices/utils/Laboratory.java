package br.com.bigdataservices.utils;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class Laboratory {

	public static void main(String[] args) {
		String senha = "admin";
		final BCryptPasswordEncoder bCryptEncoder = new BCryptPasswordEncoder();
		bCryptEncoder.encode(senha);
		System.out.println("Senha: " + bCryptEncoder.encode(senha));
	}
}
