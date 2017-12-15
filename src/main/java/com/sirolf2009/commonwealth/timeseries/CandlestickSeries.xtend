package com.sirolf2009.commonwealth.timeseries

import com.sirolf2009.util.GSonDTO
import java.io.Serializable
import java.util.List
import org.eclipse.xtend.lib.annotations.Data
import org.eclipse.xtend.lib.annotations.Delegate

@Data @GSonDTO class CandlestickSeries implements ICandlestickSeries, Serializable {
	
	@Delegate
	val List<ICandlestick> candles
	
}