# 🤝 Contributing to ERC20 Builders Hub

Thank you for considering contributing to the **ERC20 Builders Hub**! This repository is an open and collaborative space for developers, educators, and blockchain enthusiasts to contribute smart contracts, templates, and tools that extend the ERC20 ecosystem.

We welcome pull requests, issue reports, documentation updates, and community discussions. Please read through this guide to ensure your contributions align with our standards and community values.

---

## 📁 Repository Overview

This repository contains:

- ✅ Reusable **ERC20 smart contracts**
- 🧰 Templates & boilerplate setups
- 🚀 Official token releases
- 🧪 Utility scripts & test tools

For a breakdown of folders, see [README.md](./README.md).

---

## 📌 Contribution Guidelines

### 1. 💡 What Can I Contribute?

You may contribute in the following ways:

- 📦 New ERC20 smart contract variants (e.g., capped, upgradable, etc.)
- 📚 Educational templates for developers and learners
- 🧪 Unit and integration tests
- 🛠️ Development utilities (deployment, gas reporting, etc.)
- 📘 Documentation improvements or translations
- 🐛 Bug fixes or security improvements

---

### 2. 🧱 Folder Structure & Placement

| Folder              | What Goes Here                                     |
|---------------------|----------------------------------------------------|
| `/main/crypto/`     | Listing documents for Builders Hub token releases |
| `/main/code/erc20/` | ERC20-related contracts outside of templates       |
| `/main/code/other/` | Other Solidity contracts (non-ERC20)               |
| `/main/code/contracts/` | Solidity Smart contracts               |

---

## ⚙️ Development Setup

1. **Fork** this repository and **clone** it to your local machine.
2. Install dependencies:

```bash
npm install
# or
yarn install
```

3. Compile contracts (Hardhat):
```bash
npx hardhat compile
```

4. Run tests:
```bash
npx hardhat test
```

---

## 🧪 Contribution Requirements

- ✅ **Use OpenZeppelin libraries** where applicable.
- ✅ Follow Solidity style best practices (0.8.x or higher).
- ✅ Include test cases with your contracts if they include logic.
- ✅ Include a `README.md` for each new template or example project.
- ❌ Avoid pushing compiled artifacts (`/artifacts/`, `/cache/`, etc.).
- ✅ Comment your code where necessary.

---

## ✅ Pull Request Process

1. Create a branch from `main`:
   ```
   git checkout -b feature/my-awesome-feature
   ```

2. Push your changes:
   ```
   git push origin feature/my-awesome-feature
   ```

3. Open a pull request (PR) and describe:
   - The purpose of your PR
   - Where your files are located
   - Any considerations for testing or deployment

4. Wait for review! We'll give you feedback or merge.

---

## 🛡️ Code of Conduct

We are committed to providing a respectful and harassment-free experience for everyone. Please review our [Code of Conduct](./CODE_OF_CONDUCT.md) before contributing.
