pragma solidity ^0.5.16;

contract Supplychain
{
    uint public Quality;
    uint public Quantity;
    uint public shippingNumber;
    uint public quantityRecievedfromWarehouse;
    bool public shipped;

    uint public countNumber;

    struct warehouseStock
    {
        uint shippingID;
        uint bags;
        uint kg;
        uint date;
        uint availableStock;
        uint quantitySenttoRoaster;
        string shipmentRecievedBy;
    }

    struct shippingDetails
    {
        uint shippingID;
        uint docketNumber;
        uint kgSent;
        uint numberOfBags;

        string senderCompany;
        string senderAddress;
        string recieverCompany;
        string recieverAddress;

    }

    struct roastingDetails
    {
        uint shippingID;
        uint stockRecieved;
        uint stockSentForRoasting;
        uint stockSentInShipping;
        string qualityInRoasting;
        uint shipmentRecievedDate;
        string shipmentRecieved;
    }

    mapping(uint => warehouseStock) public warehouse;

    mapping(uint => shippingDetails) public shipment;

    mapping (uint => roastingDetails) public roasting;

    constructor() public{
        addShippingDetails(69, 77,  3, 'ssender', 'senderAdd','rreciever', 'rrrecieverAdd');

        addWarehouseStock(69, 30, 6969, 20, 10,  'AjayVora');

        addRoastingData(69, 30, 20, "arabica", 101120, "Ali Mohammadi");

    }

    event addedShippingDetails
    (
        uint shippingID,
        uint docketNumber,
        uint kgSent, 
        uint numberOfBags,
        string senderCompany,
        string senderAddress,
        string recieverCompany,
        string recieverAddress
    );

    event addedWarehouseStock
    (
        uint shippingID,
        uint bags,
        uint kg,
        uint date,
        uint availableStock,
        uint quantitySenttoRoaster,
        string shipmentRecievedBy
    );

    event addedRoastingDetails
    (
        uint shippingID,
        uint stockRecieved,
        uint stockSentForRoasting,
        uint stockSentInShipping,
        string qualityInRoasting,
        uint shipmentRecievedDate,
        string shipmentRecieved
    );

//Adding shipping details
    function addShippingDetails(uint docketNumber, uint kgSent,  uint numberOfBags, string memory senderCompany, string memory senderAddress, string memory recieverCompany, string memory recieverAddress) public 
    {
        shippingNumber ++;

        shipment[shippingNumber] =  shippingDetails(shippingNumber, docketNumber, kgSent, numberOfBags,  senderCompany,senderAddress,recieverCompany, recieverAddress);
        emit addedShippingDetails(shippingNumber, docketNumber, kgSent, numberOfBags, senderCompany,senderAddress, recieverCompany, recieverAddress);
    }

//adding kg of stock recieved
    function addWarehouseStock(uint bags, uint kg, uint date, uint availableStock, uint quantitySenttoRoaster,string memory shipmentRecievedBy) public
    {
        shippingNumber = shippingNumber;
        warehouse[shippingNumber] = warehouseStock(shippingNumber, bags, kg, date, availableStock, quantitySenttoRoaster, shipmentRecievedBy);
        emit addedWarehouseStock(shippingNumber, bags, kg, date, availableStock, quantitySenttoRoaster, shipmentRecievedBy);
    }

    //function for roastingData
    function addRoastingData(uint stockRecieved, uint stockSentForRoasting, uint stockSentInShipping, string memory qualityInRoasting,uint shipmentRecievedDate, string memory shipmentRecieved) public
    {
        shippingNumber = shippingNumber;
        roasting[shippingNumber] =  roastingDetails(shippingNumber, stockRecieved, stockSentForRoasting, stockSentInShipping, qualityInRoasting,shipmentRecievedDate, shipmentRecieved);
        emit addedRoastingDetails(shippingNumber, stockRecieved, stockSentForRoasting, stockSentInShipping, qualityInRoasting,shipmentRecievedDate, shipmentRecieved);
    }

    // function toggleShipped(uint shippingNumber) public {
    //     Supplychain memory _
    // }

function setCount(uint data) public 
{
    countNumber = data;
}


function getWarehouseStock() view external returns (
        uint shippingID,
        uint bags,
        uint kg,
        uint date,
        uint availableStock,
        uint quantitySenttoRoaster,
        string memory shipmentRecievedBy)
        {

            warehouseStock memory w = warehouse[countNumber];

            return (w.shippingID, w.bags, w.kg, w.date, w.availableStock, w.quantitySenttoRoaster, w.shipmentRecievedBy);
        }

        /////////////////////////////////////////

        function getRoastingData() view external returns (
        uint shippingID,
        uint stockRecieved,
        uint stockSentForRoasting,
        uint stockSentInShipping,
        string memory qualityInRoasting,
        uint shipmentRecievedDate,
        string memory shipmentRecieved)
        {

            roastingDetails memory r = roasting[countNumber];

            return (r.shippingID,
        r.stockRecieved,
        r.stockSentForRoasting,
        r.stockSentInShipping,
        r.qualityInRoasting,
        r.shipmentRecievedDate,
        r.shipmentRecieved);
        }

////////////////////////////////////////////////

        function getshippingDetails() view external returns (
        uint shippingID,
        uint docketNumber,
        uint kgSent, 
        uint numberOfBags,
        string memory senderCompany,
        string memory senderAddress,
        string memory recieverCompany,
        string memory recieverAddress)
        {

            shippingDetails memory s = shipment[countNumber];

            return (s.shippingID,
        s.docketNumber,
        s.kgSent, 
        s.numberOfBags,
        s.senderCompany,
        s.senderAddress,
        s.recieverCompany,
        s.recieverAddress);
        }

}
