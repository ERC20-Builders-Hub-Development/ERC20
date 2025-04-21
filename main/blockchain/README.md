# 📘 ERC Blockchain Sub-Project

Welcome to the official **ERC20 Builders Hub Blockchain**. This small sub project contains all core blockchain files, tools, and mining software used for testing, simulating, and verifying block challenge solving.

---

## 📂 Project Structure

```
ERC20/
├── main/
│   ├── blockchain/         # Core blockchain JSON blocks
│   ├── software/
│   │   └── miner/
│   │       └── versions/   # Mining software (PyQt6 styled, XMRig themed)
│   └── tools/              # (Optional) CLI tools, future verifiers, etc.
├── README.md               # This file
└── LICENSE
```

---

## ⛏️ Mining Software

> 📍 Location: `main/software/miner/versions/`

### Description:
A PyQt6-based mining software designed to mine challenge hashes from a given blockchain JSON block. It prioritizes performance and user experience by outputting logs every 100 iterations and offering a visual feedback loop during mining.

---

## ⚙️ How It Works

### 📄 Block JSON Format

Your block file **must** be a valid `.json` file structured like this:

```json
{
    "index": 1,
    "timestamp": "2025-04-21T16:42:35.250047",
    "previous_hash": "...",
    "nonce": 283,
    "difficulty": 2,
    "challenge_hash": "76...5E4EAA825F2C...EA0",
    "reward_mbx": 24455,
    "block_hash": "ERC00...22DCC...0EC7F19"
}
```

- `challenge_hash`: This is the hash that the mining software attempts to partially match.
- `difficulty`: A number used only to **estimate mining time**, not actual mining conditions.

---

## 🖥️ How to Use the Miner

### 🧰 Requirements

- Python 3.10+
- Install required packages:
```bash
pip install PyQt6
```

---

### 🚀 Launch the Miner

1. **Navigate to the miner directory**:

```bash
cd main/software/miner/versions/
```

2. **Run the miner**:

```bash
python erc_miner.py
```

> Replace `erc_miner.py` with the actual miner filename if renamed.

---

### 🛠️ Mining Steps

1. The GUI opens up with an XMRig-style terminal.
2. Click **"📂 Load Block JSON"** and select your block file from the `blockchain/` folder.
3. The miner will:
   - Read the `challenge_hash` and `difficulty`
   - Simulate mining with a similarity threshold of **30–50%**
   - Output mining progress every 100 attempts
4. Once mining is successful:
   - You'll receive a **Mined Hash**
   - A **Nonce** used
   - A **Claim Hash** to send to the block owner

---

### 📝 Claim Hash Verification

After solving a block, **send the `claim_hash` to ERC20 Builder Hub Developers or directly to the owner** for verification and potential reward or acknowledgment.

The claim hash is a SHA-256 hash generated from your mined hash, and serves as **proof-of-work** (PoW) under simulated difficulty.
