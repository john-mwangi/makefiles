from pathlib import Path

root_dir = Path(__file__).parent.parent.resolve()

input_file = root_dir / "data/input_data.txt"
output_file = root_dir / "data/results.txt"
processed_file = root_dir / "data/processed_data.txt"
