package com.sirolf2009.commonwealth.indicator.line

import junit.framework.Assert
import org.junit.Test

import static com.sirolf2009.commonwealth.indicator.line.IndicatorTestExtensions.*

class SMATest {

	@Test
	def void testSmall() {
		val sellVolume = new SellVolume()
		val average = new SMA(2, sellVolume)
		val tradesTick1 = #[
			trade(0, 100, -10),
			trade(10, 100, 10),
			trade(15, 100, 10),
			trade(20, 100, 10),
			trade(25, 100, 10),
			trade(999, 100, 10),
			trade(1000, 100, 10)
		]
		val tradesTick2 = #[
			trade(0, 100, -10),
			trade(10, 100, 10),
			trade(15, 100, 10),
			trade(20, 100, 10),
			trade(25, 100, 10),
			trade(999, 100, 10),
			trade(1000, 100, -10)
		]
		val tradesTick3 = #[
			trade(0, 100, -10),
			trade(10, 100, 10),
			trade(15, 100, 10),
			trade(20, 100, 10),
			trade(25, 100, 10),
			trade(999, 100, -10),
			trade(1000, 100, -10)
		]
		val tradesTick4 = #[
			trade(0, 100, -10),
			trade(10, 100, 10),
			trade(15, 100, 10),
			trade(20, 100, 10),
			trade(25, 100, 10),
			trade(999, 100, 10),
			trade(1000, 100, 10)
		]
		Assert.assertEquals(10, average.apply(tick(tradesTick1)).y.intValue)
		Assert.assertEquals(15, average.apply(tick(tradesTick2)).y.intValue)
		Assert.assertEquals(25, average.apply(tick(tradesTick3)).y.intValue)
		Assert.assertEquals(20, average.apply(tick(tradesTick4)).y.intValue)
	}

}
