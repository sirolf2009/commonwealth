package com.sirolf2009.commonwealth.trading.backtest

import java.util.List
import com.sirolf2009.commonwealth.trading.IPosition
import java.util.stream.Collectors
import com.sirolf2009.commonwealth.trading.analysis.NumberSeries

interface IBacktestResult {
	
	def List<? extends IPosition> getTrades()
	
	def getMaxDrawdown() {
		return new NumberSeries(trades.stream().map[maxDrawdown].collect(Collectors.toList()))
	}
	
	def getMaxDrawup() {
		return new NumberSeries(trades.stream().map[maxDrawup].collect(Collectors.toList()))
	}
	
	def getProfits() {
		return new NumberSeries(trades.stream().map[profit].collect(Collectors.toList()))
	}
	
	def getProfitPercentages() {
		return new NumberSeries(trades.stream().map[profitPercentage].collect(Collectors.toList()))
	}
	
	def getSizes() {
		return new NumberSeries(trades.stream().map[Math.abs(size.doubleValue)].collect(Collectors.toList()))
	}
		
}