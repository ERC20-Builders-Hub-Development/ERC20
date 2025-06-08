# Using Sepolia Testnet on MetaMask

The **Sepolia testnet** is Ethereum’s official test network, ideal for testing smart contracts, tokens, and dApps **without risking real ETH**.

---

## 🔹 Step 1: Enable Test Networks

MetaMask hides testnets by default. Here's how to reveal them:

1. Open MetaMask Mobile
2. Tap the **menu (☰)** in the top-left
3. Go to **Settings → Advanced**
4. Toggle **“Show test networks”** to ON ✅
5. Go back to the wallet view
6. Tap the **Network Selector** at the top
7. Select **Sepolia Test Network**

If **Sepolia** doesn’t show up:

* Tap **Add network**
* Use the details below:

### Sepolia Network Details

| Field               | Value                           |
| ------------------- | ------------------------------- |
| **Network Name**    | Sepolia Test Network            |
| **New RPC URL**     | `https://rpc.sepolia.org`       |
| **Chain ID**        | `11155111`                      |
| **Currency Symbol** | `SepETH` or `ETH`               |
| **Block Explorer**  | `https://sepolia.etherscan.io/` |

---

## 🔹 Step 2: Get Free Sepolia Test ETH (Faucet)

To test transactions or deploy contracts, you'll need **SepETH** (free test ETH).

### Recommended Faucets (2025):

1. [Alchemy Sepolia Faucet](https://sepoliafaucet.com/)
2. [Chainlink Faucet](https://faucets.chain.link/sepolia)
3. [QuickNode Faucet](https://faucet.quicknode.com/ethereum/sepolia)

### Steps:

* Copy your wallet address from MetaMask
* Visit the faucet site
* Paste your address and request Sepolia ETH
* Wait 30 seconds to a few minutes for confirmation

⏳ **Sepolia is fast**, with \~12 sec block time.

---

## 🔹 Step 3: Test Custom Tokens on Sepolia

### Option A: Add a pre-existing test token

1. Find the test token's contract address (on Sepolia block explorer or GitHub)
2. In MetaMask, go to your **Sepolia wallet**
3. Tap **Import Tokens → Custom Token**
4. Paste the token’s:

   * **Contract Address**
   * **Symbol**
   * **Decimals**

### Option B: Deploy your own test token (ERC-20)

Use Remix IDE or Hardhat:

#### With [Remix](https://remix.ethereum.org/)

1. Write or paste an ERC-20 smart contract
2. Connect MetaMask via **Injected Web3**
3. Choose **Sepolia network**
4. Compile & Deploy the contract
5. Copy the deployed contract address
6. Import it into MetaMask to see your test token

---

## 🔹 Step 4: Send / Receive on Sepolia

* Use MetaMask to **send Sepolia ETH or test tokens** to other addresses
* Watch them arrive within seconds
* View transactions on [Sepolia Etherscan](https://sepolia.etherscan.io/)

---

## 🔹 Step 5: DApp Testing on Sepolia (Optional)

If you're developing a dApp:

* Point your DApp's web3 provider to Sepolia RPC
* Use WalletConnect to connect MetaMask mobile to your dApp
* Test token interactions, staking, swaps, etc.

---

## Why Use Sepolia?

* **Safe & Free**: No real ETH involved
* **Widely supported**: Tools like Hardhat, Foundry, Chainlink support it
* **Ethereum-equivalent**: Mimics mainnet behavior closely

