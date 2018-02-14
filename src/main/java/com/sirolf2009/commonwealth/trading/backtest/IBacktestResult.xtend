package com.sirolf2009.commonwealth.trading.backtest

import java.util.List
import com.sirolf2009.commonwealth.trading.IPosition
import java.util.stream.Collectors
import com.sirolf2009.commonwealth.trading.analysis.NumberSeries

interface IBacktestResult {
	
	def List<? extends IPosition> getTrades()
	
	def getProfits() {
		return new NumberSeries(trades.stream().map[profit].collect(Collectors.toList()))
	}
	
	def getProfitPercentages() {
		return new NumberSeries(trades.stream().map[profitPercentage].collect(Collectors.toList()))
	}
		
}