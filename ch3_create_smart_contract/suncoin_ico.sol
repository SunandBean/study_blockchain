// SPDX-License-Identifier: UNLICENSED
// Suncoins ICO

// Version of compiler
pragma solidity ^0.4.11;

contract suncoin_ico {

    // Introducing the maximum number of Suncoins available for sale
    uint public max_suncoins = 1000000;

    // Introducing the USD to Suncoins conversion rate
    uint public usd_to_suncoins = 1000;

    // Introducing the total numbr of Suncoins that have been bought by the investors
    uint public total_suncoins_bought = 0;

    // Mapping from the investor address to its equity in Suncoins and USD
    mapping(address => uint) equity_suncoins;
    mapping(address => uint) equity_usd;

    // Checking if an investor can buy Suncoins
    modifier can_buy_suncoins(uint usd_invested) {
        require (usd_invested * usd_to_suncoins + total_suncoins_bought <= max_suncoins);
        _;
    }
    
    // Getting the equity in Suncoins of an investor
    function equity_in_suncoins(address investor) external constant returns (uint) {
        return equity_suncoins[investor];
    }

    // Getting the equity in USD of an investor
    function equity_in_usd(address investor) external constant returns (uint) {
        return equity_usd[investor];
    }

    // Buying Suncoins
    function buy_suncoins(address investor, uint usd_invested) external 
    can_buy_suncoins(usd_invested) {
        uint suncoins_bought = usd_invested * usd_to_suncoins;
        equity_suncoins[investor] += suncoins_bought;
        equity_usd[investor] = equity_suncoins[investor] / 1000;
        total_suncoins_bought += suncoins_bought;
    }

    // Selling Suncoins
    function sell_suncoins(address investor, uint suncoins_sold) external {
        equity_suncoins[investor] -= suncoins_sold;
        equity_usd[investor] = equity_suncoins[investor] / 1000;
        total_suncoins_bought -= suncoins_sold;
    }    
}