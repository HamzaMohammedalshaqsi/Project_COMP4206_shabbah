/*
  dart program that simulate the application as CLI

  1- The dart application promot the user a menu which to login or signup
  2- if the user first time then read some user information
  3- after that show home menu which has the following
    a- search for pitch
    b- search for game
  4- if user select game and want to book to play the system must chek the budget
  5- if user book pitch, read from user the informatio that other people will see


*/
import 'dart:io';

import 'package:flutter/material.dart';


bool auth(Map<String, String> usersAuth){
  // 
  while(true){
    print("Please enter numebr to performe action or type 'see'");
    print("1- signin");
    print("2- signup if have no account");
    String? input = stdin.readLineSync() ?? "";
    switch(input){
      case "1":
              print("Enter the username:");
              String? username = stdin.readLineSync() ?? "";
              print("Enter the password:");
              String? passeord = stdin.readLineSync() ?? "";
              bool result = usersAuth.containsKey(username);
              if (result == false){
                print("The user name doesn't exist!");
                continue;
              } else {
                String storedPassword = usersAuth[username] ?? "";
                if (storedPassword == passeord){
                  print("seccesfull login");
                  return true;
                } else {
                  print("Wrong password ");
                  continue;
                }
              }

      case "2":
              print("Enter the username:");
              String? username = stdin.readLineSync() ?? "";
              print("Enter the password:");
              String? passeord = stdin.readLineSync() ?? "";
              bool result = usersAuth.containsKey(username);
              if (result == true){
                print("The user name already exist!");
                String storedPassword = usersAuth[username] ?? "";
                if (storedPassword == passeord){
                  print("seccesfull login");
                  return true;
                } else {
                  print("wrong password");
                  continue;
                }
              } else {
                usersAuth[username] = passeord;
                print("secceful login");
                return true;
              }
      case "see":
              print("see you:)");
              return false;
      default:
            print("Invalid option");
    }
  }
}


void homeMenu(){
  // 





}


void main(){
  Map<String, String> usersAuth = {};
  bool statusAuth = auth(usersAuth);
  print(statusAuth);


}