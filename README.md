# poba-kovan
Physical Object Blockchain Asset - Dapp to automatically create NFT tokens upon successful order completion using solidty smartcontract and Chainlink oracle for off-chain data fulfillment. 


Overview
1.A physical asset is branded, ie. Unique Identification Number, Barcode, QR Code, RFID, etc.

2.Asset identifiers are stored on a remote database, ie. eCommerce Store, Inventory Database, Cloud Storage. 

3.POBA Token assignment is performed upon successful verification of asset ID or completed order ID #. 

4.Customer retains ownership of unique POBA token in a NFT friendly crypto wallet or POBA web wallet for easy display and transfer. 


#What is it?
(POBA Physical Object Blockchain Asset)
(POBA) is used to full-fill a need in the cybersecurity digital landscape representing an asset tag for Identification, Verification and Authorization of data request and fulfillment. While also providing secure access controls suchs as Iphone enabled crypto wallets, touch screen crypto wallets, and simple qr coded key cards. ( see below)


POBA Tag is based on NFT tokenomics uses Chainlink middle-ware and SmartContracts deployed on the Ethereum blockchain. POBA offers a solution for automating token creation where it is needed most . A web3 interface or Dapp exist to provide end users options to verify POBA enabled products, browse token directory, trade tokens with users and general wallet management. 


POBA can use any off-chain rest-api to provide data for NFT encoding. In this example provided we use a Wordpress CMS with WooCommerce plugin and license key generator with REST api access. 


Endusers verify their products & claim POBA NFT by entering their license key received upon sucessful order completion.  To initiate calls and claim their POBA NFT token users must have a browser wallet (ie. MetaMask) or other erc20 / erc721 NFT enabled wallet. My personal preference is the Iphone MetaMask version because it neatly organizes your NFTs into a separate "collections" category. 


#What you need to build this dApp

1. Rest API + API Key with read-only access
  - For demonstration purposes a pobatag.com api key is provided (*see .env.secret file)
 
 2. Familiarity with deploying SmartContracts using Remix IDE or Truffle to compile.
  
3. ERC721 SmartContract v0.6.6

4. POBA Chainlinked consumer contract v0.6.6

5. Chainlink Oracle w/ POBA adapter
  - You can use FourSwords Kovan Chainlink node for testing. (Oracle: | Job ID:

6. MetaMask Browser Wallet (https://www.metamask.io)

7. Kovan testnet LINK  https://kovan.chain.link

8. Kovan testnet ETH   Best option is using gitter chat room. Just post your Eth address in chat https://gitter.im/kovan-testnet/faucet

