package com.sirolf2009.commonwealth.timeseries.indicators

import static extension com.sirolf2009.commonwealth.timeseries.indicators.IndicatorTestExtensions.*
import org.junit.Test
import org.junit.Assert

class AskAvgDiffTest {
	
	@Test
	def void test() {
		Assert.assertEquals(10d, AskAvgDiff.askAvgDiff(orderbook(#[], #[order(80), order(90), order(100)])).getAsDouble(), 0.001d)
	}
	
}