package com.sirolf2009.commonwealth.indicator.line

import java.time.Duration
import junit.framework.Assert
import org.junit.Test

import static com.sirolf2009.commonwealth.indicator.line.IndicatorTestExtensions.*

class SMATest {

	@Test
	def void testSecond() {
		val sellVolume = new SellVolume()
		val average = new SMA(Duration.ofSeconds(1).toMillis(), sellVolume)
		val tradesTick1 = #[
			trade(0, 100, -10),
			trade(10, 100, 10),
			trade(15, 100, 10)
		]
		val tradesTick2 = #[
			trade(20, 100, 10),
			trade(25, 100, 10),
			trade(999, 100, 10)
		]
		val tradesTick3 = #[
			trade(2000, 100, 10)
		]
		Assert.assertEquals(10, average.apply(tick(tradesTick1)).y.intValue)
		Assert.assertEquals(5, average.apply(tick(tradesTick2)).y.intValue)
		Assert.assertEquals(0, average.apply(tick(tradesTick3)).y.intValue)
	}

	@Test
	def void testHour() {
		val sellVolume = new SellVolume()
		val average = new SMA(Duration.ofHours(1).toMillis(), sellVolume)
		val trades = #[
			trade(0, 100, -10), // in range, should be counted
			trade(10, 100, 10),
			trade(15, 100, 10),
			trade(20, 100, 10),
			trade(25, 100, 10),
			trade(999, 100, -10),
			trade(1000, 100, -10),
			trade(1001, 100, 10)
		]
		Assert.assertEquals(30, average.apply(tick(trades)).y.intValue)
	}

}
