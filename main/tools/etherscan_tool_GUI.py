import sys
import requests
from PyQt6.QtWidgets import (
    QApplication, QMainWindow, QWidget, QVBoxLayout,
    QLabel, QPushButton, QLineEdit, QComboBox, QTextEdit
)
from PyQt6.QtGui import QFont
from PyQt6.QtCore import Qt

# Replace this with the API key you are using for your own use.
# The owner did NOT provided a working API key for safety and security reasons which means you will have to do it on you own.
# Sign up here: https://etherscan.io/register
# Go to API Keys after logging in.
# Click Create New API Key.
# Note: do NOT share your key into the public! If it gets abused you can rotate it.
API_KEY = "YOUR_ETHERSCAN_API_KEY"

class EtherscanTool(QMainWindow):
    def __init__(self):
        super().__init__()
        self.setWindowTitle("Etherscan Tool")
        self.setGeometry(300, 200, 600, 500)

        font = QFont("Segoe UI", 10)
        self.setFont(font)

        self.central_widget = QWidget()
        self.setCentralWidget(self.central_widget)

        self.layout = QVBoxLayout(self.central_widget)

        self.mode_select = QComboBox()
        self.mode_select.addItems(["Search Wallet Address", "Search Token Contract"])
        self.layout.addWidget(self.mode_select)

        self.input_field = QLineEdit()
        self.input_field.setPlaceholderText("Enter wallet or token contract address...")
        self.layout.addWidget(self.input_field)

        self.search_button = QPushButton("Search")
        self.search_button.clicked.connect(self.search)
        self.layout.addWidget(self.search_button)

        self.result_output = QTextEdit()
        self.result_output.setReadOnly(True)
        self.layout.addWidget(self.result_output)

    def search(self):
        self.result_output.clear()
        mode = self.mode_select.currentText()
        address = self.input_field.text().strip()

        if not address:
            self.result_output.setText("⚠️ Please enter a valid address.")
            return

        if mode == "Search Wallet Address":
            self.search_wallet(address)
        else:
            self.search_token(address)

    def search_wallet(self, address):
        eth_url = f"https://api.etherscan.io/api?module=account&action=balance&address={address}&tag=latest&apikey={API_KEY}"
        tx_url = f"https://api.etherscan.io/api?module=account&action=txlist&address={address}&sort=desc&apikey={API_KEY}"

        eth_res = requests.get(eth_url).json()
        tx_res = requests.get(tx_url).json()

        if eth_res['status'] != '1':
            self.result_output.setText("❌ Invalid wallet address.")
            return

        eth_balance = int(eth_res['result']) / 10**18
        self.result_output.append(f"💰 ETH Balance: {eth_balance:.4f} ETH\n")

        self.result_output.append("🔁 Latest Transactions:\n")
        for tx in tx_res.get("result", [])[:5]:
            if tx['to'] == "" or tx['value'] == "0":
                continue  # Skip contract creations or zero txs
            value_eth = int(tx['value']) / 10**18
            self.result_output.append(f"From: {tx['from']}\nTo: {tx['to']}\nAmount: {value_eth:.4f} ETH\n---")

    def search_token(self, contract_address):
        token_info_url = f"https://api.etherscan.io/api?module=token&action=tokeninfo&contractaddress={contract_address}&apikey={API_KEY}"
        abi_url = f"https://api.etherscan.io/api?module=contract&action=getabi&address={contract_address}&apikey={API_KEY}"

        info_res = requests.get(token_info_url).json()
        abi_res = requests.get(abi_url).json()

        if info_res.get("status") != "1":
            self.result_output.setText("❌ Could not fetch token info.")
            return

        token_data = info_res["result"][0]
        name = token_data["tokenName"]
        symbol = token_data["tokenSymbol"]
        total_supply = int(token_data["totalSupply"]) / (10 ** int(token_data["tokenDecimal"]))
        decimals = token_data["tokenDecimal"]

        self.result_output.append(f"📘 Token Name: {name}")
        self.result_output.append(f"🔣 Symbol: {symbol}")
        self.result_output.append(f"🔢 Decimals: {decimals}")
        self.result_output.append(f"📦 Total Supply: {total_supply:.4f}\n")

        # Check ABI for Mint/Burn/Access Control
        if abi_res.get("status") == "1":
            abi_text = abi_res["result"]
            mintable = "mint" in abi_text.lower()
            burnable = "burn" in abi_text.lower()
            blacklistable = "blacklist" in abi_text.lower()

            self.result_output.append(f"➕ Mintable: {'✅' if mintable else '❌'}")
            self.result_output.append(f"🔥 Burnable: {'✅' if burnable else '❌'}")
            self.result_output.append(f"🚫 Blacklist Feature: {'✅' if blacklistable else '❌'}")
        else:
            self.result_output.append("⚠️ Could not fetch ABI for permission checks.")

        # Basic spam/scam detection (heuristics)
        if total_supply > 1e20 or "test" in name.lower():
            self.result_output.append("\n⚠️ This token may be a test or spam token!")

if __name__ == "__main__":
    app = QApplication(sys.argv)
    win = EtherscanTool()
    win.show()
    sys.exit(app.exec())
