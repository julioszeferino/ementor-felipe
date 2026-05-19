from pathlib import Path

import pytest

ROOT = Path(__file__).resolve().parents[2]
pytestmark = pytest.mark.tac


def test_terraform_root_files_exist() -> None:
    required = [
        ROOT / "terraform" / "main.tf",
        ROOT / "terraform" / "variables.tf",
        ROOT / "terraform" / "outputs.tf",
        ROOT / "terraform" / "providers.tf",
        ROOT / "terraform" / "versions.tf",
    ]

    missing = [str(path) for path in required if not path.exists()]
    assert not missing, f"Missing Terraform skeleton files: {missing}"


def test_required_module_directories_exist() -> None:
    required_dirs = [
        ROOT / "terraform" / "modules" / "cold_layer",
        ROOT / "terraform" / "modules" / "hot_layer",
        ROOT / "terraform" / "modules" / "data_lake",
        ROOT / "terraform" / "modules" / "governance_monitoring",
    ]

    missing = [str(path) for path in required_dirs if not path.exists()]
    assert not missing, f"Missing module directories: {missing}"
