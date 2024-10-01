import pyautogui
import time
import random


def main():
    while True:
        x = random.randint(100, 200)
        y = random.randint(100, 200)
        pyautogui.moveTo(x, y)
        pyautogui.moveRel(0, 10)
        time.sleep(10)


if __name__ == '__main__':
    main()

