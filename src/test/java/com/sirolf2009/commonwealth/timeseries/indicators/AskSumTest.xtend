package com.sirolf2009.commonwealth.timeseries.indicators

import static extension com.sirolf2009.commonwealth.timeseries.indicators.IndicatorTestExtensions.*
import org.junit.Test
import org.junit.Assert

class AskSumTest {
	
	@Test
	def void test() {
		Assert.assertEquals(60d, AskSum.askSum(orderbook(#[], #[order(1, 10), order(2, 20), order(3, 30)])), 0.001d)
	}
	
}