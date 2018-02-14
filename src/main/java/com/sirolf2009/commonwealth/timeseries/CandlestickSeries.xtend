package com.sirolf2009.commonwealth.timeseries

import java.io.Serializable
import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Data

@Data class CandlestickSeries extends ArrayList<ICandlestick> implements ICandlestickSeries, Serializable {

	new(List<? extends ICandlestick> candles) {
		super(candles)
	}
	
}