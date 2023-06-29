########################
# HX-2023-06-20: 30 points
########################
"""
Given a history of wordle hints, this function returns a
word as the player's guess. THIS GUESS SHOULD NOT CONTRADICT
ANY ONE OF THE HINTS GIVEN.
"""
########################################################################
def wordle_guess(hints):
    word_length = len(hints[0])
    correct_positions = [''] * word_length
    incorrect_positions = []
    for hint in hints:
        for i, (num, char) in enumerate(hint):
            if num == 1:
                correct_positions[i] = char
            elif num == 2:
                incorrect_positions.append(char)
    for i in range(word_length):
        if correct_positions[i] == '':
            for char in incorrect_positions:
                if char not in correct_positions:
                    correct_positions[i] = char
                    incorrect_positions.remove(char)
                    break
    return ''.join(correct_positions)




 



########################################################################