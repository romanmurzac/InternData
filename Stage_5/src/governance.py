import sys
import pandas as pd


def display_main_menu():
    print("\n")
    print("CHOOSE DATA TO BE USED")
    print("1. Raw data")
    print("2. Trusted data - computer")
    print("3. Trusted data - economic")
    print("4. Trusted data - personal")
    print("5. Trusted data - users")
    print("6. Exit")
    print("\n")


def display_options_menu():
    print("\n")
    print("CHOOSE GOVERNANCE")
    print("1. Display Info")
    print("2. Display Description")
    print("3. Display Head")
    print("4. Display Sample")
    print("5. Display Tail")
    print("6. Mask data")
    print("7. Format data")
    print("8. Exit")
    print("\n")


def read_data():
    user_input = input("Enter the option: ")
    if user_input == "1":
        df = pd.read_csv("Stage_5/src/data/raw_zone/db_inda_raw.csv")
    elif user_input == "2":
        df = pd.read_csv("Stage_5/src/data/trusted_zone/db_computer_trusted.csv")
    elif user_input == "3":
        df = pd.read_csv("Stage_5/src/data/trusted_zone/db_economic_trusted.csv")
    elif user_input == "4":
        df = pd.read_csv("Stage_5/src/data/trusted_zone/db_personal_trusted.csv")
    elif user_input == "5":
        df = pd.read_csv("Stage_5/src/data/trusted_zone/db_users_trusted.csv")
    elif user_input == "6":
        sys.exit()
    return df


def display_data(data):
    user_input = input("Enter the option: ")
    if user_input == "1":
        print("DATA INFO")
        print(data.info())
    elif user_input == "2":
        print("DATA DESCRIPTION")
        print(data.describe(include="all"))  
    elif user_input == "3":
        print("DATA HEAD")
        print(data.head(10)) 
    elif user_input == "4":
        print("DATA SAMPLE")
        print(data.sample(10))
    elif user_input == "5":
        print("DATA TAIL")
        print(data.tail(10))
    elif user_input == "6":
        data.personal_number = "*****MASKED*****"
        data.to_csv(f"Stage_5/src/data/trusted_zone/db_personal_trusted.csv")
    elif user_input == "7":
        data['phone_number'] = data['phone_number'].str.replace(" ", "")
        data.to_csv(f"Stage_5/src/data/trusted_zone/db_personal_trusted.csv")
    elif user_input == "8":
        sys.exit()


if __name__ == "__main__":
    while True:
        display_main_menu()

        data = read_data()

        display_options_menu()

        display_data(data)
