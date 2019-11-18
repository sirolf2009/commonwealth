package com.sirolf2009.commonwealth.trading.options

import java.util.Date

/**
 * An Option is a contract that allows you to buy or sell a certain index for a certain price for a certain time 
 * A call option buyer will generate money if the asset rises above the strike price
 * A put option buyer will generate money if the asset falls below the strike price
 * A call option writer will generate money if the asset stays below the strike price
 * A put option writer will generate money if the asset stays above the strike price
 */
interface IOption {
	
	/**
	 * The price for which you will trade if you exercise the option
	 */
	def Number getStrike()
	/**
	 * The amount you spent per share to purchase this option
	 */
	def Number getPrice()
	/**
	 * The amount of shares that are under this option
	 */
	def Number getAmount()
	/**
	 * The date at which the option will expire
	 */
	def Date getExpiration()
	/**
	 * The type of contract, either CALL or PUT
	 */
	def OptionType getType()
	/**
	 * The side of the contract, either BUYER or WRITER
	 */
	def OptionSide getSide()
	
	/**
	 * The amount of money you spent to purchase this option
	 */
	def Number getCost() {
		return getPrice().doubleValue() * getAmount().doubleValue() * 100
	}
	
	/**
	 * CALLS
	 */
	
	/**
	 * The asset needs to reach this price for you to break even
	 */
	def Number getBreakeven() {
		return getStrike().doubleValue() + getPrice()
	}
	
	/**
	 * Calculate the profit at a given price
	 */
	def Number getProfit(Number price) {
		return (price.doubleValue() - getBreakeven().doubleValue()) * getAmount().doubleValue()
	}
	
}