import sys

def main():
  _, *args = sys.argv
  if len(args) < 2:
    print('Not enough arguments: expected a hex value and a description for a unicode character.')
    exit()

  code, *description = args
  char = chr(int('0x'+code, 16))
  print(f'{char} {" ".join(description)}; {code.upper()};')

if __name__ == '__main__':
  main()
