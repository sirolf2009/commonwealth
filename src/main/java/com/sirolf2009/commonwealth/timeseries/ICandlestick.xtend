package com.sirolf2009.commonwealth.timeseries

import java.util.Date

interface ICandlestick {
	
	def Date getTimestamp()
	def Number getOpen()
	def Number getHigh()
	def Number getLow()
	def Number getClose()
	
}