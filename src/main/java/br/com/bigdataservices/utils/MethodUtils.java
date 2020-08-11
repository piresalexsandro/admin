package br.com.bigdataservices.utils;

public class MethodUtils {
	public static String convertString(final String text) {
		String formattedText = "";
		for(final Character character : text.toCharArray()) {
			if(Character.isUpperCase(character)) {
				formattedText = formattedText+" "+character;
			} else {
				formattedText = formattedText+character;
			}
			formattedText = formattedText.substring(0, 1).toUpperCase()+formattedText.substring(1, formattedText.length());
		}
		return formattedText.trim();
	}
}
