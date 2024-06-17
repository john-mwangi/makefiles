from utils import output_file, processed_file


def analyze_data():
    # Simulate data analysis
    with open(processed_file, "r") as f:
        data = f.read()
    results = f"Data length: {len(data)}"  # Just an example analysis

    with open(output_file, "w") as f:
        f.write(results)

    print(f"Ran {__file__}")


if __name__ == "__main__":
    analyze_data()
