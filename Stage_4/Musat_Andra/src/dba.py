import os
import sys
import hashlib
from datetime import datetime 

import etl

# Function to hash passwords
def hash_password(password):
    return hashlib.sha256(password.encode()).hexdigest()
  

# Function to log operations in a file
def log_operation(username, role, operation):
    with open("roles/operation_logs.txt", "a") as file:
        timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        file.write(f"{timestamp} - {username} ({role}): {operation}\n")


# Function to create a admin        
def create_admin():
    print("Creating an admin...")
    username = input("Enter admin username: ")
    password = input("Enter admin password: ")
    hashed_password = hash_password(password)
    with open("roles/admin.txt", "a") as file:
        file.write(f"{username}:{hashed_password}\n")
    log_operation(username, "admin", "Admin created") 
    print("Admin created successfully.\n")


# Function to check if admin exists
def check_admin():
    with open("roles/admin.txt", "r") as file:
        admin_credentials = file.readline()
    return admin_credentials


# Function to create a new user
def create_user(role, username):
    print("Creating a new user:")
    new_username = input("Enter username for the new user: ")
    new_password = input("Enter password for the new user: ")
    hashed_password = hash_password(new_password)
    with open(f"roles/{role}.txt", "a") as file:
        file.write(f"{new_username}:{hashed_password}\n")  
    log_operation(username, role, f"Created new user: {new_username}")  
    print("New user created successfully.")


# Function to authenticate users
def authenticate(role):
    username = input("Enter username: ")
    password = input("Enter password: ")
    hashed_password = hash_password(password)
    with open(f"roles/{role}.txt", "r") as file:
        for line in file:
            stored_username, stored_password = line.strip().split(":")
            if username == stored_username and hashed_password == stored_password:
                log_operation(username, role, "Login")  
                return True
    log_operation(username, role, "Failed login attempt")  
    return False


def enter_user_option():
    user_input = input("Enter your option: ")
    return user_input
    

def clear_panel():
    os.system('cls||clear')


def display_panel_message():
    print("\nDATA BASE ADMINISTRATION PANEL\n")


def display_menu_message():
    print("MENU")


def display_main_menu():
    print("1. Login as an Admin")
    print("2. Login as a Data Engineer")
    print("3. Login as an Analyst")
    print("4. Exit\n")


def display_admin_menu():
    print("1. Create Data Engineer role")
    print("2. Create Analyst role")
    print("3. Exit\n")
    name = input("Enter username: ")
    user_option = input("Enter user's option: ")
    if not isinstance(name, str):
        log_operation(name, "admin", f"Not a valid username. User entered: {name}")
        print("Please enter a valid username.")
    else:
        log_operation(name, "admin", f"Selected option {user_option} in Admin menu")  
    return user_option, name


def display_engineer_menu():
    print("1. Create table")
    print("2. Run simple query")
    print("3. Exit\n")
    name = input("Enter user's name: ")
    user_option = input("Enter user's option: ")
    if not isinstance(name, str):
        log_operation(name, "engineer", f"Not a valid username. User entered: {name}")
        print("Please enter a valid username.")
    else:
        log_operation(name, "engineer", f"Selected option {user_option} in Engineer menu")  
    return user_option, name


def display_analyst_menu():
    print("1. Run simple query")
    print("2. Exit\n")
    name = input("Enter user's name: ")
    user_option = input("Enter user's option: ")
    if not isinstance(name, str):
        log_operation(name, "analyst", f"Not a valid username. User entered: {name}")
        print("Please enter a valid username.") 
    else:
        log_operation(name, "analyst", f"Selected option {user_option} in Analyst menu") 
    return user_option, name


if __name__ == "__main__":
    # Display Panel
    display_panel_message()

    # Check if admin exists
    if not check_admin():
        # Create admin role
        create_admin()

    # Display Menu
    display_menu_message()

    while True:
        # Display Main Menu
        display_main_menu()
        # Ask user input
        user_input = enter_user_option()

        # Menu for Admin
        if user_input == "1":
            if authenticate("admin"):
                display_admin_menu()
                user_input = enter_user_option()
                if user_input == "1":
                    create_user("engineer")
                elif user_input == "2":
                    create_user("analyst")
                elif user_input == "3":
                    print("Exiting...")
                    sys.exit()
                else:
                    display_admin_menu()
            else:
                display_main_menu()

        # Menu for Data Engineer
        elif user_input == "2":
            if authenticate("engineer"):
                display_engineer_menu()
                user_input = enter_user_option()
                if user_input == "1":
                    print("Creating new table...")
                    pipelines = ["users", "personal_info", "economic_info", "computer_info"]
                    for pipeline in pipelines:
                        raw_layer = "../data/raw_zone/db_inda_musat_andra_raw.csv"
                        transform = f"transformations/{pipeline}.sql"
                        trusted_layer = f"../data/trusted_zone/db_{pipeline}_trusted.csv"
                        etl.create_table(raw_layer, transform, trusted_layer)
                elif user_input == "2":
                    pipelines = ["users", "personal_info", "economic_info", "computer_info"]
                    print(pipelines)
                    user_input = enter_user_option()
                    if user_input in pipelines:
                        print("Executing simple query...")
                        raw_layer = "../data/raw_zone/db_inda_musat_andra_raw.csv"
                        transform = f"transformations/{user_input}.sql"
                        etl.execute_query(raw_layer, transform, 100)
                        user_input = enter_user_option()
                        if user_input:
                            display_engineer_menu()
                    else:
                        display_engineer_menu()
                elif user_input == "3":
                    print("Exiting...")
                    sys.exit()
                else:
                    display_engineer_menu() 
            else:
                display_engineer_menu() 

        # Menu for Analyst
        elif user_input == "3":
            if authenticate("analyst"):
                display_analyst_menu()
                user_input = enter_user_option()
                if user_input == "1":
                    pipelines = ["users", "personal_info", "economic_info", "computer_info"]
                    print(pipelines)
                    user_input = enter_user_option()
                    if user_input in pipelines:
                        print("Executing simple query...")
                        raw_layer = "../data/raw_zone/db_inda_musat_andra_raw.csv"
                        transform = f"transformations/{user_input}.sql"
                        etl.execute_query(raw_layer, transform, 100)
                        user_input = enter_user_option()
                        if user_input:
                            display_analyst_menu()
                    else:
                        display_analyst_menu()
                elif user_input == "2":
                    print("Exiting...")
                    sys.exit()
                else:
                    display_analyst_menu() 
            else:
                display_analyst_menu() 

        # Menu for Exit
        elif user_input == "4":
            print("Exiting...")
            sys.exit()
        
        # Clear panel after each operation
          # clear_panel()