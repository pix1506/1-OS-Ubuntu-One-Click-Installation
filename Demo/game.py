import random
from colorama import init, Fore
from PyDictionary import PyDictionary

# 初始化 colorama
init(autoreset=True)

# 初始化 PyDictionary
dictionary = PyDictionary()

# 定義不同難度的單詞列表
words_easy = ['apple', 'book', 'cat', 'dog', 'fish']
words_medium = ['python', 'elephant', 'guitar', 'keyboard', 'window']
words_hard = ['automobile', 'encyclopedia', 'transformation', 'institution', 'responsibility']

def get_random_word(level):
    if level == 1:
        return random.choice(words_easy)
    elif level == 2:
        return random.choice(words_medium)
    elif level == 3:
        return random.choice(words_hard)

def display_word_progress(word, guessed_letters):
    display = ""
    for letter in word:
        if letter in guessed_letters:
            display += letter + " "
        else:
            display += "_ "
    return display.strip()

def guess_word_game():
    print(Fore.GREEN + "歡迎來到猜單詞遊戲！")
    print(Fore.YELLOW + "選擇遊戲難度：")
    print(Fore.CYAN + "1. 簡單")
    print(Fore.CYAN + "2. 中等")
    print(Fore.CYAN + "3. 困難")

    # 選擇難度
    while True:
        try:
            level = int(input(Fore.MAGENTA + "請輸入難度 (1, 2, 3): "))
            if level not in [1, 2, 3]:
                print(Fore.RED + "無效選擇，請輸入 1, 2 或 3。")
            else:
                break
        except ValueError:
            print(Fore.RED + "請輸入一個數字。")

    # 根據選擇的難度獲取隨機單詞
    word_to_guess = get_random_word(level)
    guessed_letters = []
    attempts = len(word_to_guess) + 3  # 根據單詞長度給予額外嘗試次數

    # 顯示單詞定義提示
    try:
        word_definition = dictionary.meaning(word_to_guess)
        print(Fore.BLUE + "單詞提示 (定義):")
        print(Fore.YELLOW + str(word_definition))
    except:
        print(Fore.RED + "無法獲取單詞定義。")

    print(Fore.GREEN + "你有 " + str(attempts) + " 次機會來猜對這個單詞。")

    # 遊戲循環
    while attempts > 0:
        print(Fore.CYAN + "\n單詞進度: " + display_word_progress(word_to_guess, guessed_letters))
        guess = input(Fore.MAGENTA + "請猜一個字母: ").lower()

        if len(guess) != 1 or not guess.isalpha():
            print(Fore.RED + "請輸入一個有效的字母！")
            continue

        if guess in guessed_letters:
            print(Fore.YELLOW + "你已經猜過這個字母了。")
        elif guess in word_to_guess:
            print(Fore.GREEN + "猜對了！")
            guessed_letters.append(guess)
        else:
            print(Fore.RED + "猜錯了！")
            guessed_letters.append(guess)
            attempts -= 1
            print(Fore.RED + f"剩餘機會: {attempts}")

        # 檢查是否猜完所有字母
        if all(letter in guessed_letters for letter in word_to_guess):
            print(Fore.GREEN + f"恭喜你，猜對了這個單詞：{word_to_guess}")
            break
    else:
        print(Fore.RED + f"很遺憾，你沒有猜對。正確答案是：{word_to_guess}")

if __name__ == "__main__":
    guess_word_game()
