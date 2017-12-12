package com.sirolf2009.commonwealth.indicator.line

import org.junit.Assert
import org.junit.Test

import static com.sirolf2009.commonwealth.indicator.line.IndicatorTestExtensions.*

class SpreadTest {
	
	val orderbook = orderbook(50, 51)
	
	@Test
	def void test() {
		Assert.assertEquals(1d, Spread.spread(orderbook), 0.0000001d)
	}
	
}
