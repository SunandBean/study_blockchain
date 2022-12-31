// SPDX-License-Identifier: UNLICENSED
// Suncoins ICO

// Version of compiler
pragma solidity ^0.8.17;

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
}