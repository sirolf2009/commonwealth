package com.sirolf2009.commonwealth.timeseries

import java.util.List
import org.eclipse.xtend.lib.annotations.Data
import org.eclipse.xtend.lib.annotations.Delegate

@Data class CandlestickSeries implements ICandlestickSeries {
	
	@Delegate
	val List<ICandlestick> candles
	
}