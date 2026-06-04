class Student:
    def __inti__(self,name,house):
        if not name:
            raise ValueError("missing name")
        if house not in ["sainkheda", "chindwara", "gadarawa"]:
            raise ValueError("wrong hoouse name")
        self.name = name
        self.house = house
    
    
def main():
    student = get_student()
    print(f"{student.name} from {student.house}")

def get_student():
    name = input("name : ")
    house = input("house : ")
    return Student(name,house)
    


