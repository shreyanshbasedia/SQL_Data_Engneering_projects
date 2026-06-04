S = input()
clean_alpha = ''.join(char for char in S if char.isalpha()).upper()
print('\n '.join(a+b for a in clean_alpha for b in clean_alpha ))
