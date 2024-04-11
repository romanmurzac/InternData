import sys
import pandas as pd
import hashlib


def display_main_menu():
    print("\n")
    print("CHOOSE DATA TO BE USED")
    print("1. Raw data")
    print("2. Trusted data - computer_info")
    print("3. Trusted data - economic_info")
    print("4. Trusted data - personal_info")
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
    print("6. Encrypt data")
    print("7. Format data")
    print("8. Exit")
    print("\n")


def read_data():
  user_input = input("Enter the option: ")
  if user_input == "1":
    df = pd.read_csv(r"C:\Users\andra\Intern Data Project\InternData\Stage_5\Musat_Andra\data\raw_zone\db_inda_musat_andra_raw.csv")
  elif user_input == "2":
    df = pd.read_csv(r"C:\Users\andra\Intern Data Project\InternData\Stage_5\Musat_Andra\data\trusted_zone\db_computer_info_trusted.csv")
  elif user_input == "3":
    df = pd.read_csv(r"C:\Users\andra\Intern Data Project\InternData\Stage_5\Musat_Andra\data\trusted_zone\db_economic_info_trusted.csv")
  elif user_input == "4":
    df = pd.read_csv(r"C:\Users\andra\Intern Data Project\InternData\Stage_5\Musat_Andra\data\trusted_zone\db_personal_info_trusted.csv")
  elif user_input == "5":
    df = pd.read_csv(r"C:\Users\andra\Intern Data Project\InternData\Stage_5\Musat_Andra\data\trusted_zone\db_users_trusted.csv")
  elif user_input == "6":
    sys.exit()
  return df


def display_table_options():
    print("CHOOSE TABLE:")
    print("1. users")
    print("2. personal_info")
    print("3. economic_info")
    print("4. computer_info")
    choice = input("Enter the option: ")
    tables = {
        "1": "users",
        "2": "personal_info",
        "3": "economic_info",
        "4": "computer_info"
    }
    chosen_table = tables.get(choice)
    if chosen_table:
        return chosen_table.lower()
    else:
        print("Invalid option.")
        return None


def get_column_name(table):
    column_names = {
        "users": ["first_name", "last_name"],
        "personal_info": ["phone_number", "birthdate", "address", "job"],
        "economic_info": ["iban", "currency"],
        "computer_info": ["ip_address", "mac_address"]
    }
    print(f"Columns available in table {table}: {', '.join(column_names[table])}")
    column_choice = input("Enter the column name: ")
    if column_choice in column_names[table]:
        return column_choice
    else:
        print("Invalid column name.")
        return None


def encrypt_data(data, column_name):
    data[column_name] = data[column_name].apply(lambda x: hashlib.sha256(x.encode()).hexdigest())
    return data


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
        chosen_table = None
        while chosen_table is None:
            chosen_table = display_table_options()
        column_name = get_column_name(chosen_table)
        if column_name:
            data = encrypt_data(data, column_name)
            data.to_csv(fr"C:\Users\andra\Intern Data Project\InternData\Stage_5\Musat_Andra\data\trusted_zone\db_{chosen_table}_trusted.csv")
            print("Masked data:")
            print(data.head(10))
    elif user_input == "7":
        chosen_table = None
        while chosen_table is None:
            chosen_table = display_table_options()
        column_name = get_column_name(chosen_table)
        if column_name:
            data[column_name] = data[column_name].str.replace(" ", "")
            data.to_csv(fr"C:\Users\andra\Intern Data Project\InternData\Stage_5\Musat_Andra\data\trusted_zone\db_{chosen_table}_trusted.csv")
            print("Formatted data:")
            print(data.head(10))
    elif user_input == "8":
        sys.exit()
    else:
        print("Invalid option. Please choose again.")


if __name__ == "__main__":
    while True:
        display_main_menu()

        data = read_data()

        display_options_menu()

        display_data(data)