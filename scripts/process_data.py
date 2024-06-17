from utils import input_file, processed_file


def process_data(param_1=None, param_2=None):
    # Capture params
    print("\nParams:", param_1, param_2, "\n")

    # Simulate data processing
    with open(input_file, "r") as f:
        data = f.read()
    processed_data = data.upper()  # Just an example transformation

    with open(processed_file, "w") as f:
        f.write(processed_data)

    print(f"Ran {__file__}")


if __name__ == "__main__":
    import sys

    first = sys.argv[1]
    second = sys.argv[2]

    process_data(param_1=first, param_2=second)
