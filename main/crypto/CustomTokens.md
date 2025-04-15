# Custom Tokens Request Guide

Welcome to the **Custom Tokens Request Guide** for the ERC20 Builders Hub! This guide provides a detailed explanation of the different types of custom tokens available for creation on the Sepolia testnet.

We offer three types of tokens:

1. **Basic Token**
2. **Essential Token**
3. **Taxable Token**

Each token comes with its own features and pricing structure. Please read through the information below to understand which token type best suits your needs.

---

## Token Types and Features

### 1. **Basic Token**
- **Cost:** 0.05 SETH
- **Features:**
  - **Supply Limits:** Set a fixed supply for your token, ensuring no more tokens can be minted beyond the specified amount.
- **Use Case:** Ideal for projects that require a basic ERC20 token with no advanced features.

---

### 2. **Essential Token**
- **Cost:** 0.2 SETH
- **Features:**
  - **Supply Limits:** Just like the Basic Token, you can set a fixed supply for your token.
  - **Ownership:** The token will be owned by a specified address and only that address will have control over the token.
  - **Mintable:** New tokens can be minted by the owner of the contract, allowing for the expansion of the token supply as needed.
  - **Burnable:** The owner can burn tokens, permanently removing them from circulation.
  - **Blacklisting:** Tokens can be blacklisted by the owner, preventing specific addresses from transferring or interacting with the token.

- **Use Case:** Suitable for projects that need control over the token's supply and additional features like minting, burning, and blacklisting.

---

### 3. **Taxable Token**
- **Cost:** 0.6 SETH
- **Features:**
  - **Supply Limits:** Same as the Essential Token, you can set a fixed supply.
  - **Ownership:** The token will be owned by a specified address.
  - **Mintable:** The owner can mint new tokens as needed.
  - **Burnable:** The owner can burn tokens, removing them permanently from circulation.
  - **Blacklisting:** Blacklisting addresses to prevent certain users from interacting with the token.
  - **Transaction Taxes:** Taxes are calculated on each transaction and sent to a custom address, which can be specified during the token creation process. This is ideal for projects that want to implement transaction fees for specific purposes (e.g., community funding, charity donations, or liquidity pool management).

- **Use Case:** Perfect for projects that need to generate revenue through transaction taxes or for those who want to implement unique fee structures within their ecosystem.

---

## How to Request a Custom Token

1. **Determine the Token Type:** Choose from the Basic, Essential, or Taxable token types based on the features and use cases that best suit your project.
   
2. **Provide Necessary Details:**
   - **Token Name:** Choose a name for your token (e.g., MyToken).
   - **Token Symbol:** Choose a short and unique symbol for your token (e.g., MYT).
   - **Supply Limits:** Specify the total supply for your token if applicable.
   - **Transaction Tax Address (for Taxable Tokens only):** Provide the address where the tax fees will be sent.

3. **Submit Your Request:** After you have all the details, submit your token request to the ERC20 Builders Hub team via the designated form or email.

---

## Example Request for an Essential Token

**Token Name:** SampleToken  
**Token Symbol:** STKN  
**Supply Limit:** 1,000,000 STKN  
**Token Type:** Essential Token  
**Transaction Tax Address:** Not applicable (this is only needed for Taxable Tokens)

---

## Important Notes
- **Fees are in SETH:** All token requests are priced in Sepolia ETH (SETH). Ensure that you have enough SETH in your wallet before submitting your request.
- **Testing on Sepolia:** All tokens will be deployed on the Sepolia testnet for testing and development. After successful deployment and testing, you may request to deploy your token on the Ethereum mainnet.
- **Taxable Tokens:** Be sure to understand the transaction tax structure, as it can significantly impact the behavior of your token. Customization of tax percentages and addresses is available.