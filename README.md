# ESP8266
A place to record and collaborate on the NodeMCU (LUA) development environment focused on the ESP8266 (any variant, and not ESP-32)

I am relatively inexperienced in this space.  I do, however, have 2 ESP8266's performing "useful" tasks in my home
1. controls/maintains freezer temperature in a side-by-side refrigerator that is located in an unheated garage.  This control is accomplished by 2 DHT sensors (ambient, freezer) and an auxillary heater located in the refrigerator compartment (yes, you read correctly) under ESP control.
2. monitor 5 zone heating system (zone history, setback history, correlation between burner history and actual natural gas consumption)
Both deployments
- use an RPi syslog feature for "permanent" storage of activity
- reside on breadboards
- have a backup/swappable/secondary module for major code releases (debug offline, plug and play)
- have issues with telnet/ping network connectivity
- manage heap by decomposing functions into small files called by dofile in combination with a global config table for inter file communication (not a place I wanted to be, but the place I find myself)

Areas of exploration

What are the tradeoffs between complexity and capability in this environment?  For example: LUA automatically manages memory (heap) -- where everything -- code and data -- live by default while execution is in progress.  But not too far down the development path, I find limited memory (heap) a major obstacle to my continued progress.  I have had to do "unnatural" things to push this obstacle down the road a bit (unfortunately not off to the side of the road).

What is the cost of each tradeoff considered? For example what are the pluses and minuses of adding LFS to your coding toolbox in order to resolve greatly limited heap?  It was my understanding that with LFS, all LFS resident code would, at least functionally appear to be executed from flash and was NOT loaded into memory (heap) during execution at either the function or module level.  But I have found that during "require" invocation, heap is in fact consumed.  And at the module level, this consumption is not a constant for the module nor a constant for the outwardly facing methods (functions) of the module.  What am I missing?   Understanding why space is consumed is the first step in attempting to balance space vs design/system complexity.

How to pick/develop a coding style consistent with others in this development space?

How does a newbie make the most of this entire platform (hardware, firmware, end user software, community) with the least unnecessary investment (reinvention of the wheel)?  How can newbies give back to the community during this process?  For example, make the learning process even easier/less problematic for the next crop of newbies to come this way.
