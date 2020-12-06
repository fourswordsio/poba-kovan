pragma solidity 0.4.24;

import "https://github.com/smartcontractkit/chainlink/blob/develop/evm-contracts/src/v0.4/ChainlinkClient.sol";
import "https://github.com/smartcontractkit/chainlink/blob/develop/evm-contracts/src/v0.4/vendor/Ownable.sol";
import './pobaerc721.sol';

contract YouHaveToDoItAlone5 is ChainlinkClient, Ownable, POBAasset {
  uint256 constant PAYMENT = 1 * LINK;
  bytes32 constant jobId = bytes32("c21ce5725bbd4f4a8aaf1aff31a1ad65");
  uint256 public orderID;

  event RequestOrderIdFulfilled(
    bytes32 indexed requestId,
    uint256 indexed orderId
  );
  constructor() public Ownable() {
    setPublicChainlinkToken();
   setChainlinkOracle(0xa42fdfd2e1a7239b76d753803cbb7611004fe068);

  }
  function RequestorderId(string memory _licenseKey)
  public
  onlyOwner
{
  orderID =0;  
  Chainlink.Request memory req = buildChainlinkRequest(jobId, this, this.fulfillorderId.selector);
   req.add("get", "https://www.pobatag.com/wp-json/lmfwc/v2/licenses/");
req.add("endpoint", _licenseKey);
req.add("queryParams", "/?consumer_key=ck_de406695e5fd6c1c8b31affe38d3777836cd8b39&consumer_secret=cs_4b86569fe912baf6fb666af7ed05c2e7ff11a4d5/");
  req.add("copyPath", "data.orderId");
  sendChainlinkRequest( req, PAYMENT);
}


  function fulfillorderId(bytes32 _requestId, uint256 _orderId)
    public
    recordChainlinkFulfillment(_requestId)
  {
    emit RequestOrderIdFulfilled(_requestId, _orderId);
    orderID = _orderId;
  }
    
  function mintPOBA() public {
      require (orderID>0);
        mintPobaAsset(msg.sender, orderID);
        orderID =0;
    }    


  function getOrderID() public view returns (uint256) {
    return orderID;
  }

  function getChainlinkToken() public view returns (address) {
    return chainlinkTokenAddress();
  }

  function withdrawLink() public onlyOwner {
    LinkTokenInterface link = LinkTokenInterface(chainlinkTokenAddress());
    require(link.transfer(msg.sender, link.balanceOf(address(this))), "Unable to transfer");
  }

  function cancelRequest(
    bytes32 _requestId,
    uint256 _payment,
    bytes4 _callbackFunctionId,
    uint256 _expiration
  )
    public
    onlyOwner
  {
    cancelChainlinkRequest(_requestId, _payment, _callbackFunctionId, _expiration);
  }

  function stringToBytes32(string memory source) private pure returns (bytes32 result) {
    bytes memory tempEmptyStringTest = bytes(source);
    if (tempEmptyStringTest.length == 0) {
      return 0x0;
    }
    assembly { // solhint-disable-line no-inline-assembly
      result := mload(add(source, 32))
    }
  }

}
