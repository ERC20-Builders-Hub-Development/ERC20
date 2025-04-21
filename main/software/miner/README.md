# 📜 Miner Software - ERC Blockchain

Welcome to the **ERC Blockchain Mining Software**. This mining tool shows mining process for challenge hashes from blockchain blocks.

---

## 🏗️ Project Structure

```
main/software/miner/
├── versions/
│   ├── erc_miner.py          # Main mining script
│   ├── release.log          # Logs for updates
└── README.md                 # This file
```

---

## ⚙️ Features

- **Graphical User Interface (GUI)**:
    - PyQt6-based terminal with a modern, XMRig-inspired look.
    - Displays real-time mining progress, logs, and stats.
    - Outputs every 10.00/0 mining attempts to avoid freezes or slowdowns.

- **Challenge Hash Mining**:
    - Input a **block JSON** file containing the challenge hash.
    - Mining by trying to find a nonce that meets the difficulty requirements.

- **Claim Hash Generation**:
    - Once the mining process is successful, the software will generate a **Claim Hash** that can be sent to the block owner for verification.

---

## 🔧 Requirements

Before running the miner, make sure to install the necessary dependencies:

### Dependencies

- Python 3.10+
- Install the required Python libraries:
```bash
pip install PyQt6
```

---

## 🏃‍♂️ How to Run the Miner

1. **Navigate to the miner directory**:

```bash
cd main/software/miner/versions/
```

2. **Launch the mining software**:

```bash
python erc_miner.py
```

This will open the miner's GUI, where you'll interact with the terminal-like interface.

---

## 📥 Loading the Block JSON File

The miner requires a valid block JSON file to start mining. A block file should look like this:

```json
{
  "index": 3,
  "timestamp": "2025-04-21 18:32:00",
  "previous_hash": "ERC0000AB123...",
  "challenge_hash": "ERC5D12B9A8C3F...",
  "difficulty": 2,
  "transactions": [ ... ]
}
```

### To Load the Block File:
1. Click the **"📂 Load Block JSON"** button.
2. Select the desired `.json` file from the blockchain folder.

---

## 🖥️ Mining Process

Once the block JSON is loaded, follow these steps to start mining:

1. **Start Mining**:
   - Click the **"🚀 Start Mining"** button to begin the mining process.
   - The software will calculate the mining difficulty based on the **"difficulty"** field from the JSON.

2. **Mining Status**:
   - The mining process will attempt to solve the **challenge_hash**.
   - The software outputs logs every **10.000 iterations** to prevent freezing.

3. **Mining Completion**:
   - Once a **valid nonce** is found, a **Claim Hash** will be generated.
   - The **Claim Hash** will be shown in the log, which can be sent to the block owner for verification.

---

## 🚨 Prevent Freezes and Slowdowns

The mining software is designed to display mining progress every **100 iterations** to keep the program responsive. This is particularly useful for long mining sessions, as it prevents freezing or slowdowns in the GUI.

---

## 📝 Claim Hash Verification

After a successful mining session, a **Claim Hash** will be generated. This hash serves as proof that you mined the block and found a valid solution. You can send this hash to the block owner for verification.

The **Claim Hash** is derived from the solution that meets the **difficulty threshold**. The owner can use this claim hash to verify that the mining process was completed correctly.

---

## 🛠️ Troubleshooting

- **Issue**: The software freezes or runs slowly during mining.
  - **Solution**: The miner outputs every 10.000 iterations. If you still experience issues, try lowering the difficulty in the block file.
  
- **Issue**: The **Claim Hash** isn't being generated.
  - **Solution**: Ensure your block JSON file contains a valid **challenge_hash** and is formatted correctly.