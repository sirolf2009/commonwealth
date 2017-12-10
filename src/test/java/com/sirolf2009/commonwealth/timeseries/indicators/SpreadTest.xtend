package com.sirolf2009.commonwealth.timeseries.indicators

import static extension com.sirolf2009.commonwealth.timeseries.indicators.IndicatorTestExtensions.*
import org.junit.Test
import org.junit.Assert

class SpreadTest {
	
	val orderbook = orderbook(50, 51)
	
	@Test
	def void test() {
		Assert.assertEquals(1d, Spread.spread(orderbook), 0.0000001d)
	}
	
}