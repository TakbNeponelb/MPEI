encoding_map = {'00': '00', '01': '01', '10': '10', '11': '11'}

def encode_message(message):
    return ''.join([encoding_map.get(message[i:i+2], '') for i in range(0, len(message), 2)])

def decode_message(encoded_message):
    return ''.join([encoding_map.get(encoded_message[i:i+2], '') for i in range(0, len(encoded_message), 2)])

def detect_error(encoded_message, num_errors):
    for i in range(0, len(encoded_message), 2):
        chunk = encoded_message[i:i+2]
        if chunk.count('1') == num_errors:
            return True
    return False

# Example usage:
binary_message = '10101010'
encoded = encode_message(binary_message)
print("Encoded message:", encoded)

# Introduce single error
error_index = 5
encoded_with_error = encoded[:error_index] + '1' + encoded[error_index+1:]
print("Encoded message with single error introduced:", encoded_with_error)

# Decode message
decoded = decode_message(encoded_with_error)
print("Decoded message:", decoded)

# Check if single error can be detected
print("Single error detected:", detect_error(encoded_with_error, 1))

# Introduce double error
encoded_with_double_error = encoded[:error_index] + '1' + encoded[error_index+1:8] + '1' + encoded[10:]
print("Encoded message with double error introduced:", encoded_with_double_error)

# Check if double error can be detected
print("Double error detected:", detect_error(encoded_with_double_error, 2))
