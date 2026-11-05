
from pathlib import Path

project_dir = Path(__file__).resolve().parent.parent

for folder in ["data", "database", "powerbi"]:
    for file in (project_dir / folder).glob("*"):
        if file.is_file():
            size_mb = file.stat().st_size / (1024 * 1024)
            print(f"{file.name}: {size_mb:.2f} MB")
