import itertools


def calculate_error_probability(n, k, p):
    error_prob = 0  # initialize the error probability

    for num_errors in range(n + 1):  # iterate through all possible numbers of errors
        # calculate the probability of having num_errors errors out of n bits
        prob_num_errors = p ** num_errors * (1 - p) ** (n - num_errors)

        # create all possible error combinations (using itertools)
        error_combinations = itertools.combinations(range(n), num_errors)

        for error_combination in error_combinations:
            # check if the error will be detected
            parity_bit = sum(1 for i in error_combination if i < k) % 2
            if parity_bit == 0 and num_errors == 0:
                # error not detected
                error_prob += prob_num_errors

    return error_prob


# Calculate the error detection probability for the (8, 9)-code with an error probability of 0.05
n = 9  # length of the codeword
k = 8  # number of data bits
p = 0.05  # error probability for each bit
error_probability = calculate_error_probability(n, k, p)
print("Error detection probability:", error_probability)

# Calculate the probability of transmitting the message without errors
transmission_probability = 1 - error_probability
print("Probability of transmitting the message without errors:", transmission_probability)
