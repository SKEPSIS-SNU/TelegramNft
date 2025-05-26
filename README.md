
# 🧾 ClaimableTelegramNFT

**ClaimableTelegramNFT** is an ERC-721 smart contract that allows any user to **claim exactly one NFT**. Ideal for Telegram communities, online events, and public giveaways where each participant can receive a unique NFT without needing manual distribution.

---

## 🚀 Features

- ✅ One-time claim per address  
- 🧠 Based on `ERC721URIStorage`  
- 🔐 Owner can set/update base URI  
- 🌐 Dynamic metadata: `baseURI + tokenId`  
- 📦 Ready to deploy via Remix  

---

## 📄 Contract Overview

| Function              | Description                                          |
|-----------------------|------------------------------------------------------|
| `claimNFT()`          | Mints a new NFT to caller (once per address)         |
| `hasClaimed(address)` | Returns true if the address has already claimed      |
| `setBaseURI(string)`  | Sets or updates the base metadata URI (owner only)   |
| `tokenURI(uint256)`   | Returns full metadata URI for a token                |

---

## 🛠 Deployment via Remix

1. Open [Remix IDE](https://remix.ethereum.org)  
2. Create a new file: `contracts/ClaimableTelegramNFT.sol`  
3. Paste the smart contract code  
4. Compile with Solidity version `^0.8.20`  
5. Deploy using **Deploy & Run Transactions** tab:
   - Choose `Remix VM (London)` or `Injected Provider` (MetaMask)
   - Click **Deploy**

---

## 🖼 Metadata Setup (Optional)

Set a base URI like:

```
ipfs://QmMockCID1234567890abcdef/
```

This will generate URIs such as:

```
ipfs://QmMockCID1234567890abcdef/0
```

Example `0.json` metadata file:

```json
{
  "name": "Telegram Claimable NFT #0",
  "description": "NFT for Telegram user participation",
  "image": "ipfs://QmExampleImageHash/image.png"
}
```

Use services like **NFT.Storage**, **Pinata**, or **web3.storage** to upload metadata and images to IPFS.

---

## 🔍 Example Interaction

- `contract.claimNFT();` – Mints token  
- `contract.tokenURI(0);` – Returns metadata URI  
- `contract.hasClaimed(addr);` – Checks claim status  

---

## 🔐 Access Control

Only the contract **owner** can:  
- Set or update base URI  
- Extend functionality if needed  

---

## 🖼 Explorer Screenshot

![Screenshot 2025-05-26 153402](https://github.com/user-attachments/assets/4154cc9a-4041-4ac3-b00b-686e18ed1939)

---

## 📬 Use Cases & Ideas

This contract is great for:  
- Telegram event rewards  
- Discord giveaways  
- NFT ticketing  

It can be extended with:  
- ✅ Merkle-proof allowlists  
- 🤖 Bot integration (e.g., Telegram bot triggers)  
- 🎨 Dynamic SVG/image generation  

---

## 🧠 Contract Address

```
0x1fbA70E7A768448EC1Bf34DC53558b47De7b872c
```

Deployed on: *Sepolia* (or your testnet of choice)

---

## 🛡 License

**MIT License**
