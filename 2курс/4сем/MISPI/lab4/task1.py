# Example of using a function to check error detection with one distorted bit
import random

def calculate_parity_bit(binary_word):
    # Count the number of ones in the original binary word
    num_ones = sum(binary_word)

    # Determine the parity bit
    return num_ones % 2

def simulate_error(binary_word, parity_bit, num_errors):

    # Invert the specified number of bits
    if num_errors > 0:
        for i in range(num_errors):
            index = random.randint(0, len(binary_word) - 1)  # Random index for inversion
            binary_word[index] = 1 - binary_word[index]

    print("Distorted word:", binary_word)

    # Check if parity is maintained
    if (sum(binary_word) + parity_bit) % 2 == 0:
        return False  # Error detected
    else:
        return True  # Error not detected

# Example of using the function
binary_word = [1, 0, 1, 1]  # Example of the original binary word
print("Original word:", binary_word)
parity_bit = calculate_parity_bit(binary_word)
print("Parity bit:", parity_bit)

num_errors = 1  # One bit distortion
error_detected = simulate_error(binary_word, parity_bit, num_errors)
if error_detected:
    print("Error detected with a distorted bit.")
else:
    print("Error not detected with a distorted bit.")
