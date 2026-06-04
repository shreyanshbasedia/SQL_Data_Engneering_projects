import re

email = input("enter the email : ").strip()

if re.search(r"^\w+@\w+\.edu$",email,re.IGNORECASE):
    print("valid")
else:
    print("invalid") 